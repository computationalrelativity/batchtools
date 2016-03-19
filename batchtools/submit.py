import command
import batchtools
from batchtools.utils import get_segment_list

import datetime
import re
import subprocess as sp
import os
import sys

class DummyBatch:
    cmd  = "echo"
    expr = "(.+)"
class LoadLevel:
    cmd  = "llsubmit"
    expr = "llsubmit: The job \"(.+?)\" has been submitted."
class PBS:
    cmd  = "qsub"
    expr = "(.+)"
class SLURM:
    cmd  = "sbatch"
    expr = "Submitted batch job (\d+)"

class SubmitJob(command.Abstract):
    """
    Submits a batch job to a queueing system
    """
    name    = "submit"
    desc    = "Submits a job to the queueing system"
    helpstr = """\
Usage: batchtools submit BATCH ID

Submits a job to the queueing system and writes the job ID into the file
output-ID/JOBID. If the JOBID file already exist, the command will abort.

ID should be a valid segment ID.

BATCH is used to specify the queueing system. Supported options are
    --loadlevel : for the LoadLevel queueing system (uses llsubmit)
    --pbs       : for the PBS queueing system (uses qsub)
    --slurm     : for the SLURM queueing system (uses sbatch)\
"""
    def run(self, args):
        if not os.path.exists("BATCH"):
            s = """\
The current directory seems not to be initialized. Did you forget to run
\'batchtools init\'?\
"""
            sys.exit(s)

        if len(args) < 2:
            sys.exit(SubmitJob.helpstr)

        try:
            queue = {
                # Undocumented debugging option
                "--dummy"     : DummyBatch,
                "--loadlevel" : LoadLevel,
                "--pbs"       : PBS,
                "--slurm"     : SLURM,
            }[args[0]]
        except KeyError:
            sys.exit("Invalid or not supported queueing system: \"{0}\"".format(
                args[0]))

        try:
            sid = int(args[1])
            if sid not in get_segment_list():
                raise ValueError
        except ValueError:
            sys.exit("Invalid segment ID: \"{0}\".".format(args[1]))
        segment = str(sid).zfill(4)

        path = "./output-" + segment
        if os.path.isfile(path + "/JOBID"):
            sys.exit("Job ID file already exist: \"{0}/JOBID\".".format(path))

        cmd = queue.cmd + " batch.sub"
        p = sp.Popen(cmd, shell=True, cwd=path, stdout=sp.PIPE, stderr=sp.PIPE)
        stdout, stderr = p.communicate()
        if p.returncode != 0:
            sys.stderr.write("Submission failed: \"{0}\" returned non-zero exit "
                    "status \"{1}\"\n".format(cmd, p.returncode))
            sys.stdout.write(stdout)
            sys.stderr.write(stderr)
            exit(1)
        msg = "Submitted segment: {0}".format(segment)

        jobid = None
        for l in stdout.splitlines():
            match = re.match(queue.expr, l)
            if match is not None:
                jobid = match.group(1)
                msg +=  "\nJob ID: {0}".format(jobid)
                open(path + "/JOBID", "w").write(jobid + "\n")
                break
        if jobid is None:
            msg += "\nCould not parse job ID from submit output:\n"
            msg += stdout

        print(msg)
        logfile = open("BATCH/log", "a")
        logfile.write(datetime.datetime.now().strftime("%A, %d. %B %Y %I:%M%p"))
        logfile.write("\n" + msg + "\n\n")
        logfile.close()

command.register(SubmitJob())

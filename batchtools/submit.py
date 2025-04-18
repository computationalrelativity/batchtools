import batchtools.command as command
import batchtools
import batchtools.replace as replace
from batchtools.utils import get_segment_list, print_segment_id

import datetime
import re
import subprocess as sp
import os
import sys

""" Abstract class for a queueing system """
class QueueingSystem(object):
    pass

class AtBatch(QueueingSystem):
    name = "at"
    cmd  = "at -f {batch} \"now\" 2>&1"
    expr = "job (\d+) at (.+)"
    perm = False
class Bridge(QueueingSystem):
    name = "bridge"
    cmd  = "ccc_msub {batch}"
    expr = "Submitted Batch Session (.+)"
    perm = False
class Cobalt(QueueingSystem):
    name = "cobalt"
    cmd  = "qsub {batch}"
    expr = "(.+)"
    perm = True
class DummyBatch(QueueingSystem):
    name = "dummy"
    cmd  = "echo {batch}"
    expr = "(.+)"
    perm = False
class LoadLevel(QueueingSystem):
    name = "loadlevel"
    cmd  = "llsubmit {batch}"
    expr = "llsubmit: The job \"(.+?)\" has been submitted."
    perm = False
class PBS(QueueingSystem):
    name = "pbs"
    cmd  = "qsub {batch}"
    expr = "(.+)"
    perm = False
class SGE(QueueingSystem):
    name = "sge"
    cmd  = "qsub {batch}"
    expr = "Your job (\d+) \(\".+\"\) has been submitted"
    perm = False
class SLURM(QueueingSystem):
    name = "slurm"
    cmd  = "sbatch {batch}"
    expr = "Submitted batch job (\d+)"
    perm = False

class SubmitJob(command.Abstract):
    """
    Submits a batch job to a queueing system
    """
    name    = "submit"
    desc    = "Submits a job to the queueing system"
    helpstr = """\
Usage: batchtools submit [ID]

Submits a job to the queueing system and writes the job ID into the file
output-ID/JOBID. If the JOBID file already exist, the command will abort.

If ID is not specified then the largest available segment ID is used.
"""
    def run(self, args):
        if not os.path.exists("BATCH"):
            s = """\
The current directory seems not to be initialized. Did you forget to run
\'batchtools init\'?\
"""
            sys.exit(s)

        try:
            sid = int(args[0])
            if sid not in get_segment_list():
                sys.exit("Invalid segment ID: \"{0}\".".format(sid))
        except IndexError:
            segments = get_segment_list()
            if len(segments) > 0:
                sid = max(segments)
            else:
                sys.exit("Cannot submit simulation: no segments found.")

        replace.read_rules("BATCH/CONFIG")
        try:
            qtype = replace.get_rule("BATCHSYSTEM").subst
        except KeyError:
            qtype = ""
        if qtype == "":
            sys.exit("You need to set the BATCHSYSTEM option in BATCH/CONFIG")

        qtypes = dict([(x.name, x) for x in QueueingSystem.__subclasses__()])
        try:
            queue = qtypes[qtype.lower()]
        except KeyError:
            sys.stderr.write("Unknown queueing system: "
                    "\"{0}\".\n".format(qtype))
            sys.stderr.write("Valid values are:\n")
            for k in list(qtypes.keys()):
                sys.stderr.write(" "*4 + k + "\n")
            exit(1)

        segment = print_segment_id(sid)
        path = "./output-" + segment
        if os.path.isfile(path + "/JOBID"):
            sys.exit("Job ID file already exist: \"{0}/JOBID\".".format(path))

        # make batch.sub executable if required by queueing system
        if queue.perm:
            os.chmod(path + "/batch.sub", 0o755)

        cmd = queue.cmd.format(batch="batch.sub")
        p = sp.Popen(cmd, shell=True, cwd=path, stdout=sp.PIPE, stderr=sp.PIPE)
        stdout, stderr = p.communicate()
        stdout = stdout.decode("utf-8")
        stderr = stderr.decode("utf-8")
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

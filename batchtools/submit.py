import command
import batchtools
from batchtools.utils import get_segment_list

import datetime
import subprocess
import os
import sys

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
            print(s)
            exit(1)

        if len(args) < 2:
            print(SubmitJob.helpstr)
            exit(1)

        cmd = None
        if args[0] == "--loadlevel":
            cmd = "llsubmit"
        elif args[0] == "--pbs":
            cmd = "qsub"
        elif args[0] == "--slurm":
            cmd = "sbatch"
        if cmd is None:
            print("Invalid or not supported queueing system: \"{0}\"".format(
                args[1]))
            exit(1)

        try:
            sid = int(args[1])
            if sid not in get_segment_list():
                raise ValueError
        except ValueError:
            print("Invalid segment ID: \"{0}\".".format(args[1]))
            exit(1)
        segment = str(sid).zfill(4)

        path = "./output-" + segment
        if os.path.isfile(path + "/JOBID"):
            print("Job ID file already exist: \"{0}/JOBID\".".format(path))
            exit(1)

        cmd = "cd " + path + ";" + cmd + " batch.sub > JOBID"
        os.system(cmd)

        msg = "Submitted segment {0}".format(segment)
        print(msg)
        logfile = open("BATCH/log", "a")
        logfile.write(datetime.datetime.now().strftime("%A, %d. %B %Y %I:%M%p"))
        logfile.write("\n" + msg + "\n\n")
        logfile.close()

command.register(SubmitJob())

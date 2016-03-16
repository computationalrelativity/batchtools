import command
import batchtools
import batchtools.replace as replace

import datetime
from glob import glob
import os
import shutil
import sys
import re

class Init(command.Abstract):
    """
    Initializes the current working directory
    """
    name    = "init"
    desc    = "Initializes the current working directory"
    helpstr = """\
Usage: batchtools init -b|--batch BATCH -e|--exe EXE -p|--parfile PARFILE

Initializes the current directory structure. Please edit the BATCH/CONFIG file
to configure the simulation, before creating segments.\
"""
    def run(self, args):
        batch   = None
        exe     = None
        parfile = None
        try:
            for i, t in enumerate(args):
                if t == "-b" or t == "--batch":
                    batch = args[i+1]
                elif t == "-e" or t == "--exe":
                    exe = args[i+1]
                elif t == "-p" or t == "--parfile":
                    parfile = args[i+1]
        except IndexError:
            sys.exit("Unable to parse the options!")
        if batch is None or not os.path.isfile(batch):
            sys.stderr.write("You need to specify the batch script to use\n")
            sys.stderr.write(Init.helpstr + "\n")
            exit(1)
        if exe is None or not os.path.isfile(exe):
            sys.stderr.write("You need to specify the executable to use\n")
            sys.stderr.write(Init.helpstr + "\n")
            exit(1)
        if parfile is None or not os.path.isfile(parfile):
            sys.stderr.write("You need to specify the parfile to use\n")
            sys.stderr.write(Init.helpstr + "\n")
            exit(1)

        simpath = os.path.abspath(".")
        if os.path.exists("BATCH"):
            sys.exit("The current folder seems to have already been initialized")
        os.mkdir("BATCH")

        shutil.copy(batch,   "BATCH/batch.t")
        shutil.copy(exe,     "BATCH/exec")
        shutil.copy(parfile, "BATCH/parfile.t")

        s = open(batch, "r").read() + "\n"
        s += open(parfile, "r").read()
        keys = sorted(list(set([k for k in re.findall(r'@(\w+)@', s)])))
        for k in keys:
            if not replace.exists(k):
                replace.add_rule(k, "")

        open("BATCH/CONFIG", "w").write(replace.write_rules())

        s  = "BATCHSCRIPT : " + batch + "\n"
        s += "EXECUTABLE  : " + os.path.abspath(exe) + "\n"
        s += "PARFILE     : " + os.path.abspath(parfile) + "\n"
        print(s),

        logfile = open("BATCH/log", "w")
        logfile.write(datetime.datetime.now().strftime("%A, %d. %B %Y %I:%M%p"))
        logfile.write("\n" + s + "\n\n")
        logfile.close()

command.register(Init())

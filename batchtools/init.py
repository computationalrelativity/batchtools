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

Initializes the current directory structure.
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
            print("Unable to parse the options!")
            exit(1)
        if batch is None or not os.path.isfile(batch):
            print("You need to specify the batch script to use")
            print(Init.helpstr)
            exit(1)
        if exe is None or not os.path.isfile(exe):
            print("You need to specify the executable to use")
            print(Init.helpstr)
            exit(1)
        if parfile is None or not os.path.isfile(parfile):
            print("You need to specify the parfile to use")
            print(Init.helpstr)
            exit(1)

        simpath = os.path.abspath(".")
        if os.path.exists("BATCH"):
            print("The current folder seems to have already been initialized")
            exit(1)
        os.mkdir("BATCH")

        shutil.copy(batch,   "BATCH/batch.t")
        shutil.copy(exe,     "BATCH/exec")
        shutil.copy(parfile, "BATCH/parfile.t")

        replace.update_rule('EXECUTABLE', simpath + "/BATCH/exec")

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

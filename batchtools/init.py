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
                      [-i|--include FILE1 [-i|--include FILE2 [...]]]

Initializes the current directory structure.\
"""
    def run(self, args):
        batch   = None
        exe     = None
        include = []
        parfile = None
        try:
            while len(args) > 0:
                t = args.pop(0)
                if t == "-b" or t == "--batch":
                    batch = args.pop(0)
                elif t == "-e" or t == "--exe" or t == "--exec":
                    exe = args.pop(0)
                elif t == "-i" or t =="--include":
                    include.append(args.pop(0))
                elif t == "-p" or t == "--parfile":
                    parfile = args.pop(0)
                else:
                    sys.exit("Unkown command: \"{0}\"!".format(t))
        except IndexError:
            sys.exit("Unable to parse the options!")
        if batch is None:
            sys.exit("You need to specify the batch script to use.")
        if not os.path.isfile(batch):
            sys.exit("Batchfile \"{0}\" not found.".format(batch))
        if exe is None:
            sys.exit("You need to specify the executable to use.")
        if not os.path.isfile(exe):
            sys.exit("Exeecutable file \"{0}\" not found.".format(exe))
        if parfile is None:
            sys.exit("You need to specify the parameter file to use.")
        if not os.path.isfile(parfile):
            sys.exit("Parameter file \"{0}\" not found.".format(parfile))

        for f in include:
            if not os.path.isfile(f):
                sys.exit("\"{0}\": not such file.".format(f))

        simpath = os.path.abspath(".")
        if os.path.exists("BATCH"):
            sys.exit("The current folder seems to have already been initialized")
        os.mkdir("BATCH")

        shutil.copy(batch,   "BATCH/batch.t")
        shutil.copy(exe,     "BATCH/exec")
        shutil.copy(parfile, "BATCH/parfile.t")

        if len(include) > 0:
            os.mkdir("BATCH/include")
            for f in include:
                shutil.copy(f, "BATCH/include")

        s = open(batch, "r").read() + "\n"
        s += open(parfile, "r").read()
        keys = sorted(list(set([k for k in re.findall(r'@(\w+)@', s)])))
        for k in keys:
            if not replace.exists(k):
                replace.add_rule(k, "")

        open("BATCH/CONFIG", "w").write(replace.write_rules())

        s  = "BATCHSCRIPT : " + os.path.abspath(batch) + "\n"
        s += "EXECUTABLE  : " + os.path.abspath(exe) + "\n"
        s += "PARFILE     : " + os.path.abspath(parfile) + "\n"
        for f in include:
            s += "INCLUDE     : " + os.path.abspath(f) + "\n"
        s += "\nPlease edit the BATCH/CONFIG file to configure the simulation.\n"
        print(s),

        logfile = open("BATCH/log", "w")
        logfile.write(datetime.datetime.now().strftime("%A, %d. %B %Y %I:%M%p"))
        logfile.write("\n" + s + "\n\n")
        logfile.close()

command.register(Init())

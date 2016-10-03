import command
import batchtools
import batchtools.replace as replace
from batchtools.utils import get_segment_list, print_segment_id

import datetime
import os
import shutil
import sys
import re

class MakeSegment(command.Abstract):
    """
    Creates a new segment for the current simulation
    """
    name    = "makesegment"
    desc    = "Creates a new segment for the current simulation"
    helpstr = """\
Usage: batchtools makesegment [-i|--id newid] [-p|--parent parentid|--no-parent]

Creates a new segment for the current simulation. If parentid is negative, then
this creates a new initial segment.

NOTE: The output of this command depends on the contents of ./BATCH/CONFIG.\
"""
    def run(self, args):
        if not os.path.exists("BATCH"):
            s = """\
The current directory seems not to be initialized. Did you forget to run
\'batchtools init\'?\
"""
            sys.exit(s)
        noparent = False
        iold = None
        inew = None
        try:
            while len(args) > 0:
                t = args.pop(0)
                if t == "-i" or t == "--id":
                    inew = int(args.pop(0))
                elif t == "--no-parent" or t == "--no-parents":
                    noparent = True
                elif t == "-p" or t == "--parent":
                    iold = int(args.pop(0))
                else:
                    sys.exit("Unkown command: \"{0}\"!".format(t))
        except IndexError:
            sys.exit("Unable to parse the options!")
        except ValueError as e:
            sys.stderr.write("Unable to parse the options!\n")
            sys.stderr.write(e)
            exit(1)

        if noparent:
            if iold is None:
                iold = -1
            else:
                sys.exit("You cannot specify both --no-parent and --parent")

        segments = get_segment_list()
        if inew is None:
            if len(segments) == 0:
                inew = 0
            else:
                inew = max(segments) + 1
        if iold is None:
            iold = inew - 1
        if iold >= 0 and iold not in segments:
            sys.exit("Unvalid parent ID: {0}".format(iold))

        segment = print_segment_id(inew)
        rundir  = "output-" + segment

        replace.read_rules("BATCH/CONFIG")
        replace.set_rule("RUNDIR", os.path.abspath(".") + "/" + rundir)
        replace.set_rule("SEGMENT", segment)

        batch = open("BATCH/batch.t", "r").read()
        batch = replace.apply_rules(batch)

        par = open("BATCH/parfile.t", "r").read()
        par = replace.apply_rules(par)

        os.mkdir(rundir)
        msg = "Created segment: {0}".format(segment)
        if iold >= 0:
            oldsegment = print_segment_id(iold)
            parent = "output-" + oldsegment
            msg += " with parent {0}".format(oldsegment)
            os.symlink("../" + parent, rundir + "/parent")
            open(rundir + "/PREVIOUS", "w").write(str(iold).zfill(4) + "\n")
        open(rundir + "/batch.sub", "w").write(batch)
        open(rundir + "/parfile.par", "w").write(par)

        print(msg)
        logfile = open("BATCH/log", "a")
        logfile.write(datetime.datetime.now().strftime("%A, %d. %B %Y %I:%M%p"))
        logfile.write("\n" + msg + "\n\n")
        logfile.close()

command.register(MakeSegment())

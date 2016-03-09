import command
import batchtools
import batchtools.replace as replace

import datetime
from glob import glob
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
Usage: batchtools makesegment [newid [parentid]]

Creates a new segment for the current simulation. If parentid is negative, then
this creates a new initial segment.
"""

    def get_segment_list(self):
        return [int(x[-4:]) for x in glob("output-????")]

    def run(self, args):
        if not os.path.exists("BATCH"):
            s = """\
The current directory seems not to be initialized. Did you forget to run
\'batchtools init\'?\
"""
            print(s)
            exit(1)
        segments = self.get_segment_list()
        if len(args) > 0:
            try:
                inew = int(args[0])
            except ValueError:
                print("Invalid segment ID: \"{0}\"".format(args[0]))
                print(MakeSegment.helpstr)
                exit(1)
            if len(args) > 1:
                try:
                    iold = int(args[1])
                except ValueError:
                    print("Invalid segment ID: \"{0}\"".format(args[0]))
                    print(MakeSegment.helpstr)
                    exit(1)
            else:
                iold = inew - 1
        else:
            if segments != []:
                inew = max(self.get_segment_list()) + 1
                iold = inew - 1
            else:
                inew = 0
                iold = -1
        if iold >= 0:
            if not iold in segments:
                s = """\
Trying to create a segment with nonexistent parent ID ``{}''!\
""".format(str(iold).zfill(4))
                print(s)
                exit(1)
        segment = str(inew).zfill(4)
        rundir  = "output-" + segment

        replace.read_rules("BATCH/CONFIG")
        replace.update_rule("RUNDIR", os.path.abspath(".") + "/" + rundir)
        replace.update_rule("SEGMENT", segment)

        batch = open("BATCH/batch.t", "r").read()
        batch = replace.apply_rules(batch)

        par = open("BATCH/parfile.t", "r").read()
        par = replace.apply_rules(par)

        os.mkdir(rundir)
        msg = "Created segment {0}".format(segment)
        if iold >= 0:
            oldsegment = str(iold).zfill(4)
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

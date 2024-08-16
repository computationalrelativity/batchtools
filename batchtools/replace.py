import os
import re

""" A class representing a replacement rule """
class Pattern:
    def __init__(self, key, subst, desc):
        self.key   = key
        self.subst = subst
        self.desc  = desc
    def __str__(self):
        s = ""
        if self.desc is not None:
            s += "# " + self.desc + "\n"
        s += self.key.ljust(32)
        if self.subst is not None:
            s += self.subst
        return s
    def replace(self, txt):
        return re.sub("@{0}@".format(self.key), self.subst, txt)

# Default rules
__patterns__ = [
    ('ALLOCATION', "", "Allocation to use when submitting a job"),
    ('BATCHSYSTEM', "", "Name of the batch queueing system"),
    ('BATCHSCRIPT', "batch.sub", "Name of the batch script"),
    ('CHAINED_JOB_ID', None, "Job ID of parent segment"),
    ('EMAIL', "", "Email to be used for messages"),
    ('EXECUTABLE', "../BATCH/exec",
        "Name of the executable to use (relative path from the RUNDIR)"),
    ('HOME', os.environ['HOME'], "User home directory"),
    ('NODES', "", "Total number of nodes"),
    ('NUM_PROCS', "", "Total number of processes"),
    ('NUM_THREADS', "", "Number of threads per process"),
    ('NUM_GPUS', "", "Number of GPUs per node"),
    ('NUM_CPU_TASK',"","Number of CPUs per MPI task"),
    ('INCLUDE', "../BATCH/include", "Path to extra simulation files"),
    ('PARFILE', "parfile.par", "Name of the parfile to use"),
    ('PPN', "", "Number of CPUs per node"),
    ('PROC_PER_NODE', "", "Number of processes per node"),
    ('RUNDIR', None, "Work directory for each segment"),
    ('SEGMENT', None, "Segment ID"),
    ('SIMULATION_NAME', "", "Name of the simulation"),
    ('TERMINATION_TIME', "", "Time at which to checkpoint and terminate HH:MM:SS"),
    ('THREADS', "", "Total number of threads"),
    ('WALLTIME', "", "Walltime HH:MM:SS"),
    ('WALLTIME_HOURS', "", "Walltime in hours HH"),
]
patterns = {}
defaults = {}
for p in __patterns__:
    defaults[p[0]] = Pattern(*p)
patterns['BATCHSYSTEM'] = defaults['BATCHSYSTEM']
patterns['HOME'] = defaults['HOME']

def exists(key):
    return key in patterns

def apply_rules(txt):
    """ Apply all of the rules to the input """
    s = txt
    for p in list(patterns.values()):
        if p.subst is not None and re.match(r'\s*$', p.subst) is None:
            s = p.replace(s)
    return s

def add_rule(key, subst, desc=None):
    """ Add a new preplacement rule """
    if key not in patterns:
        if key in defaults:
            patterns[key] = defaults[key]
        else:
            patterns[key] = Pattern(key, subst, desc)
    else:
        raise ValueError("Rule for {0} already exists!".format(key))

def get_rule(key):
    """ Get a replacement rule """
    return patterns[key]

def set_rule(key, subst, desc=None):
    """ Update or create a replacement rule """
    if desc is None and key in patterns:
        desc = patterns[key].desc
    patterns[key] = Pattern(key, subst, desc)

def update_rule(key, subst, desc=None):
    """ Update an existing replacement rule """
    if desc is None:
        desc = patterns[key].desc
    patterns[key] = Pattern(key, subst, desc)

def read_rules(fname):
    """ Read replacement rules from file """
    for c, l in enumerate(open(fname, "r")):
        if l[0] != '#':
            x = l.split()
            if len(x) == 2:
                set_rule(x[0], x[1])

def write_rules():
    """ Writes all of the available replacement rules in a string """
    s = ""
    rules = sorted(list(patterns.values()), key=lambda x: x.key)
    for p in rules:
        if p.subst is not None:
            s += str(p) + "\n"
    return s

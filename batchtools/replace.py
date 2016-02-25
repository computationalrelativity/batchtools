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
    ('BATCHSCRIPT', "batch.sub", "Name of the batch sript"),
    ('EMAIL', "", "Email to be used for messagges"),
    ('EXECUTABLE', "../BATCH/exec",
        "Name of the executable to use (relative path from the RUNDIR)"),
    ('HOME', os.environ['HOME'], "User home directory"),
    ('NODES', "", "Total number of nodes"),
    ('NUM_PROCS', "", "Total number of processes"),
    ('NUM_THREADS', "", "Number of threads per process"),
    ('PARFILE', "parfile.par", "Name of the parfile to use"),
    ('PROC_PER_NODE', "", "Number of processes per node"),
    ('RUNDIR', None, "Work directory for each segment"),
    ('SEGMENT', None, "Segment ID"),
    ('SIMULATION_NAME', "", "Name of the simulation"),
]
patterns = {}
for p in __patterns__:
    patterns[p[0]] = Pattern(*p)

def exists(key):
    return patterns.has_key(key)

def apply_rules(txt):
    """ Apply all of the rules to the input """
    s = txt
    for p in patterns.itervalues():
        if p.subst is not None and re.match(r'\s*$', p.subst) is None:
            s = p.replace(s)
    return s

def add_rule(key, subst, desc=None):
    """ Add a new preplacement rule """
    if not patterns.has_key(key):
        patterns[key] = Pattern(key, subst, desc)
    else:
        raise ValueError("Rule for {0} already exists!".format(key))

def set_rule(key, subst, desc=None):
    """ Update or create a replacement rule """
    if desc is None and patterns.has_key(key):
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
    rules = sorted(list(patterns.itervalues()), key=lambda x: x.key)
    for p in rules:
        if p.subst is not None:
            s += str(p) + "\n"
    return s


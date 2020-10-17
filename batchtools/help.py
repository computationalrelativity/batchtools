from __future__ import print_function
import batchtools.command as command

class Help(command.Abstract):
    """
    Help command
    """
    name    = "help"
    desc    = "Display help information about batchtools"
    helpstr = """\
Usage: batchtools help command

Displays the help of a specific command\
"""
    def run(self, args):
        if len(args) == 0:
            s  = "Usage: batchtools command\n\n"
            s += "Available commands\n"
            for k in sorted(command.comdict.keys()):
                c  = command.comdict[k]
                s += "    " + c.name.ljust(14) + " " + c.desc + "\n"
            print((s), end=' ')
        else:
            print((command.comdict[args[0]].helpstr))

command.register(Help())

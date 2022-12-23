import abc

""" Dictionary of commands """
comdict = {}
class Abstract(object):
    """
    Abstract command
    """

    name    = ""
    desc    = ""
    helpstr = ""

    @abc.abstractmethod
    def run(self, args):
        pass

def register(cmd):
    """
    Register a command (must be an instance of Abstract command)
    """
    assert isinstance(cmd, Abstract)

    if cmd.name in comdict:
        raise Exception("Trying to register two commands with the same name!")
    else:
        comdict[cmd.name] = cmd

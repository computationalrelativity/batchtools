batchtools
==========

A sane and robust alternative to simfactory

batchtools has been designed to be a set of *simple* tools useful to deal with
HPC simulations. batchtools only makes minimal assumptions about the user
workflow and its behavior does not depend on the content of multiple config
files and/or environment variables like simfactory. By keeping it simple,
batchtools strictly adheres to the principle of least astonishment.

Usage
-----

Add batchtools/bin to your PATH

~~~
    $ export PATH=$PATH:/path/to/batchtools/bin
~~~

Create a simulation directory somewhere

~~~
    $ mkdir /path/to/my/new/simulation
    $ cd /path/to/my/new/simulations
~~~

Initialize a simulation by choosing a parfile, an executable, and a template
batch script

~~~
    $ batchtools init --batch loewe.slurm.t --parfile someparfile.par --exe cactus
~~~

The batch script can be any text file. Some examples are included in batchtools
in the `templates` folder.

In general, batchtools supports most of simfactory submit-/run-scripts.

When batchtools creates a new segment of the simulation it will populate it
with specialized versions of the batch script and of the parfile. These are
created by substituting patterns marked as `@PATTERN@` using the rules
specified in the BATCH/CONFIG file in the simulation directory. Please take a
moment to edit that file before creating the first segment of your new
simulation.

A special field in the CONFIG file is `BATCHSYSTEM`. Its value is used by the
batchtools submit subcommand to handle the interaction with the queueing
system. Note that using batchtools to also submit jobs is optional and you do
not need to set this variable if you intend to manually submit your jobs.

Besides the rules specified in that file batchtools also expands the following
variables:
~~~
    @RUNDIR@        work directory of each segment
    @SEGMENT@       segment ID
~~~
More "magic" variables might be added in the future if really needed.

Having edited the BATCH/CONFIG file, it is now possible to create a new segment
of the simulation with

~~~
    $ batchtools makesegment
~~~

This should have created a new segment:

~~~
    $ ls output-0000
    batch.sub parfile.par
~~~

It is now possible to submit the simulation with (for instance)

~~~
    $ batchtools submit
~~~

Checkpointing/recovery
----------------------

batchtools will not attempt to mess with your checkpoint files, so restarting
your simulations from a checkpoint requires a little bit of extra work.
However, to simplify this task, batchtools creates a number of symbolic links
between the different segments. Each segment has one symbolic link: "parent".
This points to the "previous" segment.

Note that previous segments need not to come immediately before the current
segment in the enumeration, although this is the default behavior. The user
can create and link segments in any order with the makesegment command. For
instance:

~~~
    $ batchtools makesegment --id 10 --parent 5
~~~

will create a new segment 0010 and set its parent to 0005. The user is
encouraged to setup his code to recover from the data in the "parent/"
directory. For instance, in Cactus, this can be achieved with the following
parfile options:

~~~
    IOUtil::checkpoint_dir		= "./checkpoint"
    IOUtil::recover_dir			= "./parent/checkpoint"
~~~

Planned features
----------------

* Support for chained jobs
* Tools for archiving data

Nonfeatures
-----------

bashtools strives to keep it simple. As such, bashtools does not try to
replicate/absorb features from other existing tools. In particular, bashtools
will never

* build your code or any dependencies
* execute remote commands
* manage groups of simulations
* sync code or do versioning control

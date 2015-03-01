BICIB: Brainfuck Interpreter/Comiler In Brainfuck
=================================================

BICIB aims to provide a easy-to-use toolset for brainfuck,
which is an esoteric programming language, and it is also written
in brainfuck.  

BICIB provides both interpreter and compiler to brainfuck.

## Status

We wrote the interpreter and compiler in C for bootstrap, 
ver 0.1 will be released as the first stable version after
the backend of compiler is finished.
Currently we only support x86_64-linux, and an environment
that can run [docker](https://github.com/docker/docker) since
the package is dockerized.

Getting started
===============

The only thing you have to make sure is that you have docker working 
properly.  For those who don't know how to install docker, reference
[this document](http://docs.docker.com/installation/).  Most of the 
GNU/Linux distrobitions and MAC are already supported, so it shouldn't
be a problem.

After you have a docker environment, you may first clone this project,
```bash
git clone git://git@github.com:NonerKao/BICIB.git
cd BICIB
```

And then build the container,
```bash
docker build -t bicib .
```

After the container is built, you may run it following [the guide](http://docs.docker.com/userguide/),
or briefly type the following instruction,
```bash
docker run -it bicib /root/brainfuck/interpreter /root/brainfuck/examples/hw.b
```

Have fun!

Licencing
=========

BICIB is licenced under [GPLv3](http://www.gnu.org/licenses/gpl-3.0.html)

Contact Me
==========

[Quey-Liang Kao](http://noner.scopelab.cs.nthu.edu.tw)

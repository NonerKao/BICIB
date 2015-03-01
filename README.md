BICIB: Brainfuck Interpreter/Compiler In Brainfuck
=================================================

BICIB aims to provide a easy-to-use tool-set for brainfuck,
which is an esoteric programming language, and it is also written
in brainfuck.  

BICIB provides dockerized brainfuck interpreter and compiler.
Currently only docker-capable x86_64-linux is supported.  For details
please check [docker](https://github.com/docker/docker).

Getting started
===============

The only thing you have to make sure is that you have docker working 
properly.  For those who don't know how to install docker, reference
[this document](http://docs.docker.com/installation/).  Most of the 
GNU/Linux distributions and MAC are already supported, so it shouldn't
be a problem.

After you have a docker environment, you may first clone this project,
```bash
git clone git@github.com:NonerKao/BICIB.git
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

BICIB is licenced under [GPLv3](http://www.gnu.org/licenses/gpl-3.0.html).

Contact Me
==========

[Quey-Liang Kao](http://noner.scopelab.cs.nthu.edu.tw)

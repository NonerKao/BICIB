BICIB: Brainfuck Interpreter/Compiler In Brainfuck
=================================================

## About this project

BICIB aims to provide a easy-to-use tool set for brainfuck,
and it is also written in brainfuck.

BICIB provides dockerized brainfuck interpreter and compiler.
Currently only docker-capable x86_64-linux is supported.  For details
please check [docker](https://github.com/docker/docker).

## About brainfuck

Brainfuck is a esoteric programming language with only eight
instructions which can be viewed as the ability of a Turing machine. 
These instructions are(assume **head** is of type char\* in C):

<table>
<tr>
<td> symbol</td>
<td> action</td>
<td> C</td>
</tr>
<tr>
<td> "&lt;"(ASCII 0x3c)</td>
<td> move the head to the left square</td>
<td> head--</td>
</tr>
<tr>
<td> ">"(ASCII 0x3e)</td>
<td> move the head to the right square</td>
<td> head++</td>
</tr>
<tr>
<td> "+"(ASCII 0x2b)</td>
<td> increase the current square by 1</td>
<td> (*head)++</td>
</tr>
<tr>
<td> "-"(ASCII 0x2d)</td>
<td> decrease the current square by 1</td>
<td> (*head)--</td>
</tr>
<tr>
<td> ","(ASCII 0x2c)</td>
<td> write to the current square</td>
<td> *head = getchar() </td>
</tr>
<tr>
<td> "."(ASCII 0x2e)</td>
<td> read from the current square</td>
<td> putchar(*head)</td>
</tr>
<tr>
<td> "["(ASCII 0x5b)</td>
<td> loop until the current square is 0</td>
<td> while(*head){</td>
</tr>
<tr>
<td> "]"(ASCII 0x5d)</td>
<td> the end of the loop</td>
<td> }</td>
</tr>
</table>

It may be a little bit confusing that the "," instruction
performs a write by **getchar()** and the "." instruction 
performs a read by **putchar()**.  But notice that read/write
is the action of an operator of Turing machine, and the 
put/getchar() functions are the actions from the terminal's
point of view, which is mere a simulation to Turing machine.

More detailed history and references can easily be found at 
[Wikipedia](http://en.wikipedia.org/wiki/Brainfuck) and
[esolangs](http://esolangs.org/wiki/Brainfuck).

## Some implementation issues

Obviously, we have no way to interact with the modern computer systems
in such programming model.  Brainfuck supports neither file operations,
nor object linking.  These constraints make it hard to produce a 
self-hosted brainfuck interpreter or compiler.

We write the two programs in brainfuck.  In other words, these programs
themselves should be viewed as Turing machines.  There is no 
random-accessed memory but only a tape.

As a result, we implement a small piece of assembly code as a general 
entry point, which is responsible for loading the files specified in the
command line arguments into a contiguous region on the tape of 
the simulated machine.  The code will then be processed by the 
main part of interpreter/compiler, writen in brainfuck.

Currently(version 0.3) we have self-hosted compiler and interpreter,
and planning to start developing debugger.

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
docker run --rm bicib bfi /root/BICIB/brainfuck/examples/hw.b
```

You may also use interactive shell,
```bash
docker run --rm bicib bash
```
in which the you can use **bfc** or **bfi** directly.

Have fun!

Licencing
=========

BICIB is licenced under [GPLv3](http://www.gnu.org/licenses/gpl-3.0.html).

Contact Me
==========

[Quey-Liang Kao](http://noner.scopelab.cs.nthu.edu.tw)

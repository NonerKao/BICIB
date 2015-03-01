# For fedora21
# Dockerize brainfuck toolchain

FROM fedora:21
MAINTAINER Quey-Liang Kao <s101062801@m101.nthu.edu.tw>

# vim: optional
# gcc: for bootstrapping only, to be removed in future releases
# binutils: as and ld is necessary in current stage 
RUN yum -y install vim gcc make binutils

# copy files
COPY brainfuck /root/brainfuck

# a more comfortable prompt style
COPY /etc/.bashrc /root/

# an entry
WORKDIR /root/brainfuck

# build the interpreter and compiler
RUN make

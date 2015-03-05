# For fedora21
# Dockerize brainfuck interpreter and compiler 

FROM fedora:21
MAINTAINER Quey-Liang Kao <s101062801@m101.nthu.edu.tw>

# git: after 0.1, develope in containers
# gcc make: for bootstrapping only, to be removed in future releases
# binutils: as and ld is necessary in current stage 
RUN yum -y install git gcc make binutils

# copy files
COPY . /root/BICIB

# a more comfortable prompt style
COPY etc/.bashrc /root/
RUN make -C /root/BICIB/etc install

# an entry
WORKDIR /root/BICIB/brainfuck

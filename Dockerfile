# For fedora21
# Dockerize brainfuck toolchain

FROM fedora:21
MAINTAINER Quey-Liang Kao <s101062801@m101.nthu.edu.tw>

RUN yum -y install vim gcc
COPY brainfuck /root/brainfuck

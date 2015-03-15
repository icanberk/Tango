# Autolab - autograding docker image

FROM ubuntu:14.04
MAINTAINER Mihir Pandya <mihir.m.pandya@gmail.com>

RUN apt-get update
RUN apt-get install -y gcc
RUN apt-get install -y make
RUN apt-get install -y build-essential

# Install autodriver
RUN apt-get install -y git
WORKDIR /home
RUN git clone https://github.com/autolab/Tango.git
WORKDIR Tango/autodriver
RUN ls .
RUN make clean && make
RUN cp autodriver /usr/bin/autodriver
RUN which autodriver

# Clean up
RUN apt-get remove -y git
RUN apt-get -y autoremove
FROM prosyslab/bug-bench-base

RUN apt-get -y update
RUN apt-get -y install autoconf libtool libjpeg-dev

ENV PROGRAM=jasper

ENV URL=https://github.com/prosyslab-warehouse/jasper-1.900.21
ENV GIT_REPO_NAME=jasper-1.900.21

RUN git clone $URL $GIT_REPO_NAME
RUN mv $GIT_REPO_NAME $PROGRAM

COPY build.sh $SRC

WORKDIR $PROGRAM

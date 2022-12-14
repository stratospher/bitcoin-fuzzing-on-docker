FROM quay.io/centos/centos:stream8

RUN yum update -y
RUN yum install -y sudo
RUN yum install -y git
RUN yum install -y gcc-c++
RUN yum install -y glibc-devel.x86_64
RUN yum install -y libstdc++-devel.x86_64
RUN yum install -y glibc-devel.i686
RUN yum install -y libstdc++-devel.i686
#RUN yum install -y ccache
RUN yum install -y libtool
RUN yum install -y make
RUN yum install -y python3
RUN yum install -y python3-pip
RUN yum install -y which
RUN yum install -y patch
#RUN yum install -y lbzip2
RUN yum install -y xz
RUN yum install -y procps-ng
#RUN yum install -y dash
RUN yum install -y rsync
#RUN yum install -y coreutils
RUN yum install -y bison
RUN yum install -y boost
RUN yum install boost-devel.x86_64
RUN yum install -y libevent-devel
RUN yum clean all

RUN mkdir -p /bitcoin


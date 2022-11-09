# author: eam
# date: 09.11.2023
#
# Dockerfile to create a docker contatiner with CentOS and the bcl-convert tool (Illumina).
#
# 1. First download the bcl-convert-4.0.3-2.el7.x86_64.rpm package from
# https://support.illumina.com/downloads/bcl-convert-downloads.html.
# The rpm file is expected to be in the same dir of the Dockerfile.
#
# 2. Build a docker image using this Dockerfile
#
# docker build -t bcl-convert:4.0.3 .
#
# 3. Running:
# Warning: Need to mount a working dir (i.e. data to convert) from host (option -v host:target)
#
# docker run -v /path/to/host/data:/data bcl-convert:4.0.3 --help
#
#
FROM centos:7

ADD bcl-convert-4.0.3-2.el7.x86_64.rpm /tmp/bcl-convert.rpm

RUN yum install -y gdb && \
    rpm -i /tmp/bcl-convert.rpm && \
    rm /tmp/bcl-convert.rpm && \
    yum clean all && \
    rm -rf /var/cache/yum

ENTRYPOINT ["/usr/bin/bcl-convert"]
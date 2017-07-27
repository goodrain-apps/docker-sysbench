FROM centos:centos7

MAINTAINER YsiCing Zheng <root@ysicing.net>

RUN yum makecache;yum install -y wget curl net-tools openssh-server openssh-clients; \
    wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo; \
    wget -O /etc/yum.repos.d/epel.repo http://mirrors.aliyun.com/repo/epel-7.repo; \
    yum makecache;yum install -y sysbench ipef3; \
    yum clean all;

EXPOSE  22

CMD ["/usr/sbin/sshd", "-D"]






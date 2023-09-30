#拉取centos7镜像
FROM centos:7
#安装net-tools 好使用ifconfig命令
RUN yum -y install net-tools

RUN yum -y install openssh-server
#设置root用户密码
RUN echo 'root:123456' | chpasswd

COPY sshd_config /etc/ssh/
#V2，注释CMD为v1
CMD ["/usr/sbin/init", "-D"]
#创建os:v1镜像
#docker build -t os:v1 .

# docker run -d --name=centos --privileged=true -p 22:22 os:v1 /usr/sbin/init

#创建os:v2镜像
#docker build -t os:v2 .

# docker run -d --name=centos2 --privileged=true -p 22:22 os:v2

#vi /etc/ssh/sshd_config
#将 Port 22、ListenAddress 0.0.0.0、ListenAddress :: PermitRootLogin yes前面的#号去掉
#重启ssh：systemctl restart sshd

FROM centos:centos7

# Software development tools
RUN yum install auto{conf,make} ctags elfutils gcc{,-c++} gettext intltool libtool make patch{,utils} -y
RUN yum install redhat-rpm-config rpm-{build,sign} spectool -y
RUN yum install git yum-utils -y

RUN mkdir -p /rpmbuild/{BUILD,RPMS,SOURCES,SRPMS}

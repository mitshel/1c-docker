FROM centos:7
MAINTAINER Dmitry Shelepnev "mitshel@mail.ru"

ENV LANG en_US.utf8

RUN localedef  -i ru_RU -f UTF-8 ru_RU.UTF-8 \
 && echo -e "LANG=\"ru_RU.UTF-8\"\nSUPPORTED=\"ru_RU.UTF-8:ru_RU:ru\"\nSYSFONT=\"latarcyrheb-sun16\"" > /etc/sysconfig/i18n \
 && yum -y update \
 && yum install -y wget sudo \
 && mkdir /home/distr 

COPY distr/*.rpm /home/distr/
COPY start.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/start.sh \
    && yum -y update \
    && yum install -y net-tools epel-release \
    && yum install -y ImageMagick libmspack \
    && yum install -y ttmkfdir cabextract rpm-build \
    && yum install -y unixODBC \
    && yum -y install xorg-x11-fonts-Type1 xorg-x11-fonts-truetype \
    && yum -y install curl cabextract xorg-x11-font-utils fontconfig \
    && rpm -i https://downloads.sourceforge.net/project/mscorefonts2/rpms/msttcore-fonts-installer-2.6-1.noarch.rpm \
    && cd /home/distr \
    && yum localinstall -y *.rpm \
    && chown -R usr1cv8:grp1cv8 /opt/1C \
    && sed -i -e '1 s/^/\#\!\/bin\/bash\n/;' /etc/init.d/srv1cv83 

VOLUME /home/usr1cv8/
VOLUME /var/log/1c
EXPOSE 1540-1541 1560-1591
CMD ["/usr/local/bin/start.sh"]


FROM centos:7
MAINTAINER Dmitry Shelepnev "mitshel@mail.ru"

ENV LANG en_US.utf8

RUN localedef  -i ru_RU -f UTF-8 ru_RU.UTF-8 \
 && echo -e "LANG=\"ru_RU.UTF-8\"\nSUPPORTED=\"ru_RU.UTF-8:ru_RU:ru\"\nSYSFONT=\"latarcyrheb-sun16\"" > /etc/sysconfig/i18n \
 && yum -y update \
 && yum install -y wget sudo \
 && mkdir /home/distr  

COPY distr/*.rpm /home/distr/
COPY pgconf/*.conf /home/distr/
COPY start.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/start.sh \
 && cd /home/distr \
 && yum localinstall -y *.rpm \
 && sudo -u postgres /usr/pgsql-9.6/bin/initdb -D /var/lib/pgsql/9.6/data --locale=ru_RU.UTF-8 
# && sudo -u postgres psql -c "alter user postgres with password 'baza1c'"

VOLUME /var/lib/pgsql/9.6/data
EXPOSE 5432
CMD ["/usr/local/bin/start.sh"]

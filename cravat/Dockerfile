FROM python:3.7
RUN pip3 install open-cravat
COPY run.sh /run.sh
VOLUME /mnt/mdir
RUN cravat-admin md /mnt/dir
RUN mv /usr/local/bin/cravat /usr/local/bin/realcravat
COPY cravat.sh /usr/local/bin/cravat
RUN chmod +x /usr/local/bin/cravat
RUN mv /usr/local/lib/python3.7/site-packages/cravat/conf/cravat-system.yml /tmp/cravat-system.yml
RUN ln -s /tmp/cravat-system.yml /usr/local/lib/python3.7/site-packages/cravat/conf/cravat-system.yml

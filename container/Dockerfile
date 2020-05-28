FROM python:3.6
WORKDIR /tmp
RUN git clone https://github.com/karchinlab/open-cravat.git -b 1.7.1 && \
    pip3 install ./open-cravat && \
    rm -rf open-cravat
VOLUME /tmp/mdir
VOLUME /tmp/job
VOLUME /tmp/modules
RUN oc config md /tmp/mdir
RUN mv /usr/local/lib/python3.6/site-packages/cravat/conf/cravat-system.yml /tmp/cravat-system.yml && \
    ln -s /tmp/cravat-system.yml /usr/local/lib/python3.6/site-packages/cravat/conf/cravat-system.yml
COPY oc.sh /usr/local/bin/ocwrapper
RUN chmod +x /usr/local/bin/ocwrapper
WORKDIR /tmp/job

FROM python:3.6

RUN pip install open-cravat

# Populate the config files, then move them to editable place
RUN oc config md && \
    mv /usr/local/lib/python3.6/site-packages/cravat/conf/cravat-system.yml /tmp/cravat-system.yml && \
    ln -s /tmp/cravat-system.yml /usr/local/lib/python3.6/site-packages/cravat/conf/cravat-system.yml

COPY oc-install-modules.sh /usr/local/bin/oc-install-modules
RUN chmod +x /usr/local/bin/oc-install-modules

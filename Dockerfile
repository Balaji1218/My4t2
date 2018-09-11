# Use WLS built locally
FROM weblogic

USER root

LABEL maintainer "cse.praveen@gmail.com"
# Image Name : t24domain

# T24 Domain related files
COPY createT24Domain.sh create-T24-domain.py t24DomainEnv.sh /weblogic/

# Create T24 Domain folder
RUN mkdir -p /weblogic/T24 && \
	chmod a+xr /weblogic/T24

# T24 related Environment variables
ENV USER_MEM_ARGS="-Xms2G -Xmx4G" \ 
	DOMAIN_NAME=T24 \
    DOMAIN_HOME=/weblogic/T24 \
    ADMIN_PORT=9010 \    
    ADMIN_USERNAME=weblogic \
    ADMIN_NAME=AdminServer \
    ADMIN_PASSWORD=Temenos@9 \
    DEBUG_FLAG=true \
    PRODUCTION_MODE=dev \
	PATH=$PATH:/usr/java/default/bin:/weblogic/oracle/oracle_common/common/bin:/weblogic/oracle/wlserver/common/bin
	
RUN ["/bin/bash","/weblogic/createT24Domain.sh"]

# cd C:\Docker\Weblogic\T24Domain
# docker build -t t24domain .

echo "DOMAIN_HOME=${DOMAIN_HOME}"
sed -i -e "s|ADMIN_PASSWORD|$s|g" /weblogic/create-T24-domain.py
sed -i -e "s|ADMIN_PASSWORD|$s|g" /weblogic/t24DomainEnv.sh

. /weblogic/oracle/wlserver/server/bin/setWLSEnv.sh

# Create T24 domain
wlst.sh -skipWLSModuleScanning /weblogic/create-T24-domain.py

mkdir -p ${DOMAIN_HOME}/servers/AdminServer/security/
echo "username=${ADMIN_USERNAME}" > ${DOMAIN_HOME}/servers/AdminServer/security/boot.properties
echo "password=${ADMIN_PASSWORD}" >> ${DOMAIN_HOME}/servers/AdminServer/security/boot.properties

# Set Domain Environment
. ${DOMAIN_HOME}/bin/setDomainEnv.sh
echo "Domain Env Set.."

# Start Admin Server and tail the logs
mkdir -p ${DOMAIN_HOME}/servers/AdminServer/security/logs/
touch    ${DOMAIN_HOME}/servers/AdminServer/security/logs/AdminServer.log
tail -f  ${DOMAIN_HOME}/servers/AdminServer/security/logs/AdminServer.log &

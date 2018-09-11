# WebLogic on Docker T24 Domain
# ==============================================
domain_name  = os.environ.get("DOMAIN_NAME", "T24")
admin_name  = os.environ.get("ADMIN_NAME", "AdminServer")
admin_username  = os.environ.get("ADMIN_USERNAME", "weblogic")
admin_pass  = os.environ.get("ADMIN_PASSWORD", "Temenos@9")
admin_port   = int(os.environ.get("ADMIN_PORT", "9010"))
domain_path  = os.environ.get("DOMAIN_HOME", "weblogic")
production_mode = os.environ.get("PRODUCTION_MODE", "dev")

print('domain_name     : [%s]' % domain_name);
print('admin_port      : [%s]' % admin_port);
print('domain_path     : [%s]' % domain_path);
print('production_mode : [%s]' % production_mode);
print('admin password  : [%s]' % admin_pass);
print('admin name      : [%s]' % admin_name);
print('admin username  : [%s]' % admin_username);

# Open default domain template
# ======================
readTemplate("/weblogic/oracle/wlserver/common/templates/wls/wls.jar")

set('Name', domain_name)
setOption('DomainName', domain_name)

# Disable Admin Console
# --------------------
# cmo.setConsoleEnabled(false)

# Configure the Administration Server and SSL port.
# =================================================
cd('/Servers/AdminServer')
set('Name', admin_name)
set('ListenAddress', '')
set('ListenPort', admin_port)

# Define the user password for weblogic
# =====================================
cd('/Security/%s/User/weblogic' % domain_name)
cmo.setPassword(admin_pass)

# Write the domain and close the domain template
# ==============================================
setOption('OverwriteDomain', 'true')
setOption('ServerStartMode',production_mode)

cd('/NMProperties')
set('ListenAddress','')
set('ListenPort',9010)
set('CrashRecoveryEnabled', 'true')
set('NativeVersionEnabled', 'true')
set('StartScriptEnabled', 'false')
set('SecureListener', 'false')
set('LogLevel', 'FINEST')

# Set the Node Manager user name and password (domain name will change after writeDomain)
cd('/SecurityConfiguration/base_domain')
set('NodeManagerUsername', admin_username)
set('NodeManagerPasswordEncrypted', admin_pass)

# Write Domain
# ============
writeDomain(domain_path)
closeTemplate()

# Exit WLST
# =========
exit()

##########
# Filename :  createResponseFile_CF.sh
# Description : This file will create the properties file for the update of WebSphere Portal
# Steps:
#       Create the properties file for WebSphere Portal using the template
##########

echo | tee -a logs/install.log;
echo "*** Set variables - start ***" | tee -a logs/install.log;
date | tee -a logs/install.log;

set -a
. portalVariable.txt
set +a

echo | tee -a logs/install.log;
echo "*** Set Variables - complete ***" | tee -a logs/install.log;
date | tee -a logs/install.log; echo | tee -a logs/install.log;

# Create WebSphere Portal CF Properties file
echo | tee -a logs/install.log;
echo "*** Create CF Properties File - start ***" | tee -a logs/install.log;
date | tee -a logs/install.log;

WP_PWD=${WP_PWD} WP_HOSTNAME=${WP_HOSTNAME} envsubst < responseFile/WP85_CF.template >WP85_CF.rsp

echo | tee -a logs/install.log;
echo "*** Create Response File - complete ***" | tee -a logs/install.log;
date | tee -a logs/install.log; echo | tee -a logs/install.log;

# Update wkplc.properties and wkplc_comp.properties
echo | tee -a logs/install.log;
echo "*** Update Portal Properties File - start ***" | tee -a logs/install.log;
date | tee -a logs/install.log;

$WP_PROFILE/ConfigEngine/ConfigEngine.sh -DparentProperties=WP85_CF.rsp -DSaveParentProperties=true;

echo | tee -a logs/install.log;
echo "*** Update Portal Properties File - complete ***" | tee -a logs/install.log;
date | tee -a logs/install.log; echo | tee -a logs/install.log;





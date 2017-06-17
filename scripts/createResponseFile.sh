##########
# Filename :  createResponseFile.sh
# Description : This file will create the response file for the installation of WebSphere Portal
# Steps:
#       encrypt the password 
#       Create the WebSphere Portal response file using the template
##########

echo "*** Set variables - start ***" | tee -a logs/install.log;
date | tee -a logs/install.log;

set -a
. portalVariable.txt
set +a

echo "*** Set Variables - complete ***" | tee -a logs/install.log;
date | tee -a logs/install.log;
echo | tee -a logs/install.log;

# Encrypt WebSphere Portal and Configuration Wizard Password
echo "*** Encrypt Password file - start ***" | tee -a logs/install.log;
date | tee -a logs/install.log;

WP_PWDENCRYPT=$($IIM_HOME/eclipse/IBMIM -silent -noSplash encryptString $WP_PWD)

CW_PWDENCRYPT=$($IIM_HOME/eclipse/IBMIM -silent -noSplash encryptString $CW_PWD)

echo "*** Encrypt Password file - complete ***" | tee -a logs/install.log;
date | tee -a logs/install.log;
echo | tee -a logs/install.log;

# Create WebSphere Portal response file
echo "*** Create Response File - start ***" | tee -a logs/install.log;
date | tee -a logs/install.log;

IIM_SHARED=${IIM_SHARED} WP_SERVER_MEDIA=${WP_SERVER_MEDIA} WP_ENTITLEMENT_MEDIA=${WP_ENTITLEMENT_MEDIA} WP_HOME=${WP_HOME} CE_HOME=${CE_HOME} WAS_HOME=${WAS_HOME} CW_ADMIN=${CW_ADMIN} CW_PWD=${CW_PWD} WP_PROFILENAME=${WP_PROFILENAME} WP_PROFILE=${WP_PROFILE} CW_ADMIN=${CW_ADMIN} CW_PWD=${CW_PWDENCRYPT} WP_HOSTNAME=${WP_HOSTNAME} WP_NODE=${WP_NODE} WP_CELL=${WP_CELL} WP_ADMIN=${WP_ADMIN} WP_PWD=${WP_PWDENCRYPT} WP_CONTEXT=${WP_CONTEXT} WP_DEFAULT=${WP_DEFAULT} WP_PERSONALIZED=${WP_PERSONALIZED} WP_PROFILENAME=${WP_PROFILENAME} WP_PROFILE=${WP_PROFILE} WP_STARTPORT=${WP_STARTPORT} WP_ENTITLEMENT=${WP_ENTITLEMENT} envsubst < responseFile/WP85.template >WP85_$WP_ENTITLEMENT.rsp

echo "*** Create Response File - complete ***" | tee -a logs/install.log;
date | tee -a logs/install.log;
echo | tee -a logs/install.log;

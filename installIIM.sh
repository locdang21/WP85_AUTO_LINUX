##########
# Filename :  installIIM.sh
# Description : This file will install IBM Installation Manager
# Steps:
#	Check the user logged in to determine if root or non-root
#       Install IBM Installation Manager
##########


echo | tee -a logs/install.log;
echo "*** Install IIM - start ***" | tee -a logs/install.log;
date | tee -a logs/install.log;

if [ "$(id -u)" != "0" ]
then

echo "Installing as Non-Root" | tee -a logs/install.log;
whoami | tee -a logs/install.log;
$IIM_MEDIA/userinstc -installationDirectory $IIM_HOME/eclipse -log $IIM_HOME/IIM_Install.log -acceptLicense ;

else

echo "Installing as Root" | tee -a logs/install.log;
echo $IIM_HOME
$IIM_MEDIA/installc -installationDirectory $IIM_HOME/eclipse -log $IIM_HOME/IIM_Install.log -acceptLicense ;

fi
echo "Check logs/install_IIM.log for IBM Installation Manager install logs" | tee -a logs/install.log;
echo "*** Installation Manager - complete ***" | tee -a logs/install.log;
date | tee -a logs/install.log; echo | tee -a logs/install.log;

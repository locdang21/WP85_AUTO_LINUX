##########
# Filename :  installPortal.sh
# Description : This file will install WebSphere Portal using a response file
# Steps:
#	Create Response file (createResponseFile.sh)
#	Install WebSphere Portal with response File
#	Update ulimit in the setupCmdLine.sh of the WebSphere Portal profile
#	update WP ConfigService with uri.home.substitution 
#	Restart WebSphere Portal
##########

# create the WebSphere Portal response file for the install
./scripts/createResponseFile.sh;

# Install WebSphere Portal with a response file
echo "*** Install Portal - start ***" | tee -a logs/install.log;
date | tee -a logs/install.log;

$IIM_HOME/eclipse/tools/imcl input WP85_$WP_ENTITLEMENT.rsp -log logs/WP85_$WP_ENTITLEMENT_Install.log -acceptLicense -sP | tee -a logs/install.log;

echo "Review the WP85_Install_$WP_ENTITLEMENT.log file to verify WebSphere Portal has been installed correctly." | tee -a logs/install.log;
echo "*** Install Portal - complete ***" | tee -a logs/install.log;
date | tee -a logs/install.log; echo | tee -a logs/install.log;

# Update the Ulimit in the setupCmdLine.sh file 
echo "*** Update setupCmdLine - start ***" | tee -a logs/install.log; 
date  | tee -a logs/install.log;

# This will uncomment the ulimit line
sed -i '/ulimit/s/^#//g' $WP_PROFILE/bin/setupCmdLine.sh

# This will comment the ulimit line but not being used currently
#echo sed -i '/ulimit/s/^/#/g' $WP_PROFILE/bin/setupCmdLine.sh

echo "*** Update setupCmdLine - complete ***" | tee -a logs/install.log;
date  | tee -a logs/install.log; echo  | tee -a logs/install.log;

# This will update the WP ConfigService with uri.home.substitution
echo *** Update WP ConfigService - start *** | tee -a logs/install.log;

$WP_PROFILE/bin/wsadmin.sh  -lang jython -f scripts/updateWPConfigService.py -user $WP_ADMIN -password $WP_PWD | tee -a logs/install.log;

echo *** Update WP ConfigService - complete *** | tee -a logs/install.log;
date | tee -a logs/install.log; echo | tee -a logs/install.log;

# Restart WebSphere Portal
echo "*** Restart WebSphere Portal - start ***" | tee -a logs/install.log;
date  | tee -a logs/install.log;

$WP_PROFILE/bin/stopServer.sh WebSphere_Portal -user $WP_ADMIN -password $WP_PWD
$WP_PROFILE/bin/startServer.sh WebSphere_Portal

echo "*** Restart WebSphere Portal - complete ***"  | tee -a logs/install.log; 
date  | tee -a logs/install.log; echo  | tee -a logs/install.log;


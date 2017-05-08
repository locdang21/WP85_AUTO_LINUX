##########
# Filename :  installWAS.sh
# Description : This file will install WebSphere Application Server
# Steps:
#	Install WebSphere Application Server
##########


echo "*** WebSphere Application Server 8.5 - start ***" | tee -a logs/install.log;
date | tee -a logs/install.log;

$IIM_HOME/eclipse/tools/imcl install com.ibm.websphere.ND.v85 -repositories $WAS_MEDIA/repository.config -installationDirectory $WAS_HOME -sharedResourcesDirectory $IIM_SHARED -acceptLicense -sP | tee -a logs/install.log;

echo "*** WebSphere Application Server 8.5 - complete ***" | tee -a logs/install.log;
date | tee -a logs/install.log; echo | tee -a logs/install.log;

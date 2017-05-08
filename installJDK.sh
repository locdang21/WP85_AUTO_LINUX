##########
# Filename :  installJDK.sh
# Description : This file will install IBM JDK for WebSphere Application Server
# Steps:
#	Install IBM JDK for WebSphere Application Server
##########

echo "*** WebSphere Java SDK - start ***" | tee -a logs/install.log;
date | tee -a logs/install.log;

$IIM_HOME/eclipse/tools/imcl install com.ibm.websphere.IBMJAVA.v70 -repositories $JDK_MEDIA/repository.config -installationDirectory $WAS_HOME -sharedResourcesDirectory $IIM_SHARED -acceptLicense -sP | tee -a logs/install.log;

echo "*** WebSphere Java SDK - complete ***" | tee -a logs/install.log;
date | tee -a logs/install.log; echo | tee -a logs/install.log;

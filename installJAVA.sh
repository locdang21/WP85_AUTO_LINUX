##########
# Filename :  installJAVA.sh
# Description : This file will install IBM JAVA for WebSphere Application Server
# Steps:
#	Install IBM JAVA for WebSphere Application Server
##########

echo "*** WebSphere Java - start ***" | tee -a logs/install.log;
date | tee -a logs/install.log;

$IIM_HOME/eclipse/tools/imcl install com.ibm.websphere.IBMJAVA.v70 -repositories $JAVA_MEDIA/repository.config -installationDirectory $WAS_HOME -sharedResourcesDirectory $IIM_SHARED -acceptLicense -sP | tee -a logs/install.log;

echo "*** WebSphere Java - complete ***" | tee -a logs/install.log;
date | tee -a logs/install.log; echo | tee -a logs/install.log;

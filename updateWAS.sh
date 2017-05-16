echo | tee -a logs/install.log;
echo "*** Update WAS/JDK - start ***" | tee -a logs/install.log;
date | tee -a logs/install.log;


echo | tee -a logs/install.log;
echo "*** Stop Configuration Wizard - start ***" | tee -a logs/install.log;
date | tee -a logs/install.log;

$WAS_HOME/profiles/cw_profile/bin/stopServer.sh server1 -user $CW_ADMIN -password $CW_PWD | tee -a logs/install.log;

echo | tee -a logs/install.log;
echo "*** Stop Configuration Wizard - complete ***" | tee -a logs/install.log;
date | tee -a logs/install.log;

echo | tee -a logs/install.log;
echo "*** Stop WebSphere_Portal - start ***" | tee -a logs/install.log;
date | tee -a logs/install.log;

$WP_PROFILE/bin/stopServer.sh WebSphere_Portal -user $WP_ADMIN -password $WP_PWD | tee -a logs/install.log;

echo | tee -a logs/install.log;
echo "*** Stop WebSphere_Portal - complete ***" | tee -a logs/install.log;
date | tee -a logs/install.log;

echo | tee -a logs/install.log;
echo "*** Upgrade WAS FP - start ***" | tee -a logs/install.log;
date | tee -a logs/install.log;

$IIM_HOME/eclipse/tools/imcl install com.ibm.websphere.ND.v85 -installationDirectory $WAS_HOME -repositories $FP_WAS_MEDIA -acceptLicense -sP | tee -a logs/install.log;

echo | tee -a logs/install.log;
echo "*** Upgrade WAS FP - complete ***" | tee -a logs/install.log;
date | tee -a logs/install.log;

echo | tee -a logs/install.log;
echo "*** Upgrade JAVA - start ***" | tee -a logs/install.log;
date | tee -a logs/install.log;

$IIM_HOME/eclipse/tools/imcl install com.ibm.websphere.IBMJAVA.v70 -installationDirectory $WAS_HOME -repositories $FP_JAVA_MEDIA -acceptLicense -sP | tee -a logs/install.log;

# $IIM_HOME/eclipse/tools/imcl install com.ibm.websphere.IBMJAVA.v80 -installationDirectory $WAS_HOME -repositories $FP_JAVA_MEDIA -acceptLicense -sP | tee -a logs/install.log;

echo | tee -a logs/install.log;
echo "*** Upgrade JAVA - complete ***" | tee -a logs/install.log;

echo | tee -a logs/install.log;
echo "*** Update WAS/JDK - complete ***" | tee -a logs/install.log;
date | tee -a logs/install.log;

echo | tee -a logs/install.log;
echo "*** Update WebSphere Portal - start ***" | tee -a logs/install.log;
date | tee -a logs/install.log;

echo | tee -a logs/install.log;
echo "*** Update WebSphere Portal property files - start ***" | tee -a logs/install.log;
date | tee -a logs/install.log;

./scripts/createResponseFile_CF.sh;

echo | tee -a logs/install.log;
echo "*** Update WebSphere Portal property files - complete ***" | tee -a logs/install.log;
date | tee -a logs/install.log;

echo | tee -a logs/install.log;
echo "*** Update WebSphere Portal with IIM - start ***" | tee -a logs/install.log;
date | tee -a logs/install.log;

$IIM_HOME/eclipse/tools/imcl install com.ibm.websphere.PORTAL.SERVER.v85 -repositories $CF_WP_MEDIA/repository.config -installationDirectory $WP_HOME -acceptLicense -sP | tee -a logs/install.log;

echo | tee -a logs/install.log;
echo "*** Update WebSphere Portal with IIM - complete ***" | tee -a logs/install.log;
date | tee -a logs/install.log;

echo | tee -a logs/install.log;
echo "*** WP applyCF - start ***" | tee -a logs/install.log;
date | tee -a logs/install.log;

$WP_PROFILE/PortalServer/bin/applyCF.sh -DPortalAdminPwd=$WP_PWD -DWasPassword=$WP_PWD | tee logs/WP_applyCF.log;

echo | tee -a logs/install.log;
echo "*** WP applyCF - complete ***" | tee -a logs/install.log;
date | tee -a logs/install.log;

echo | tee -a logs/install.log;
echo "*** Update WebSphere Portal - complete ***" | tee -a logs/install.log;
date | tee -a logs/install.log;


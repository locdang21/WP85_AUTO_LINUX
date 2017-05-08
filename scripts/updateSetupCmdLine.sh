echo "*** Update setupCmdLine - start ***" 
date
# This will uncomment the ulimit line
sed -i '/ulimit/s/^#//g' $WP_PROFILE/bin/setupCmdLine.sh

# This will comment the ulimit line
echo sed -i '/ulimit/s/^/#/g' $WP_PROFILE/bin/setupCmdLine.sh

echo "*** Update setupCmdLine - complete ***"


echo "*** Restart WebSphere Portal - start ***" | tee -a logs/install.log;
$WP_PROFILE/bin/stopServer.sh WebSphere_Portal -user $WP_ADMIN -password $WP_PWD
$WP_PROFILE/bin/startServer.sh WebSphere_Portal
echo "*** Restart WebSphere Portal - complete ***" | tee -a logs/install.log;


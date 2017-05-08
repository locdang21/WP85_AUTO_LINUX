##########
# Filename :  install.sh
# Description : This file is the starting point for the installation of the following programs
#			IBM Installation Manager
#			WebSphere Application Server 8.5.5.x
#			IBM JDK
# Steps: 
#	Set Environment variables
#	Check ulimit
#	Check Hostname
#	Install Installation Manager (installIIM.sh)
#	Install WebSphere Application Server (installWAS.sh)
#	Install IBm JDK (installJDK.sh)
#	Install WebSphere Portal Server (installPortal.sh)
##########

echo "*** Set variables - start ***" | tee logs/install.log;
date | tee -a logs/install.log;

set -a
. portalVariable.txt
set +a

echo "*** Set Variables - complete ***" | tee -a logs/install.log;
date | tee -a logs/install.log;
echo | tee -a logs/install.log;

ulimit -n 10240;

echo "*** Check Ulimit - start ***" | tee -a logs/install.log;
date | tee -a logs/install.log;

if test "$(ulimit -n)" -lt 10240
then
        echo " Ulimit is to low." | tee -a logs/install.log;
        echo "Increase the ulimit for the user before continuing" | tee -a logs/install.log;
	echo "Set the following in the /etc/security/limits.conf" | tee -a logs/install.log;
	echo "*     soft     nofile     10240" | tee -a logs/install.log
	date | tee -a logs/install.log;
        exit 1
fi

echo "*** Check Ulimit - complete ***" | tee -a logs/install.log;
date | tee -a logs/install.log; echo | tee -a logs/install.log;
echo | tee -a logs/install.log;

echo "*** Check Hostname - start ***" | tee -a logs/install.log;
date | tee -a logs/install.log;

echo
        ping -c 3 $WP_HOSTNAME
        if [ $? -eq 0 ]; then
                echo "Ping Hostname success" | tee -a logs/install.log;
        else
                echo "Ping Hostname failed, fix the hostname" | tee -a logs/install.log;
                exit 1
        fi

echo "*** Checking Hostname - complete ***" | tee -a logs/install.log;
date | tee -a logs/install.log; echo | tee -a logs/install.log;

./installIIM.sh;
./installWAS.sh;
./installJDK.sh;
./installPortal.sh;

echo "Everything Complete" | tee -a logs/install.log;
date | tee -a logs/install.log; echo | tee -a logs/install.log;

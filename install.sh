##########
# Filename :  install.sh
# Description : This file is the starting point for the installation of the following programs
#			IBM Installation Manager
#			WebSphere Application Server 8.5.5.x
#			IBM JDK
# Steps: 
#	Set Environment variables
#	Check Media location
#	Check ulimit
#	Check Hostname
#	Install Installation Manager (installIIM.sh)
#	Install WebSphere Application Server (installWAS.sh)
#	Install IBM JDK (installJDK.sh)
#	Install WebSphere Portal Server (installPortal.sh)
##########

echo "*** Set variables - start ***" | tee logs/install.log;
date | tee -a logs/install.log;

set -a
. portalVariable.txt
set +a

echo "*** Set Variables - complete ***" | tee -a logs/install.log;
date | tee -a logs/install.log; echo | tee -a logs/install.log;

echo "*** Check Media Location - start ***" | tee logs/install.log
date | tee -a logs/install.log; 

if [ -f $WAS_MEDIA/repository.config ]
then
        echo "WAS_MEDIA is present" | tee -a logs/install.log;
else
        echo "WAS_MEDIA can't be found" | tee -a logs/install.log;
        exit 1;
fi

if [ -f $JAVA_MEDIA/repository.config ]
then
        echo "JAVA_MEDIA is present" | tee -a logs/install.log;
else
        echo "JAVA_MEDIA can't be found" | tee -a logs/install.log;
        exit 1;
fi

if [ -f $WP_SERVER_MEDIA/repository.config ]
then
        echo "WP_SERVER_MEDIA is present" | tee -a logs/install.log;
else
        echo "WP_SERVER_MEDIA can't be found" | tee -a logs/install.log;
        exit 1;
fi

if [ -f $WP_ENABLE_MEDIA/repository.config ]
then
        echo "WP_ENABLE_MEDIA is present" | tee -a logs/install.log;
else
        echo "WP_ENABLE_MEDIA can't be found" | tee -a logs/install.log;
        exit 1;
fi

if [ -f $FP_WAS_MEDIA/repository.config ]
then
        echo "FP_WAS_MEDIA is present" | tee -a logs/install.log;
else
        echo "FP_WAS_MEDIA can't be found" | tee -a logs/install.log;
        exit 1;
fi

if [ -f $FP_JAVA_MEDIA/repository.config ]
then
        echo "FP_JAVA_MEDIA is present" | tee -a logs/install.log;
else
        echo "FP_JAVA_MEDIA can't be found" | tee -a logs/install.log;
        exit 1;
fi

if [ -f $CF_WP_MEDIA/repository.config ]
then
        echo "CF_WP_MEDIA is present" | tee -a logs/install.log;
else
        echo "CF_WP_MEDIA can't be found" | tee -a logs/install.log;
        exit 1;
fi

echo "*** Check Media Location - complete ***" | tee -a logs/install.log
date | tee -a logs/install.log;


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
./installJAVA.sh;
./installWP.sh;

./updateWAS.sh;
./updateWP.sh;

echo "Everything Complete" | tee -a logs/install.log;
date | tee -a logs/install.log; echo | tee -a logs/install.log;

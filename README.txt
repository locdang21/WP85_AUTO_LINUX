Author: Loc Dang

Running the script means you accept full responsibilty of the installation

The script is not written or supported by IBM.
The script are used as-is.  There are no support for the scripts
There are no uninstall scripts
The script has a few validation but does not cover all required pre-reqs.  Verify the pre-req for WebSphere Portal before continuing.

The following scripts will install and upgrade the following products.  The scripts expect the environment to be clean of any software that will be installed by the script.
	* IBM Installation Manager
	* WebSphere Application Server 8.5.5
	* IBM JAVA 7
	* WebSphere Portal Server 8.5

- To use this script, all media files must be downloaded, extracted and placed on the local file system.  The portalVariable.txt file will point to the location of the media files.
- The User running the script must have read/write/execute permission to the direcotry and files where IIM/WAS/WP will be installed at.
- The script will only install the following WebSphere Portal 8.5 entitlements (ENABLE/EXTEND/WCM)
- The script has been tested on Redhat Linux and Suse Linux.
- The script can install as a root or non-root user.
- The script can be used with any WP CumulativeFix that uses the applyCF.sh script
- The script can be used with any supported WAS 8.5.5 Fixpack
- The script does not install or upgrage JAVA 1.8. 

Instructions:
1. Copy the WP85_AUTO_LINUX directory to the system that WebSphere Portal will be installed on.
2. Update portalVariable.txt with the required information
3. run ./install.sh


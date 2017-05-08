########## 
# Name : updateWPConfigService.py
#
# Example:
# $WP_PROFILE/bin/wsadmin.sh -lang jython -f scripts/updateWPConfigService.py -user wpsadmin -password passw0rd
# 
# Description: This script will find the id for the J2EEResourceProperty of the WP ConfigService and then create 
# the new variable in the ResourceEnvironmentProvider
#
##########

# Get the id for the WP ConfigService
myNode=AdminControl.getNode()
myCell=AdminControl.getCell()

repWAS = AdminConfig.getid("/Cell:" + myCell + "/Node:" + myNode + "/Server:WebSphere_Portal/ResourceEnvironmentProvider:WP ConfigService")

print repWAS

# Get the id for the J2EEResourceProperty
j2eeWAS = AdminConfig.showAttribute(repWAS, 'propertySet')

print j2eeWAS

# Create the new variable
AdminConfig.create('J2EEResourceProperty',j2eeWAS,'[[name "uri.home.substitution"] [type "java.lang.String"] [description ""] [value "true"] [required "false"]]') 

# Save the changes
AdminConfig.save()

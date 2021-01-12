#!/bin/bash

# This script uninstalles Adobe Acrobat Reader DC

AdobeAcrobatUninstall () {
echo "Uninstalling Adobe Acrobat DC software."
while [[ $(pgrep "AdobeReader") ]]
do
	pkill "AdobeReader"
done

echo "Stopping the ARM Launch Daemons"
launchctl bootout system "/Library/LaunchDaemons/com.adobe.ARMDC.Communicator.plist"
launchctl bootout system "/Library/LaunchDaemons/com.adobe.ARMDC.SMJobBlessHelper.plist"

rm -fr "/Library/LaunchDaemons/com.adobe.ARMDC.Communicator.plist"
rm -fr "/Library/LaunchDaemons/com.adobe.ARMDC.SMJobBlessHelper.plist"

rm -fr "/Applications/Adobe Acrobat Reader DC.app"
rm -fr "/Library/Application Support/Adobe"
rm -fr "/Library/Internet Plug-Ins/AdobePDFViewer.plugin"
rm -fr "/Library/Internet Plug-Ins/AdobePDFViewerNPAPI.plugin"
rm -fr "/var/db/receipts/com.adobe.RdrServicesUpdater.bom"
rm -fr "/var/db/receipts/com.adobe.acrobat.DC.reader.browser.pkg.MUI.bom"
rm -fr "/var/db/receipts/com.adobe.acrobat.reader.11010.reader.browser.pkg.en_US.bom"
rm -fr "/var/db/receipts/com.adobe.RdrServicesUpdater.plist"
rm -fr "/var/db/receipts/com.adobe.acrobat.DC.reader.browser.pkg.MUI.plist"
rm -fr "/var/db/receipts/com.adobe.acrobat.reader.11010.reader.browser.pkg.en_US.plist"
rm -fr "/var/db/receipts/com.adobe.acrobat.DC.reader.app.pkg.MUI.bom"
rm -fr "/var/db/receipts/com.adobe.acrobat.reader.11010.reader.app.pkg.en_US.bom"
rm -fr "/var/db/receipts/com.adobe.armdc.app.pkg.bom"
rm -fr "/var/db/receipts/com.adobe.acrobat.DC.reader.app.pkg.MUI.plist"
rm -fr "/var/db/receipts/com.adobe.acrobat.reader.11010.reader.app.pkg.en_US.plist"
rm -fr "/var/db/receipts/com.adobe.armdc.app.pkg.plist"
rm -fr "/var/db/receipts/com.adobe.acrobat.DC.reader.appsupport.pkg.MUI.bom"
rm -fr "/var/db/receipts/com.adobe.acrobat.reader.11010.reader.appsupport.pkg.en_US.bom"
rm -fr "/var/db/receipts/com.adobe.acrobat.DC.reader.appsupport.pkg.MUI.plist"
rm -fr "/var/db/receipts/com.adobe.acrobat.reader.11010.reader.appsupport.pkg.en_US.plist"
}

# Set exit error code
ERROR=0

# Check to see if the Adobe Acrobat Reader software is installed
if [[ -e  "/Library/LaunchDaemons/com.adobe.ARMDC.Communicator.plist" ]] || [[ -e "/Library/LaunchDaemons/com.adobe.ARMDC.SMJobBlessHelper.plist" ]] || [[ -e "/Applications/Adobe Acrobat Reader DC.app" ]] || [[ -e "/Library/Application Support/Adobe" ]] || [[ -e "/Library/Internet Plug-Ins/AdobePDFViewer.plugin" ]] || [[ -e "/Library/Internet Plug-Ins/AdobePDFViewerNPAPI.plugin" ]]
then
	AdobeAcrobatUninstall

	if [[ $? -eq 0 ]]
	then
		echo "Adobe Acrobat Reader uninstalled successfully."
	else
		echo "Error: Failed to uninstall Adobe Acrobat Reader"
		ERROR=1
	fi
else
	echo "Error: Adobe Acrobat Reader software is not installed."
	ERROR=1
fi
exit $ERROR
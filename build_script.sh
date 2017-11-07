#!/bin/sh
appname="HalfTunes"
target_name="$appname"
sdk="iphoneos"
certificate="iPhone Distribution:AMIT KISHNANI"
project_dir="$HOME/Public/iOSAdvanced/HalfTunes"
build_location="$HOME/Public/iOSAdvanced/HalfTunes/build"

if [ ! -d "$build_location" ]; then
    mkdir -p "$build_location"
fi
  
cd "$project_dir"

xcodebuild test -project $appname.xcodeproj/ -scheme $appname -destination 'platform=iOS Simulator,name=iPhone X,OS=11.0.1'
# xcodebuild -project HalfTunes.xcodeproj/ -scheme HalfTunes -sdk iphoneos -configuration Release archive -archivePath $PWD/build/HalfTunes.xcarchive
# xcodebuild -exportArchive -archivePath $PWD/build/HalfTunes.xcarchive  -exportOptionsPlist exportOptions.plist -exportPath $PWD/build  -allowProvisioningUpdates true
# zip -r "$appname.archive.dSYM.zip" "$appname.archive.dSYMs.HalfTunes.app.dSYM"

# app_version_number=$(/usr/libexec/PlistBuddy -c "Print :CFBundleVersion" Info.plist)
# echo $app_version_number
# /usr/libexec/PlistBuddy -c "Set :CFBundleIdentifier $bundle_id" Info.plist

# # function buildApp
# # {

# # }

# buildApp

# function deployToTestLight 
# {
#     /usr/bin/curl "http://testflightapp.com/api/builds.json" \ 
#     -F file=@"$build_location/$appname.ipa" \
#     -F api_token="$TESTFLIGHT_APIKEY" \ 
#     -F team_token="$TESTFLIGHT_TEAM" \ 
#     -F notes="$appname uploaded via the testflight upload API"\ 
#     -F notify="False"
# }
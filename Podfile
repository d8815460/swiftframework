source 'https://github.com/CocoaPods/Specs.git'
# Uncomment this line to define a global platform for your project

# Uncomment this line if you're using Swift
use_frameworks!


workspace 'FinalWorkspace.xcworkspace'
xcodeproj 'SmartHome.xcodeproj'
xcodeproj 'commonux/CommonUX.xcodeproj'
xcodeproj 'SmartHomeDataModel/SmartHomeDataModel.xcodeproj'

target 'SmartHome' do
    platform :ios, '8.0'
    xcodeproj 'SmartHome.xcodeproj'
    pod 'Parse', '~> 1.13'
    pod 'ParseFacebookUtilsV4'
    pod 'ParseTwitterUtils'
    pod 'ParseUI', ‘~> 1.2.0’
    pod 'MBProgressHUD', '~> 0.9.2'
    pod 'PKRevealController'
    pod 'Popover', '~> 0.9'
    pod 'IQKeyboardManagerSwift', '~> 4.0'
    pod 'FMDB'
    pod 'ASIHTTPRequest'
    pod 'SVPullToRefresh'
    pod 'HMLauncherView', '~>1.0'
end


target 'CommonUX' do
    platform :ios, '8.0'
    xcodeproj 'commonux/CommonUX.xcodeproj'
    pod 'MBProgressHUD', '~> 0.9.2'
    pod 'IQKeyboardManagerSwift', '~> 4.0'
    pod 'Parse', '~> 1.13'
    pod 'ParseFacebookUtilsV4', '~> 1.11'
    pod 'ParseTwitterUtils', '~> 1.10'
    pod 'ParseUI', ‘~> 1.2.0’
end
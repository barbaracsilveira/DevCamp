source 'https://github.com/CocoaPods/Specs.git'

platform :ios, '11.0'
use_frameworks!

# ignore all warnings from all pods
inhibit_all_warnings!

def pods
    pod 'Alamofire', '~> 4.8.1'
    pod 'AlamofireObjectMapper', '~> 5.2.0'
    pod 'ObjectMapper', '~> 3.4.0'
    pod 'SDWebImage', '~> 5.1.0'
    pod 'XCDYouTubeKit', '~> 2.8.0'
end

target 'DevCamp' do
    workspace 'DevCamp'
    platform :ios, '11.4'
    project 'DevCamp.xcodeproj'
    pods
end

target 'DevCampTV' do
    workspace 'DevCamp'
    platform :tvos, '11.4'
    project 'DevCampTV.xcodeproj'
    pods
end

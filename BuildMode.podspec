#
# Be sure to run `pod lib lint BuildMode.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'BuildMode'
  s.version          = '0.1.0'
  s.summary          = 'Provides info about the iOS app for simulator, debuggable, enterprise or distribution builds to use sandbox or production cloud from Apple'
  s.swift_versions   = '5'
  s.description      = <<-DESC
Parses the provisioning profile and entitlements from the main bundle and uses un-official heuristics to determine whether a build is for simulator, debuggable, enterprise or distribution.
This helps determine when the app should use sandbox or production cloud services from Apple in the server-side.
                       DESC

  s.homepage         = 'https://github.com/bithavoc/BuildMode'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'bithavoc' => 'im@bithavoc.io' }
  s.source           = { :git => 'https://github.com/bithavoc/BuildMode.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/bithavoc'

  s.ios.deployment_target = '13.0'

  s.source_files = 'BuildMode/Classes/**/*'
end

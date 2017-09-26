#
# Be sure to run `pod lib lint TextureSwiftHelpers.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'TextureSwiftHelpers'
  s.version          = '0.3'
  s.summary          = 'Texture Swift helpers'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  Texture Swift helpers for better layout in Swift projects
                       DESC

  s.homepage         = 'https://mmulyar@bitbucket.org/mmulyar/textureswifthelpers.git'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'mikhailmulyar' => 'mulyarm@gmail.com' }
  s.source           = { :git => 'https://bitbucket.org/mmulyar/textureswifthelpers.git', :tag => 0.2 }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'TextureSwiftHelpers/Classes/**/*'
  
  # s.resource_bundles = {
  #   'TextureSwiftHelpers' => ['TextureSwiftHelpers/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  
  s.pod_target_xcconfig = { 'SWIFT_VERSION' => '3' }
  s.dependency 'Texture', '~> 2.0'
  
end

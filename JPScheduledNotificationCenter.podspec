#
# Be sure to run `pod lib lint JPScheduledNotificationCenter.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "JPScheduledNotificationCenter"
  s.version          = "1.0.0"
  s.summary          = "A scheduled NSNotification manager."

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
                       A µ-framework to schedule dispatch of NSNotifications.
                       DESC

  s.homepage         = "https://github.com/teddynewell/JPScheduledNotificationCenter"
  s.license          = 'MIT'
  s.author           = { "JamesPerlman" => "jam.e.perl@gmail.com", "teddynewell" => "teddynewell@icloud.com" }
  s.source           = { :git => "https://github.com/teddynewell/JPScheduledNotificationCenter.git", :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.source_files = 'JPScheduledNotificationCenter/Classes/**/*'
  s.resource_bundles = {
    'JPScheduledNotificationCenter' => ['JPScheduledNotificationCenter/Assets/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end

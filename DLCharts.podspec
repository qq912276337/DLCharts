#
# Be sure to run `pod lib lint DLCharts.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'DLCharts'
  s.version          = '0.1.3'
  s.summary          = 'DLCharts'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
DLCharts DLCharts DLCharts DLCharts DLCharts DLCharts
                       DESC

  s.homepage         = 'https://github.com/qq912276337/DLCharts'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'qq912276337' => 'smlsjq@163.com' }
  s.source           = { :git => 'https://github.com/qq912276337/DLCharts.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'DLCharts/Classes/**/*'
  
  # s.resource_bundles = {
  #   'DLCharts' => ['DLCharts/Assets/*.png']
  # }

  s.public_header_files = 'DLCharts/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
  s.frameworks = 'UIKit'
  s.dependency 'Charts'

end

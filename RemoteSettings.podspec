#
# Be sure to run `pod lib lint RemoteSettings.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'RemoteSettings'
  s.version          = '0.1.0'
  s.swift_versions    = ['5.0', '5.1', '5.2', '5.3']
  s.summary          = 'A core definitions of RemoteSettings.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
These base protocols enables you to decouple RemoteSettings from third-pary agencies.
                       DESC

  s.homepage         = 'https://github.com/congncif/RemoteSettings'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'NGUYEN CHI CONG' => 'congnc.if@gmail.com' }
  s.source           = { :git => 'https://github.com/congncif/RemoteSettings.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/congncif'
  
  s.ios.deployment_target = '10.0'
  
  s.default_subspec = 'Default'
  
  s.subspec 'Default' do |co|
      co.dependency 'RemoteSettings/Core'
  end
  
  s.subspec 'Core' do |co|
      co.source_files = 'RemoteSettings/RemoteSettings/**/*'
  end
  
  s.subspec 'Rx' do |co|
      co.source_files = 'RemoteSettings/RemoteSettings+Rx/**/*'
      
      co.dependency 'RemoteSettings/Core'
      
      co.dependency 'RxSwift'
  end
end

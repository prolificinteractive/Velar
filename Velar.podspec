#
# Be sure to run `pod lib lint Velar.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'Velar'
  s.version          = '0.1.7'
  s.summary          = 'A custom alert view presenter.'

  s.description      = <<-DESC
  Velar can present a custom view with a swipeable dismiss gesture.
                       DESC

  s.homepage         = 'https://github.com/prolificinteractive/Velar'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Jonathan Samudio' => 'jonathan2457@gmail.com' }
  s.source           = { :git => 'https://github.com/prolificinteractive/Velar.git', :tag => s.version.to_s }

  s.ios.deployment_target = '9.0'

  s.source_files = 'Velar/Velar/Classes/**/*'
  
end

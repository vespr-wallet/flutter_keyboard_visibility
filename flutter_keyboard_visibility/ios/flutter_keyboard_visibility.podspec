#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint flutter_keyboard_visibility.podspec' to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'flutter_keyboard_visibility'
  s.version          = '0.0.1'
  s.summary          = 'flutter_keyboard_visibility'
  s.description      = <<-DESC
Flutter keyboard visibility
                       DESC
  s.homepage         = 'https://github.com/MisterJimson/flutter_keyboard_visibility'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Jason Rai' => 'jason.c.rai@gmail.com' }
  s.source           = { :path => '.' }
  s.source_files = 'flutter_keyboard_visibility/Sources/flutter_keyboard_visibility/**/*.swift'
  s.dependency 'Flutter'
  s.platform = :ios, '12.0'
  s.swift_version = '5.0'

  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES' }
end

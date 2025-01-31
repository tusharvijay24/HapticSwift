Pod::Spec.new do |s|
  s.name             = 'HapticSwift'
  s.version          = '0.1.0'
  s.summary          = 'A lightweight Swift library for haptic feedback integration in iOS applications.'

  s.description      = <<-DESC
                        HapticSwift is a Swift library that provides an easy-to-use API for integrating haptic feedback into iOS applications. It supports predefined haptic patterns such as success, warning, error, and impact feedback, as well as custom haptic patterns with configurable intensity and duration. The library leverages Core Haptics and UIFeedbackGenerator to provide rich haptic interactions.
                          DESC
  s.homepage         = 'https://github.com/tusharvijay24/HapticSwift'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'tusharvijay24' => 'tusharvijayvargiya24112000@gmail.com' }
  s.source           = { :git => 'https://github.com/tusharvijay24/HapticSwift.git', :tag => s.version.to_s }

  s.ios.deployment_target = '13.0'
  s.swift_version    = '5.0'
  s.source_files = 'HapticSwift/Classes/**/*'
  # Include dependencies if required
  s.frameworks = 'UIKit', 'CoreHaptics'
  # Specify module
  s.module_name = 'HapticSwift'
end

# HapticSwift

[![CI Status](https://img.shields.io/travis/tusharvijay24/HapticSwift.svg?style=flat)](https://travis-ci.org/tusharvijay24/HapticSwift)
[![Version](https://img.shields.io/cocoapods/v/HapticSwift.svg?style=flat)](https://cocoapods.org/pods/HapticSwift)
[![License](https://img.shields.io/cocoapods/l/HapticSwift.svg?style=flat)](https://cocoapods.org/pods/HapticSwift)
[![Platform](https://img.shields.io/cocoapods/p/HapticSwift.svg?style=flat)](https://cocoapods.org/pods/HapticSwift)

## Overview
HapticSwift is a lightweight Swift library that simplifies haptic feedback integration in iOS applications. It provides an easy-to-use API for triggering predefined haptic patterns and custom haptic effects.

## Features
- Supports predefined haptic feedback types: `light`, `medium`, `heavy`, `success`, `warning`, `error`, `selection`.
- Allows custom haptic feedback with intensity and duration control.
- Uses `CoreHaptics` and `UIFeedbackGenerator`.
- Debug mode for logging haptic events.

## Example
To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements
- iOS 13.0+
- Swift 5.0+
- Devices with **Taptic Engine** (iPhone 8 and newer)

## Installation
HapticSwift is available through [CocoaPods](https://cocoapods.org). To install it, simply add the following line to your Podfile:

```ruby
pod 'HapticSwift'
```

Then, run:
```sh
pod install
```

## Usage
### Import HapticSwift
```swift
import HapticSwift
```

### Enable Debug Mode (Optional)
```swift
HapticSwift.enableDebugMode(true)
```

### Trigger Haptic Feedback
#### Predefined Feedback
```swift
HapticSwift.trigger(.light)
HapticSwift.trigger(.medium)
HapticSwift.trigger(.heavy)
HapticSwift.trigger(.success)
HapticSwift.trigger(.warning)
HapticSwift.trigger(.error)
HapticSwift.trigger(.selection)
```

#### Custom Haptic Feedback
```swift
HapticSwift.trigger(.custom(intensity: 0.8, duration: 0.5))
```

#### Stop Custom Haptic
```swift
HapticSwift.stopCustomHaptic()
```

### Example Usage in a ViewController
```swift
import UIKit
import HapticSwift

class ViewController: UIViewController {
    
    @IBOutlet weak var btnHaptic: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnHaptic.layer.cornerRadius = 5
        HapticSwift.enableDebugMode(true)
    }
    
    @IBAction func didTapPlayHaptic(_ sender: UIButton) {
        HapticSwift.trigger(.medium)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            HapticSwift.trigger(.custom(intensity: 0.8, duration: 0.5))
        }
    }
}
```

## Author
[tusharvijay24](https://github.com/tusharvijay24)  
Email: [tusharvijayvargiya24112000@gmail.com](mailto:tusharvijayvargiya24112000@gmail.com)

## License
HapticSwift is available under the MIT license. See the LICENSE file for more info.

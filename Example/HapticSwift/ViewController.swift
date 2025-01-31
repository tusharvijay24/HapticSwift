//
//  ViewController.swift
//  HapticSwift
//
//  Created by tusharvijay24 on 01/31/2025.
//  Copyright (c) 2025 tusharvijay24. All rights reserved.
//

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

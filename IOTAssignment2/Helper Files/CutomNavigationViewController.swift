//
//  CutomNavigationViewController.swift
//  Tour Melbourne
//
//  Created by Ojas Chimane on 20/8/19.
//  Copyright © 2019 Ojas Chimane. All rights reserved.
//

import UIKit

// This class sets the background to transparent
class CustomNavigationViewController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationBar.shadowImage = UIImage()
    }
    
    
}

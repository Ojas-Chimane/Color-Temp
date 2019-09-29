//
//  ColorDetailViewController.swift
//  IOTAssignment2
//
//  Created by Ojas Chimane on 25/9/19.
//  Copyright © 2019 Ojas Chimane Org. All rights reserved.
//

import UIKit
import Lottie

class ColorDetailViewController: UIViewController {

    @IBOutlet weak var backgroundView: UIView!
    
    var selectedColor:Int?
    var hexValue:String?
    var detailRedValue:Int?
    var detailBlueValue:Int?
    var detailGreenValue:Int?
    var detailDate:String?
    var detailTime:String?
    
    @IBOutlet weak var hexValueLabel: UILabel!
    @IBOutlet weak var redValueLabel: UILabel!
    @IBOutlet weak var greenValueLabel: UILabel!
    @IBOutlet weak var blueValueLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var lottieAnimationView: AnimationView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup UI elements
        backgroundView.layer.cornerRadius = 15
        backgroundView.backgroundColor = UIColor(red: CGFloat(detailRedValue!)/255.0, green: CGFloat(detailGreenValue!)/255.0, blue: CGFloat(detailBlueValue!)/255.0,alpha: 1.0)
        
        hexValueLabel.text = hexValue
        redValueLabel.text = String(detailRedValue!)
        greenValueLabel.text = String(detailGreenValue!)
        blueValueLabel.text = String(detailBlueValue!)
        dateLabel.text = detailDate
        timeLabel.text = detailTime
        
        playAnimation()
        
    }
    
    private func playAnimation() {

        let animation = Animation.named("mountain")
        lottieAnimationView.animation = animation
        lottieAnimationView.contentMode = .scaleAspectFill
        lottieAnimationView.loopMode = .loop
        lottieAnimationView.play()
        
    }
}

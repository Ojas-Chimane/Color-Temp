//
//  ColorDetailViewController.swift
//  IOTAssignment2
//
//  Created by Ojas Chimane on 25/9/19.
//  Copyright © 2019 Ojas Chimane Org. All rights reserved.
//

import UIKit

class ColorDetailViewController: UIViewController {

    @IBOutlet weak var backgroundView: UIView!
    
    var selectedColor:Int?
    var detailRedValue:Int?
    var detailBlueValue:Int?
    var detailGreenValue:Int?
    var detailDate:String?
    var detailTime:String?
    
    @IBOutlet weak var redValueLabel: UILabel!
    @IBOutlet weak var greenValueLabel: UILabel!
    @IBOutlet weak var blueValueLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Selected Detail index:", selectedColor)
        
        backgroundView.layer.cornerRadius = 15
        
        backgroundView.backgroundColor = UIColor(red: CGFloat(detailRedValue!)/255.0, green: CGFloat(detailGreenValue!)/255.0, blue: CGFloat(detailBlueValue!)/255.0,alpha: 1.0)
        
        redValueLabel.text = String(detailRedValue!)
        greenValueLabel.text = String(detailGreenValue!)
        blueValueLabel.text = String(detailBlueValue!)
        dateLabel.text = detailDate
        timeLabel.text = detailTime
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

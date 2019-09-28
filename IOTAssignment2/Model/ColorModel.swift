//
//  Color.swift
//  IOTAssignment2
//
//  Created by Ojas Chimane on 25/9/19.
//  Copyright © 2019 Ojas Chimane Org. All rights reserved.
//

import Foundation

class ColorModel{
    var redValue:Int?
    var blueValue:Int?
    var greenValue:Int?
    var date:String?
    var time:String?
    var hexValue:String?
    
    init(redValue:Int,blueValue:Int,greenValue:Int,date:String,time:String,hexValue:String){
        self.redValue = redValue
        self.blueValue = blueValue
        self.greenValue = greenValue
        self.date = date
        self.time = time
        self.hexValue = hexValue
    }
}

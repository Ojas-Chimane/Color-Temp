//
//  Temperature.swift
//  IOTAssignment2
//
//  Created by Ojas Chimane on 25/9/19.
//  Copyright © 2019 Ojas Chimane Org. All rights reserved.
//

import Foundation

class Temperature{
    var date:String?
    var time:String?
    var temp_val:Int?
    
    init(date:String,time:String,temp_val:Int){
        self.date = date
        self.time = time
        self.temp_val = temp_val
    }
    
}

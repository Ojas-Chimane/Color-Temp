//
//  WeatherHistoryTableViewCell.swift
//  IOTAssignment2
//
//  Created by Ojas Chimane on 28/9/19.
//  Copyright © 2019 Ojas Chimane Org. All rights reserved.
//

import UIKit

class WeatherHistoryTableViewCell: UITableViewCell {

    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var temperatureDateLabel: UILabel!
    @IBOutlet weak var temperatureTimeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

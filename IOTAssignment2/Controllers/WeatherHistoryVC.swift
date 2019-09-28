//
//  WeatherHistoryVC.swift
//  IOTAssignment2
//
//  Created by Ojas Chimane on 28/9/19.
//  Copyright © 2019 Ojas Chimane Org. All rights reserved.
//

import UIKit

class WeatherHistoryVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
}

extension WeatherHistoryVC: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ROOM_HISTORY_IDENTIFIER") as! WeatherHistoryTableViewCell
        return cell
    }
    
    
    
    
    
}

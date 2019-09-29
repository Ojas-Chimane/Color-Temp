//
//  WeatherHistoryVC.swift
//  IOTAssignment2
//
//  Created by Ojas Chimane on 28/9/19.
//  Copyright © 2019 Ojas Chimane Org. All rights reserved.
//

import UIKit
import FirebaseCore
import FirebaseFirestore

class WeatherHistoryVC: UIViewController {

    var db: Firestore!
    var temperatureList = [Temperature]()
    @IBOutlet weak var temperatureTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Setup firebase
        db = Firestore.firestore()
        
        fetchTemperatureList()
    }
    
    private func fetchTemperatureList(){
        db.collection("temp-readings").order(by: "timestamp", descending: true).getDocuments() { (querySnapshot, err) in
                   if let err = err {
                       print("Error getting documents: \(err)")
                   } else {
                       for document in querySnapshot!.documents {
                           print("Firestore working")
                           print("\(document.documentID) => \(document.data())")
                           let date = document.get("date") as! String
                           let time = document.get("time") as! String
                           let tempVal = document.get("temp_val") as! Int
                           let tempModel = Temperature(date: date, time: time, temp_val: tempVal)
                           self.temperatureList.append(tempModel)
                           
                           DispatchQueue.main.async {
                               self.temperatureTableView.reloadData()
                           }
                       }
                   }
               }
    }
    
    
    
}

extension WeatherHistoryVC: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return temperatureList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ROOM_HISTORY_IDENTIFIER") as! WeatherHistoryTableViewCell
        cell.temperatureDateLabel.text = temperatureList[indexPath.row].date
        cell.temperatureTimeLabel.text = temperatureList[indexPath.row].time
        cell.temperatureLabel.text = ("\(temperatureList[indexPath.row].temp_val!)") + "°C"
        return cell
    }
    
    
    
    
    
}

//
//  ViewController.swift
//  IOTAssignment2
//
//  Created by Ojas Chimane on 24/9/19.
//  Copyright © 2019 Ojas Chimane Org. All rights reserved.
//

import UIKit
import FirebaseCore
import FirebaseFirestore

class ViewController: UIViewController {
    var selectedColorIndex: Int?
    var db: Firestore!
    var colorList = [ColorModel]()
  
    @IBOutlet weak var colorCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        db = Firestore.firestore()
        getCollection()
    }
    
    private func getCollection() {
        // [START get_collection]
        db.collection("colour-readings").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    print("Firestore working")
                    print("\(document.documentID) => \(document.data())")
                    let blueVal = document.get("b_val") as! Int
                    let redVal = document.get("r_val") as! Int
                    let greenVal = document.get("g_val") as! Int
                    let date = document.get("date") as! String
                    let time = document.get("time") as! String
                    let colorMod = ColorModel(redValue: redVal, blueValue: blueVal,greenValue:greenVal, date: date, time: time)
                    self.colorList.append(colorMod)

                    DispatchQueue.main.async {
                               self.colorCollectionView.reloadData()
                           }
                    
                }
            }
        }
        // [END get_collection]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
                    if let viewController = segue.destination as? ColorDetailViewController {
                      if(sender != nil){
                        viewController.selectedColor = sender as? Int
                        let selectedIndex = sender as? Int
                        viewController.detailBlueValue = colorList[selectedIndex!].blueValue
                        viewController.detailGreenValue = colorList[selectedIndex!].greenValue
                        viewController.detailRedValue = colorList[selectedIndex!].redValue
                        viewController.detailDate = colorList[selectedIndex!].date
                        viewController.detailTime = colorList[selectedIndex!].time
                      print("desti")
                       }
                    }
      }
    
 
}

extension ViewController:UICollectionViewDataSource, UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colorList.count
       
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // get a reference to our storyboard cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants().HISTORIC_COLOR_IDENTIFIER, for: indexPath as IndexPath) as! ColorCollectionViewCell
        
//        cell.backgroundColor = UIColor(red: CGFloat(colorList[indexPath.row].redValue!/255), green: CGFloat(colorList[indexPath.row].greenValue!/255), blue: CGFloat(colorList[indexPath.row].blueValue!/255), alpha: 1.0)
        
        cell.backgroundColor = UIColor(red: CGFloat(colorList[indexPath.row].redValue!)/255.0, green: CGFloat(colorList[indexPath.row].greenValue!)/255.0, blue: CGFloat(colorList[indexPath.row].blueValue!)/255.0,alpha: 1.0)
        
        cell.layer.cornerRadius = 8

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Selected: ", indexPath.row )
        performSegue(withIdentifier: Constants().COLOR_DETAIL_SEGUE, sender: indexPath.row)
    }
    
    
  
    

    
}


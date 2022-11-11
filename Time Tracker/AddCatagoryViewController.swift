//
//  AddCatagoryViewController.swift
//  Time Tracker
//
//  Created by mehemmed ismayilov on 11/9/22.
//

import UIKit

class AddCatagoryViewController: UIViewController {

    @IBOutlet weak var colorColllectionCell: UICollectionView!
    var list = [KatagoryHistory]()
    var colorCode:[String] = ["#ED1515" , "#D85723" , "#E1AF00" , "4A9F00", "0FDFCA" , "FF9900" , "FFA5A5" , "00FFF0" , "8E15ED" , "ED15B1" , "00FF29"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let context = appDelegate.persistentContainer.viewContext
        
        colorColllectionCell.delegate = self
        colorColllectionCell.dataSource = self
        
        let historyAdd = KatagoryHistory(context: context)
        historyAdd.projectName = "new Click"
        historyAdd.katagoryName = "NSP"
        historyAdd.endDate  = 0
        historyAdd.startDate  = 0
        historyAdd.total  = 0
        historyAdd.play  = false
        
        appDelegate.saveContext()
        
        do{
            list = try context.fetch(KatagoryHistory.fetchRequest())
            for i in list{
                print("name \(i.projectName!) id: \(i.id)")
            }
        }catch{
            print("error")
        }

    }

}
extension AddCatagoryViewController:UICollectionViewDataSource , UICollectionViewDelegate{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colorCode.count
        
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell =  colorColllectionCell.dequeueReusableCell(withReuseIdentifier: "addKatagoryCell", for: indexPath) as! AddKatagoryCollectionViewCell
        
        cell.BaseColor.backgroundColor =  UIColor(named: colorCode[indexPath.row])
        
        return cell
    }
}

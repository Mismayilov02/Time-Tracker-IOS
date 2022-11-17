//
//  AddCatagoryViewController.swift
//  Time Tracker
//
//  Created by mehemmed ismayilov on 11/9/22.
//

import UIKit

class AddCatagoryViewController: UIViewController {

    @IBOutlet weak var catagoryNameText: UITextField!
    @IBOutlet weak var iconText: UILabel!
    @IBOutlet weak var colorColllectionCell: UICollectionView!
    
    var baseColorCode:String = ""
    var colorCode:[String] = ["#ED1515" , "#D85723" , "#E1AF00" , "4A9F00", "0FDFCA" , "FF9900" , "FFA5A5" , "00FFF0" , "8E15ED" , "ED15B1" , "00FF29"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      
        iconText.textColor = .red
        colorColllectionCell.delegate = self
        colorColllectionCell.dataSource = self
        readDataaseValues()

    }
    
    @IBAction func addCatagoryBtn(_ sender: Any) {
        if catagoryNameText.text != "" {
            print( catagoryNameText.text!)
            addDatabaseValue(Katagoryname: catagoryNameText.text!, colorCode:  baseColorCode, projectName: nil)
            
        }else{
            Toast.show(message: "My message", controller: self)
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
        
        var color1 = hexStringToUIColor(hex: colorCode[indexPath.row])
        
        if colorCode.count-1 == indexPath.row{
            iconText.textColor = hexStringToUIColor(hex: colorCode[indexPath.row])
            baseColorCode = colorCode[indexPath.row]
        }
        
        cell.bottomColor.backgroundColor = color1
        cell.baseColor.backgroundColor = color1
        cell.baseColor.layer.cornerRadius = 10
        cell.bottomColor.layer.cornerRadius = 5
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        iconText.textColor = hexStringToUIColor(hex: colorCode[indexPath.row])
        baseColorCode = colorCode[indexPath.row]
    }
}



func hexStringToUIColor (hex:String) -> UIColor {
    var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

    if (cString.hasPrefix("#")) {
        cString.remove(at: cString.startIndex)
    }

    if ((cString.count) != 6) {
        return UIColor.gray
    }

    var rgbValue:UInt64 = 0
    Scanner(string: cString).scanHexInt64(&rgbValue)

    return UIColor(
        red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
        green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
        blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
        alpha: CGFloat(1.0)
    )
}

func addDatabaseValue(Katagoryname:String , colorCode:String , projectName:String?  ){
    let context = appDelegate.persistentContainer.viewContext
    let historyAdd = KatagoryHistory(context: context)
    historyAdd.projectName = projectName
    historyAdd.katagoryName = Katagoryname
    historyAdd.expend = false
    historyAdd.colorCode = colorCode
    historyAdd.play  = false
    
    appDelegate.saveContext()
}

func readDataaseValues(){
     do{
         var list = [KatagoryHistory]()
         let context = appDelegate.persistentContainer.viewContext
            list = try context.fetch(KatagoryHistory.fetchRequest())
            for i in list{
                print("name \(i.katagoryName!) id: \(i.id)")
                print("colorCode \(i.colorCode) id: \(i.id)")
            }
        }catch{
            print("error")
        }
}

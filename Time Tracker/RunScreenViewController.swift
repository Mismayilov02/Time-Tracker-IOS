//
//  RunScreenViewController.swift
//  Time Tracker
//
//  Created by mehemmed ismayilov on 11/9/22.
//

import UIKit

class RunScreenViewController: UIViewController {
    var list = [ProjecyHistory]()
    var listRun = [ProjecyHistory]()

    @IBOutlet weak var expandableImageView: UIImageView!
    @IBOutlet weak var expendImageView: UIImageView!
    @IBOutlet weak var runProjectCell: UITableView!
    @IBOutlet weak var catagoryView: UIView!
    @IBOutlet weak var catagoryCell: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let image = UIImage(named: "NSPSOLUTIONS")
        self.navigationItem.titleView = UIImageView(image: image)

        catagoryView.layer.cornerRadius = 15
        catagoryCell.dataSource = self
        catagoryCell.delegate = self
        runProjectCell.delegate = self
        runProjectCell.dataSource = self
        catagoryCell.separatorStyle = .none
        runProjectCell.separatorStyle = .none
        
        
        list.append(ProjecyHistory(katagoryName: "NSP", projectName: "yeni teiaz", totalTime: 300, startDate: 0, endDate: 0, coloCode: "de", play: true))
        list.append(ProjecyHistory(katagoryName: "NSP", projectName: "new teiaz", totalTime: 200, startDate: 0, endDate: 0, coloCode: "de", play: true))
        list.append(ProjecyHistory(katagoryName: "NSP", projectName: "yox teiaz", totalTime: 500, startDate: 0, endDate: 0, coloCode: "de", play: false))
        list.append(ProjecyHistory(katagoryName: "NSP", projectName: "olan teiaz", totalTime: 300, startDate: 0, endDate: 0, coloCode: "de", play: true))
        list.append(ProjecyHistory(katagoryName: "NSP", projectName: "yeneded teiaz", totalTime: 500, startDate: 0, endDate: 0, coloCode: "de", play: true))
        
        
        listRun.append(ProjecyHistory(katagoryName: "NSP", projectName: "yox teiaz", totalTime: 500, startDate: 0, endDate: 0, coloCode: "de", play: false))
        listRun.append(ProjecyHistory(katagoryName: "NSP", projectName: "olan teiaz", totalTime: 300, startDate: 0, endDate: 0, coloCode: "de", play: false))
        listRun.append(ProjecyHistory(katagoryName: "NSP", projectName: "yeneded teiaz", totalTime: 500, startDate: 0, endDate: 0, coloCode: "de", play: false))
        // Do any additional setup after loading the view.
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
extension RunScreenViewController:UITableViewDataSource , UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if tableView == catagoryCell{
            if list[indexPath.row].play == true {
                return CGFloat(list[indexPath.row].totalTime!)
            }else{
                return CGFloat(65)
            }
        }else
            {
                return CGFloat(50)
            }
    }
 
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
        
    }
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(tableView == catagoryCell){
            return list.count
        }else{
            return listRun.count
        }
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == catagoryCell{
            let cell = tableView.dequeueReusableCell(withIdentifier: "runCatagoryCell", for: indexPath) as! RunCatagoryTableViewCell
            
            let history = list[indexPath.row]
            if list[indexPath.row].play == true {
                cell.expandImageView.image = UIImage(named: "up")
            }else{
                cell.expandImageView.image = UIImage(named: "down")
            }
            
            cell.catagoryColor.image = cell.catagoryColor.image?.withRenderingMode(.alwaysTemplate)
            cell.catagoryColor.tintColor = UIColor.blue
        
            cell.projectCell.tag = indexPath.section
            
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "runRunProject", for: indexPath) as! RunRunProjectTableViewCell
            
          //  let history = list[indexPath.row]
            //cell.name.text = history.projectName
        
          //  cell.projectCell.tag = indexPath.section
           // cell.projectName.text = history.projectName
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if list[indexPath.row].play == true {
            
            list[indexPath.row].play = false
            tableView.reloadData()
            
        }else{
            list[indexPath.row].play = true
            tableView.reloadData()
        }
    }
    
    
}


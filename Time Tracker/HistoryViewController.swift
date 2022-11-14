//
//  HistoryViewController.swift
//  Time Tracker
//
//  Created by mehemmed ismayilov on 11/9/22.
//

import UIKit

class HistoryViewController: UIViewController {
    
 
    @IBOutlet weak var historyTableView: UITableView!
    

    var list = [ProjecyHistory]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
     
       historyTableView.dataSource = self
        historyTableView.delegate = self
        historyTableView.separatorStyle = .none
        
        list.append(ProjecyHistory(katagoryName: "NSP", projectName: "yeni teiaz", totalTime: 300, startDate: 0, endDate: 0, coloCode: "de", play: false))
        list.append(ProjecyHistory(katagoryName: "NSP", projectName: "new teiaz", totalTime: 200, startDate: 0, endDate: 0, coloCode: "de", play: false))
        list.append(ProjecyHistory(katagoryName: "NSP", projectName: "yox teiaz", totalTime: 500, startDate: 0, endDate: 0, coloCode: "de", play: false))
        list.append(ProjecyHistory(katagoryName: "NSP", projectName: "olan teiaz", totalTime: 300, startDate: 0, endDate: 0, coloCode: "de", play: false))
        list.append(ProjecyHistory(katagoryName: "NSP", projectName: "yeneded teiaz", totalTime: 500, startDate: 0, endDate: 0, coloCode: "de", play: false))
        
        
    }
    


}
extension HistoryViewController:UITableViewDataSource , UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(list[indexPath.row].totalTime!)
    }
 
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    
        
    }
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "historyCell", for: indexPath) as! HistoryTableViewCell
        
        let history = list[indexPath.row]
        //cell.name.text = history.projectName
    
        cell.projectTableViewCell.tag = indexPath.section
       // cell.projectName.text = history.projectName
        
        return cell
    }
}

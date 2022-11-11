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
        
        list.append(ProjecyHistory(katagoryName: "NSP", projectName: "yeni teiaz", totalTime: 0, startDate: 0, endDate: 0, coloCode: "de", play: false))
        list.append(ProjecyHistory(katagoryName: "NSP", projectName: "new teiaz", totalTime: 0, startDate: 0, endDate: 0, coloCode: "de", play: false))
        list.append(ProjecyHistory(katagoryName: "NSP", projectName: "yox teiaz", totalTime: 0, startDate: 0, endDate: 0, coloCode: "de", play: false))
        list.append(ProjecyHistory(katagoryName: "NSP", projectName: "olan teiaz", totalTime: 0, startDate: 0, endDate: 0, coloCode: "de", play: false))
        list.append(ProjecyHistory(katagoryName: "NSP", projectName: "yeneded teiaz", totalTime: 0, startDate: 0, endDate: 0, coloCode: "de", play: false))
        
        
    }
    


}
extension HistoryViewController:UITableViewDataSource , UITableViewDelegate{
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    
        
    }
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "historyCell", for: indexPath) as! HistoryTableViewCell
        
        let history = list[indexPath.row]
    
        cell.projectName.text = history.projectName
        
        return cell
    }
}

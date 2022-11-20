//
//  RunScreenViewController.swift
//  Time Tracker
//
//  Created by mehemmed ismayilov on 11/9/22.
//

import UIKit

class RunScreenViewController: UIViewController {
    var list = [ProjecyHistory]()

    @IBOutlet weak var catagoryView: UIView!
    @IBOutlet weak var catagoryCell: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        catagoryView.layer.cornerRadius = 15
        catagoryCell.dataSource = self
        catagoryCell.delegate = self
        catagoryCell.separatorStyle = .none
        
        
        list.append(ProjecyHistory(katagoryName: "NSP", projectName: "yeni teiaz", totalTime: 300, startDate: 0, endDate: 0, coloCode: "de", play: false))
        list.append(ProjecyHistory(katagoryName: "NSP", projectName: "new teiaz", totalTime: 200, startDate: 0, endDate: 0, coloCode: "de", play: false))
        list.append(ProjecyHistory(katagoryName: "NSP", projectName: "yox teiaz", totalTime: 500, startDate: 0, endDate: 0, coloCode: "de", play: false))
        list.append(ProjecyHistory(katagoryName: "NSP", projectName: "olan teiaz", totalTime: 300, startDate: 0, endDate: 0, coloCode: "de", play: false))
        list.append(ProjecyHistory(katagoryName: "NSP", projectName: "yeneded teiaz", totalTime: 500, startDate: 0, endDate: 0, coloCode: "de", play: false))
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
        return CGFloat(list[indexPath.row].totalTime!)
    }
 
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
        
    }
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "runCatagoryCell", for: indexPath) as! RunCatagoryTableViewCell
        
        let history = list[indexPath.row]
        //cell.name.text = history.projectName
    
        cell.projectCell.tag = indexPath.section
       // cell.projectName.text = history.projectName
        
        return cell
    }
}

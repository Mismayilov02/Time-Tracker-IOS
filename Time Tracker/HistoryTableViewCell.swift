//
//  HistoryTableViewCell.swift
//  Time Tracker
//
//  Created by mehemmed ismayilov on 11/10/22.
//

import UIKit

class HistoryTableViewCell: UITableViewCell {


   
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var katagoryName: UILabel!
    @IBOutlet weak var projectTableViewCell: UITableView!
    //@IBOutlet weak var historyProgectTableView: UITableView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.cardView.layer.cornerRadius = 10
        projectTableViewCell.delegate = self
        projectTableViewCell.dataSource = self
        projectTableViewCell.isScrollEnabled = false
        //historyProgectTableView.dataSource = Self
            //historyProgectTableView.delegate = self
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
extension HistoryTableViewCell:UITableViewDataSource , UITableViewDelegate{
    
   
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    
        
    }
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "projectCell", for: indexPath) as! ProjectTableViewCell
        
      //  let history = list[indexPath.row]
    
    //    cell.projectTableViewCell.tag = indexPath.section
       // cell.projectName.text = history.projectName
        
        return cell
    }
}

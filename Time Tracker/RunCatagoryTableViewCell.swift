//
//  RunCatagoryTableViewCell.swift
//  Time Tracker
//
//  Created by mehemmed ismayilov on 11/20/22.
//

import UIKit

class RunCatagoryTableViewCell: UITableViewCell {


    
    @IBOutlet weak var baseView: UIView!
  
    @IBOutlet weak var projectCell: UITableView!
    @IBOutlet weak var catagoryColor: UIImageView!
    @IBOutlet weak var catagoryName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        baseView.layer.cornerRadius = 10
        projectCell.delegate = self
        projectCell.dataSource = self
        projectCell.isScrollEnabled = false
        projectCell.separatorStyle = .none
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
extension RunCatagoryTableViewCell:UITableViewDelegate , UITableViewDataSource{
    
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    
        
    }
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "runProjectCell", for: indexPath) as! RunProjectTableViewCell
        
      //  let history = list[indexPath.row]
    
    //    cell.projectTableViewCell.tag = indexPath.section
       // cell.projectName.text = history.projectName
        
        return cell
    }
    
}

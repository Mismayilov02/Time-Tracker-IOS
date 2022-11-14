//
//  ProjectTableViewCell.swift
//  Time Tracker
//
//  Created by mehemmed ismayilov on 11/14/22.
//

import UIKit

class ProjectTableViewCell: UITableViewCell {

    @IBOutlet weak var projectColor: UIImageView!
    @IBOutlet weak var projectTotal: UILabel!
    @IBOutlet weak var projectName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

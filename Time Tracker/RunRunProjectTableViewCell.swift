//
//  RunRunProjectTableViewCell.swift
//  Time Tracker
//
//  Created by mehemmed ismayilov on 11/21/22.
//

import UIKit

class RunRunProjectTableViewCell: UITableViewCell {

    @IBOutlet weak var projectTotal: UILabel!
    @IBOutlet weak var projectName: UILabel!
    @IBOutlet weak var projectColor: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

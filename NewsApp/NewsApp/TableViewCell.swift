//
//  TableViewCell.swift
//  NewsApp
//
//  Created by Furkan on 16.09.2022.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var lblSource: UILabel!
    @IBOutlet weak var lblDesc: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

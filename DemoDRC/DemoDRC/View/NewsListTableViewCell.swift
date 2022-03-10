//
//  NewsListTableViewCell.swift
//  DemoDRC

import UIKit

class NewsListTableViewCell: UITableViewCell {

    @IBOutlet var imvNews: UIImageView!
    @IBOutlet var lblNewsLink: UILabel!
    @IBOutlet var lblPublishTime: UILabel!
    @IBOutlet var lblAuthorName: UILabel!
    @IBOutlet var lblTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

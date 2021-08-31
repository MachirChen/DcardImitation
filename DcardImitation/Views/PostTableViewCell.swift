//
//  PostTableViewCell.swift
//  DcardImitation
//
//  Created by Machir on 2021/8/28.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    @IBOutlet weak var genderImageView: UIImageView!
    @IBOutlet weak var forumNameLabel: UILabel!
    @IBOutlet weak var schoolLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var excerptLabel: UILabel!
    @IBOutlet weak var likeCountLabel: UILabel!
    @IBOutlet weak var commonCountLabel: UILabel!
    @IBOutlet weak var likeCountImage: UIImageView!
    @IBOutlet weak var postImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

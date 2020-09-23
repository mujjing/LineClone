//
//  UserListTableViewCell.swift
//  LineClone
//
//  Created by Jh's Macbook Pro on 2020/09/23.
//  Copyright © 2020 전지훈. All rights reserved.
//

import UIKit
import Nuke

class UserListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var userLbl: UILabel!
    
    var user : User? {
        didSet {
            userLbl.text = user?.username
            if let url = URL(string: user?.profileImageUrl ?? "") {
                Nuke.loadImage(with: url, into: img)
            }
            
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

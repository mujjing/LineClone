//
//  ChatListTableViewCell.swift
//  LineClone
//
//  Created by Jh's Macbook Pro on 2020/09/08.
//  Copyright © 2020 전지훈. All rights reserved.
//

import UIKit

class ChatListTableViewCell: UITableViewCell {

    @IBOutlet weak var chatListImg: UIImageView!
    @IBOutlet weak var chatListMsg: UILabel!
    @IBOutlet weak var chatListName: UILabel!
    @IBOutlet weak var chatListTime: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.chatListImg.layer.cornerRadius = chatListImg.frame.height / 2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

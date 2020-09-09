//
//  ChatRoomTableViewCell.swift
//  LineClone
//
//  Created by Jh's Macbook Pro on 2020/09/10.
//  Copyright © 2020 전지훈. All rights reserved.
//

import UIKit

class ChatRoomTableViewCell: UITableViewCell {

    @IBOutlet weak var roomImg: UIImageView!
    @IBOutlet weak var messageTextView: UITextView!
    @IBOutlet weak var timeLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        backgroundColor = .clear
        roomImg.layer.cornerRadius = roomImg.frame.height / 2
        messageTextView.layer.cornerRadius = 15
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

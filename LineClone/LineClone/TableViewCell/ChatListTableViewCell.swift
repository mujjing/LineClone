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
    
    var user: User? {
        didSet{
            if let user = user{
                chatListName.text = user.username
                //chatListImg.image = user?.profileImageUrl
                chatListTime.text = dataFormatterForDateLabel(date: user.createdAt.dateValue())
                chatListMsg.text = user.email
            }

        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.chatListImg.layer.cornerRadius = chatListImg.frame.height / 2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    private func dataFormatterForDateLabel(date : Date) -> String{
        let formatter = DateFormatter()
        formatter.dateStyle = .full
        formatter.timeStyle = .short
        formatter.locale = Locale(identifier: "ko_KR")
        return formatter.string(from: date)
    }
}

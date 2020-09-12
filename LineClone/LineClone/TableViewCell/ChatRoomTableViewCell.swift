//
//  ChatRoomTableViewCell.swift
//  LineClone
//
//  Created by Jh's Macbook Pro on 2020/09/10.
//  Copyright © 2020 전지훈. All rights reserved.
//

import UIKit

class ChatRoomTableViewCell: UITableViewCell {

    var messageText: String? {
        didSet{
            guard let text = messageText else {return}
            
            let width = estimateFrameForTextView(text: text).width + 20
            messageTextViewWidthConstraint.constant = width
            messageTextView.text = text
        }
    }
    
    @IBOutlet weak var roomImg: UIImageView!
    @IBOutlet weak var messageTextView: UITextView!
    @IBOutlet weak var timeLbl: UILabel!
    @IBOutlet weak var messageTextViewWidthConstraint: NSLayoutConstraint!
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

    private func estimateFrameForTextView(text : String) -> CGRect{
        let size = CGSize(width: 200, height: 1000)
        let opetions = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
        return NSString(string: text).boundingRect(with: size, options: opetions, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14)], context: nil)
    }
}

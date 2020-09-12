//
//  ChatInputAccessoryView.swift
//  LineClone
//
//  Created by Jh's Macbook Pro on 2020/09/12.
//  Copyright © 2020 전지훈. All rights reserved.
//

import UIKit
protocol ChatInputAccessoryViewDelegate: class {
    func tappedSendButton(text: String)
}

class ChatInputAccessoryView: UIView {

    @IBOutlet weak var chatTextView: UITextView!
    @IBOutlet weak var sendBtn: UIButton!
    override init(frame: CGRect) {
        super.init(frame:frame)
        
        nibInit()
        setupViews()
        autoresizingMask = .flexibleHeight
    }
    @IBAction func tappedSendBtn(_ sender: Any) {
        guard let text = chatTextView.text else { return }
        delegate?.tappedSendButton(text: text)
        print("tapped")
    }
    
    weak var delegate: ChatInputAccessoryViewDelegate?
    
    private func setupViews(){
        chatTextView.layer.cornerRadius = 15
        chatTextView.layer.borderColor = UIColor.rgb(red: 230, green: 230, blue: 230).cgColor
        chatTextView.layer.borderWidth = 1
        
        sendBtn.imageView?.contentMode = .scaleAspectFill
        sendBtn.contentHorizontalAlignment = .fill
        sendBtn.contentVerticalAlignment = .fill
        sendBtn.isEnabled = false
        
        chatTextView.text = ""
        chatTextView.delegate = self
    }
    
    func removeText(){
        chatTextView.text = ""
        sendBtn.isEnabled = false
    }
    
    override var intrinsicContentSize: CGSize{
        return .zero
    }
    
    private func nibInit(){
        let nib = UINib(nibName: "ChatInputAccessaryViewCell", bundle: nil)
        guard let view = nib.instantiate(withOwner: self, options: nil).first as? UIView else { return }
        view.frame = self.bounds
        view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        self.addSubview(view)
    }
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }
    
}

extension ChatInputAccessoryView: UITextViewDelegate{
    func textViewDidChange(_ textView: UITextView) {
        if textView.text.isEmpty {
            sendBtn.isEnabled = false
        }else{
            sendBtn.isEnabled = true
        }
    }
}

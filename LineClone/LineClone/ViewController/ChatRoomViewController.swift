//
//  ChatRoomViewController.swift
//  LineClone
//
//  Created by Jh's Macbook Pro on 2020/09/08.
//  Copyright © 2020 전지훈. All rights reserved.
//

import UIKit

class ChatRoomViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.backgroundColor = .green
        tableView.delegate = self
        tableView.dataSource = self
        //tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.register(UINib(nibName: "ChatRoomTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        tableView.backgroundColor = .rgb(red: 118, green: 140, blue: 180)
    }

}

extension ChatRoomViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        tableView.estimatedRowHeight = 20
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        return cell
    }
    
    
}

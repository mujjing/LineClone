//
//  UserListViewController.swift
//  LineClone
//
//  Created by Jh's Macbook Pro on 2020/09/23.
//  Copyright © 2020 전지훈. All rights reserved.
//

import UIKit
import Firebase
import Nuke

class UserListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    private var users = [User]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    private func fetchUserInfoFromFirebase(){
        Firestore.firestore().collection("users").getDocuments { (snapshots, err) in
            if let err = err {
                print("user정보취득에 실패하셨습니다 : \(err)")
                return
            }
            snapshots?.documents.forEach({ (snapshot) in
                let dic = snapshot.data()
                let user = User.init(dic: dic)
                
                self.users.append(user)
                self.tableView.reloadData()
                self.users.forEach { (user) in
                    print("user.username: \(user.username)")
                }
                
                print("data : \(dic)")
            })
        }
    }

}

extension UserListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        return cell
    }
    
    
}

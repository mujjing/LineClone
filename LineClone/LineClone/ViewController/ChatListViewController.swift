//
//  ChatListViewController.swift
//  LineClone
//
//  Created by Jh's Macbook Pro on 2020/09/08.
//  Copyright © 2020 전지훈. All rights reserved.
//

import UIKit
import Firebase

class ChatListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    private var users = [User]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        navigationController?.navigationBar.barTintColor = .rgb(red: 39, green: 49, blue: 69)
        navigationItem.title = "talk"
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor : UIColor.white]
        
        if Auth.auth().currentUser?.uid == nil {
            let sb = UIStoryboard(name: "SignUp", bundle: nil)
            let vc = sb.instantiateViewController(withIdentifier: "SignUpViewController") as! SignUpViewController
            //vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
        }
        
        let rightButton = UIBarButtonItem(title: "새로운채팅", style: .plain, target: self, action: #selector(tappedNavigationRightButton))
        navigationItem.rightBarButtonItem = rightButton
        navigationItem.rightBarButtonItem?.tintColor = .white
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        fetchUserInfoFromFirebase()
    }
    @objc func tappedNavigationRightButton() {
        print("새로운 채팅")
        let sb = UIStoryboard(name: "UserList", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "UserListViewController") as! UserListViewController
        let nav = UINavigationController(rootViewController: vc)
        present(nav, animated: true)
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

extension ChatListViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ChatListTableViewCell
        cell.user = users[indexPath.row]
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        let sb = UIStoryboard.init(name: "ChatRoom", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "ChatRoomViewController") as! ChatRoomViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

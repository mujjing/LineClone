//
//  User.swift
//  LineClone
//
//  Created by Jh's Macbook Pro on 2020/09/17.
//  Copyright © 2020 전지훈. All rights reserved.
//

import Foundation
import Firebase

class User{
    
    let email: String
    let username: String
    let createdAt: Timestamp
    let profileImageUrl : String
    
    init(dic : [String:Any]){
        self.email = dic["email"] as? String ?? ""
        self.username = dic["username"] as? String ?? ""
        self.createdAt = dic["createdAt"] as? Timestamp ?? Timestamp()
        self.profileImageUrl = ["profileImageUrl"] as? String ?? ""
    }
    
}

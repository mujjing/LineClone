//
//  SignUpViewController.swift
//  LineClone
//
//  Created by Jh's Macbook Pro on 2020/09/14.
//  Copyright © 2020 전지훈. All rights reserved.
//

import UIKit
import Firebase
import FirebaseFirestore
import FirebaseAuth

class SignUpViewController: UIViewController {

    @IBOutlet weak var profileImageBtn: UIButton!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var usernameTF: UITextField!
    @IBOutlet weak var registerBtn: UIButton!
    @IBOutlet weak var alreadyHaverAcoountBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        profileImageBtn.layer.cornerRadius = profileImageBtn.frame.height / 2
        profileImageBtn.layer.borderWidth = 1
        profileImageBtn.layer.borderColor = UIColor.rgb(red: 240, green: 240, blue: 240).cgColor
        registerBtn.layer.cornerRadius = 15
        profileImageBtn.addTarget(self, action: #selector(tappedProfileImageButton), for: .touchUpInside)
        emailTF.delegate = self
        passwordTF.delegate = self
        usernameTF.delegate = self
        registerBtn.isEnabled = false
        registerBtn.backgroundColor = .rgb(red: 100, green: 100, blue: 100)
        registerBtn.addTarget(self, action: #selector(tappedRegisterButton), for: .touchUpInside)
    }
    
    @objc func tappedRegisterButton(){
        guard let email = emailTF.text else {return}
        guard let password = passwordTF.text else {return}
        
        Auth.auth().createUser(withEmail: email, password: password) { (response, error) in
            if let error = error{
                print("가입에 실패했습니다 : \(error)")
                return
            }
            print("가입에 성공하였습니다")
            
            //database 저장
            guard let uid = response?.user.uid else{ return }
            guard let username = self.usernameTF.text else { return }
            let docData = [
                "email" : email,
                "username" : username,
                "createdAt" : Timestamp()
            ] as [String : Any]
            Firestore.firestore().collection("users").document(uid).setData(docData){
                (err) in
                
                if let err = err{
                    print("데이터 베이스 저장에 실패 했습니다 : \(err)")
                    return
                }
                
                print("데이터 베이스에 저장했습니다")
                self.dismiss(animated: true, completion: nil)
                
            }
        }
    }

    @objc func tappedProfileImageButton(){
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.allowsEditing = true
        
        self.present(imagePickerController, animated: true)
    }
}

extension SignUpViewController : UITextFieldDelegate{
    func textFieldDidChangeSelection(_ textField: UITextField) {
        let emailIsEmpty = emailTF.text?.isEmpty ?? false
        let passwordIsEmpty = passwordTF.text?.isEmpty ?? false
        let usernameIsEmpty = usernameTF.text?.isEmpty ?? false
        
        if emailIsEmpty || passwordIsEmpty || usernameIsEmpty{
            registerBtn.isEnabled = false
            registerBtn.backgroundColor = .rgb(red: 100, green: 100, blue: 100)
        }else{
            registerBtn.isEnabled = true
            registerBtn.backgroundColor = .rgb(red: 0, green: 165, blue: 0)
        }
    }
}

extension SignUpViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let editImage = info[.editedImage] as? UIImage{
            profileImageBtn.setImage(editImage.withRenderingMode(.alwaysOriginal), for: .normal)
        }else if let originalImage = info[.originalImage] as? UIImage {
            profileImageBtn.setImage(originalImage.withRenderingMode(.alwaysOriginal), for: .normal)
        }
        profileImageBtn.setTitle("", for: .normal)
        profileImageBtn.imageView?.contentMode = .scaleAspectFill
        profileImageBtn.contentHorizontalAlignment = .fill
        profileImageBtn.contentVerticalAlignment = .fill
        profileImageBtn.clipsToBounds = true
        dismiss(animated: true, completion: nil)
    }
}

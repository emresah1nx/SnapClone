//
//  ViewController.swift
//  SnapchatClone
//
//  Created by Emre Şahin on 6.07.2024.
//

import UIKit
import FirebaseCore
import FirebaseAuth
import FirebaseFirestore

class SignInVC: UIViewController {
    
    
    
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var usernameText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }


    @IBAction func signinClicked(_ sender: Any) {
        if passwordText.text != "" && emailText.text != "" {
            
            Auth.auth().signIn(withEmail: emailText.text!, password: passwordText.text!) { (result, error) in
                if error != nil {
                    self.makeAlert(title: "Error", message: error?.localizedDescription ?? "Error")
                } else {
                    self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                }
            }
            
            
        } else {
            self.makeAlert(title: "Error", message: "Username/Email/Password ?")
        }
        
        
    }
    
    
    @IBAction func signupClicked(_ sender: Any) {
        if usernameText.text != "" && passwordText.text != "" && emailText.text != "" {
            
            Auth.auth().createUser(withEmail: emailText.text!, password: passwordText.text!) { (Auth , error) in
                if error != nil {
                    self.makeAlert(title: "Error", message: error?.localizedDescription ?? "Error")
                } else {
                    
                    let fireStore = Firestore.firestore()
                    
                    let userDictionary = ["email" : self.emailText.text!, "username" : self.usernameText.text!] as! [String : Any]
                    
                    fireStore.collection("UserInfo").addDocument(data: userDictionary) { (error) in
                        if error != nil {
                            //
                        }
                    }
                    
                    
                    
                    self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                }
            }
            
        } else {
            self.makeAlert(title: "Error", message: "Username/Email/Password ?")
            
        }
        
    }
    
    func makeAlert(title: String , message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
    
    
    
}


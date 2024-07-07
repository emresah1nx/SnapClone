//
//  SettingsVC.swift
//  SnapchatClone
//
//  Created by Emre Şahin on 7.07.2024.
//

import UIKit
import FirebaseCore
import FirebaseAuth

class SettingsVC: UIViewController {

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    

    
    
    
    @IBAction func LogOutClicked(_ sender: Any) {
        
        do {
            try Auth.auth().signOut()
            self.performSegue(withIdentifier: "toSignInVC", sender: nil)
        } catch {
            
        }
        
        
    }
    
    
    
    
    
    

}

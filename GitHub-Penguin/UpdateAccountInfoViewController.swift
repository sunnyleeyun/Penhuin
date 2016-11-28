//
//  UpdateAccountInfoViewController.swift
//  GitHub-Penguin
//
//  Created by M.A.D. Crew on 13/11/2016.
//  Copyright © 2016 M.A.D. Crew. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth

class UpdateAccountInfoViewController: UIViewController {

    var uid = ""
    
    
    @IBOutlet weak var Name_TextField: UITextField!
    
    
    @IBOutlet weak var Gender_TextField: UITextField!
    
    
    @IBOutlet weak var PhoneNumber_TextField: UITextField!
    
    
    @IBOutlet weak var Email_TextField: UITextField!
    
    
    @IBAction func Confirm_Button_Tapped(_ sender: UIButton) {
        
        
        
    }
    
    func loadTheme() {
        
        if Manager.currentThemeNumber == 0 {
            
            self.view.backgroundColor = UIColor.init(red: 170.0/255.0, green: 226.0/255.0, blue: 252.0/255.0, alpha: 1.0)
            
            
            
            
        } else if Manager.currentThemeNumber == 1 {
            
            
            self.view.backgroundColor = UIColor.init(red: 238.0/255.0, green: 189.0/255.0, blue: 217.0/255.0, alpha: 1.0)
            
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //拿 UID
        if let user = FIRAuth.auth()?.currentUser {
            
            uid = user.uid  // The user's ID, unique to the Firebase project.
            // Do NOT use this value to authenticate with
            // your backend server, if you have one. Use
            // getTokenWithCompletion:completion: instead.
        } else {
            // No user is signed in.
        }
        
        FIRDatabase.database().reference(withPath: "ID/\(self.uid)/Profile/Real-Name").observe(.value, with: { (snapshot) in
            if let secureRealName = (snapshot.value){
                self.Name_TextField.text = secureRealName as? String
            }
        })
        
        FIRDatabase.database().reference(withPath: "ID/\(self.uid)/Profile/Gender").observe(.value, with: { (snapshot) in
            if let secureGender = (snapshot.value){
                self.Gender_TextField.text = secureGender as? String
            }
        })
        
        FIRDatabase.database().reference(withPath: "ID/\(self.uid)/Profile/Phone").observe(.value, with: { (snapshot) in
            if let securePhone = (snapshot.value){
                self.PhoneNumber_TextField.text = securePhone as? String
            }
        })
        
        FIRDatabase.database().reference(withPath: "ID/\(self.uid)/Profile/Email").observe(.value, with: { (snapshot) in
            if let secureEmail = (snapshot.value){
                self.Email_TextField.text = secureEmail as? String
            }
        })
        
        

        
        
        loadTheme()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

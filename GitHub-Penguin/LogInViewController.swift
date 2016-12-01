//
//  LogInViewController.swift
//  GitHub-Penguin
//
//  Created by M.A.D. Crew on 13/11/2016.
//  Copyright © 2016 M.A.D. Crew. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class LogInViewController: UIViewController {

    @IBOutlet weak var Change_Theme_Switch: UISwitch!
    
    @IBAction func Change_Theme_Switch_Tapped(_ sender: UISwitch) {
      
        
        if Change_Theme_Switch.isOn == true {
            
            Manager.currentThemeNumber = 0
            
            self.view.backgroundColor = UIColor.init(red: 170.0/255.0, green: 226.0/255.0, blue: 252.0/255.0, alpha: 1.0)
            Account_Icon.image = UIImage(named: "cloud-White")
            Password_Icon.image = UIImage(named:"cloud-White")
            LogIn_Icon.imageView?.image = UIImage(named:"cloud-White")
            SignUp_Icon.imageView?.image = UIImage(named:"cloud-White")
            Logo_Red.isHidden = true
            Logo.isHidden = false
            Logo2.isHidden = false
            Logo_Text.isHidden = false
            
            
            
        } else {
            
            Manager.currentThemeNumber = 1
            
            self.view.backgroundColor = UIColor.init(red: 238.0/255.0, green: 189.0/255.0, blue: 217.0/255.0, alpha: 1.0)
            Account_Icon.image = UIImage(named: "flower")
            Password_Icon.image = UIImage(named:"flower")
            LogIn_Icon.imageView?.image = UIImage(named:"flower")
            SignUp_Icon.imageView?.image = UIImage(named:"flower")
            Logo_Red.isHidden = false
            Logo.isHidden = true
            Logo2.isHidden = true
            Logo_Text.isHidden = true
            
            
        }
        
        
    }
    
    var uid = ""
    
    @IBOutlet weak var Account_Icon: UIImageView!
    
    @IBOutlet weak var Password_Icon: UIImageView!
    
    @IBOutlet weak var LogIn_Icon: UIButton!
    
    @IBOutlet weak var SignUp_Icon: UIButton!
    
    @IBOutlet weak var Logo_Red: UIImageView!
    
    @IBOutlet weak var Logo: UIImageView!
    
    @IBOutlet weak var Logo2: UIImageView!
    
    @IBOutlet weak var Logo_Text: UILabel!
    
    @IBOutlet weak var Account_TextField: UITextField!
    
    @IBOutlet weak var Password_TextField: UITextField!
    
    @IBAction func SignIn_Button_Tapped(_ sender: UIButton) {
        
        // 檢查 帳號跟密碼欄，是否確實有填寫 (ps 帳號欄，目前是用email代替
        if self.Account_TextField.text == "" || self.Password_TextField.text == ""{
            let alertController = UIAlertController(title:"Oops!", message: "Please enter Account & password", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title:"OK!", style: .cancel, handler:nil)
            alertController.addAction(defaultAction)
            
            self.present(alertController, animated:true,completion:nil)
            
        }else{
            FIRAuth.auth()?.signIn(withEmail: self.Account_TextField.text!, password: self.Password_TextField.text!, completion:{(user,error) in
                
                if error == nil{
                    
                    //拿 UID
                    self.uid = ""
                    if let user = FIRAuth.auth()?.currentUser {
                        
                        self.uid = user.uid  // The user's ID, unique to the Firebase project.
                        // Do NOT use this value to authenticate with
                        // your backend server, if you have one. Use
                        // getTokenWithCompletion:completion: instead.
                        
                        /////////////////
                        
                        var reff = FIRDatabase.database().reference(withPath: "Online-Status/\(self.uid)")
                        reff.setValue("ON")
                        
                        //放到Manager裡面儲存
                        Manager.uidtext = self.uid

                        
                    } else {
                        // No user is signed in.
                    }
                    
                    
                    
                    var ref = FIRDatabase.database().reference(withPath: "ID/\(self.uid)/Profile/Safety-Check")
                    ref.setValue("ON")
                    
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let nextVC = storyboard.instantiateViewController(withIdentifier: "UITabControllerID")as! UITabBarController
                    self.present(nextVC,animated:true,completion:nil)
                    
                    print("========================Successful already have a account in Firebase!!")
                    
                    
                    
                    
                    
                }else{
                    let alertController = UIAlertController(title:"Oops!", message: error?.localizedDescription, preferredStyle: .alert)
                    let defaultAction = UIAlertAction(title:"OK!", style: .cancel, handler:nil)
                    alertController.addAction(defaultAction)
                    
                    self.present(alertController, animated:true,completion:nil)
                }
            })
        }
        

    }
    
    
    
    @IBAction func SignUp_Button_Tapped(_ sender: UIButton) {
        // 檢查 帳號跟密碼欄，是否確實有填寫
        if self.Account_TextField.text == "" || self.Password_TextField.text == ""{
            let alertController = UIAlertController(title:"Oops!", message: "Please enter Account & password", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title:"OK!", style: .cancel, handler:nil)
            alertController.addAction(defaultAction)
            
            self.present(alertController, animated:true,completion:nil)
        }else{
            
            // 在Firebase的Auth中，新增使用戶
            FIRAuth.auth()?.createUser(withEmail: self.Account_TextField.text!, password: self.Password_TextField.text!, completion: {(user,error) in
                
                if error == nil{
                    
                    
                    //拿 UID
                    self.uid = ""
                    if let user = FIRAuth.auth()?.currentUser {
                        
                        self.uid = user.uid  // The user's ID, unique to the Firebase project.
                        // Do NOT use this value to authenticate with
                        // your backend server, if you have one. Use
                        // getTokenWithCompletion:completion: instead.
                        
                        var ref = FIRDatabase.database().reference(withPath: "Online-Status/\(self.uid)")
                        ref.setValue("ON")
                        
                    } else {
                        // No user is signed in.
                    }
                    
                    
                    
                    var ref = FIRDatabase.database().reference(withPath: "ID/\(self.uid)/Profile/Safety-Check")
                    ref.setValue("ON")
                                        
                    //跳到註冊頁
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let nextVC = storyboard.instantiateViewController(withIdentifier: "SignUpViewControllerID")as! SignUpViewController
                    self.present(nextVC,animated:true,completion:nil)
                    
                    
                }else{
                    let alertController = UIAlertController(title:"Oops!", message: error?.localizedDescription, preferredStyle: .alert)
                    let defaultAction = UIAlertAction(title:"OK!", style: .cancel, handler:nil)
                    alertController.addAction(defaultAction)
                    
                    self.present(alertController, animated:true,completion:nil)
                }
            })
        }

        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadTheme()
        
        Logo_Red.isHidden = true

        // 使用者登出
        try!FIRAuth.auth()?.signOut()
        
        //讓目前使用者的帳號顯現
        if let user = FIRAuth.auth()?.currentUser{
            self.Account_TextField.text = user.email
        }else{
            self.Account_TextField.text = ""
        }
        
        
        self.hideKeyboardWhenTappedAround()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func loadTheme() {
        
        if  Manager.currentThemeNumber == 0 {
            
            
            Change_Theme_Switch.isOn = true
            
            self.view.backgroundColor = UIColor.init(red: 170.0/255.0, green: 226.0/255.0, blue: 252.0/255.0, alpha: 1.0)
            Account_Icon.image = UIImage(named: "cloud-White")
            Password_Icon.image = UIImage(named:"cloud-White")
            LogIn_Icon.imageView?.image = UIImage(named:"cloud-White")
            SignUp_Icon.imageView?.image = UIImage(named:"cloud-White")
            Logo_Red.isHidden = true
            Logo.isHidden = false
            Logo2.isHidden = false
            Logo_Text.isHidden = false
            
           
            
        } else if   Manager.currentThemeNumber == 1{
            
            Change_Theme_Switch.isOn = false
            
            self.view.backgroundColor = UIColor.init(red: 238.0/255.0, green: 189.0/255.0, blue: 217.0/255.0, alpha: 1.0)
            Account_Icon.image = UIImage(named: "flower")
            Password_Icon.image = UIImage(named:"flower")
            LogIn_Icon.imageView?.image = UIImage(named:"flower")
            SignUp_Icon.imageView?.image = UIImage(named:"flower")
            Logo_Red.isHidden = false
            Logo.isHidden = true
            Logo2.isHidden = true
            Logo_Text.isHidden = true
            
        }
        
        
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

// Function to hide keyboard when touching anywhere else
extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
}

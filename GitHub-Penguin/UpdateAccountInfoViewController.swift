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
    var ref: FIRDatabaseReference!
    var confirmMessage = ""

    var phoneNumber = ""
    var uidToDisplay = ""
    
    
    @IBOutlet weak var Name_TextField: UITextField!
    
    
    @IBOutlet weak var Gender_TextField: UITextField!
    
    
    @IBOutlet weak var PhoneNumber_TextField: UITextField!
    
    
    @IBOutlet weak var Email_TextField: UITextField!
    
    
    @IBAction func Confirm_Button_Tapped(_ sender: UIButton) {
        
        if Name_TextField.text == "" || Gender_TextField.text == "" || PhoneNumber_TextField.text == "" || Email_TextField.text == ""{
            //####提醒尚未完成之項目
            
            
            
            //Create Alert Controller
            let alert = UIAlertController(title: "還有項目沒有填完唷！", message: "填寫完整資料，讓大家更容易認識你。", preferredStyle: UIAlertControllerStyle.alert)
            
            //Create confirm Action
            let confirm = UIAlertAction(title: "繼續填寫註冊資料", style: UIAlertActionStyle.default) { (action: UIAlertAction) -> Void in
                
            }
            
            alert.addAction(confirm)
            
            
            
            
            
            //Present Alert Controller
            self.present(alert, animated: true, completion: nil)
            
        }else{
            
            //拿 UID
            self.uid = ""
            if let user = FIRAuth.auth()?.currentUser {
                
                self.uid = user.uid  // The user's ID, unique to the Firebase project.
                // Do NOT use this value to authenticate with
                // your backend server, if you have one. Use
                // getTokenWithCompletion:completion: instead.
                
                /////////////////
                
                
                
            } else {
                // No user is signed in.
            }
            
            
            
            //Name setvalue
            self.ref = FIRDatabase.database().reference(withPath: "ID/\(self.uid)/Profile/Real-Name")
            self.ref.setValue(Name_TextField.text!)
            
            //Gender setvalue
            self.ref = FIRDatabase.database().reference(withPath: "ID/\(self.uid)/Profile/Gender")
            self.ref.setValue(Gender_TextField.text!)
            
            //Phone setvalue
            self.ref = FIRDatabase.database().reference(withPath: "ID/\(self.uid)/Profile/Phone-Number")
            self.ref.setValue(PhoneNumber_TextField.text!)
            
            //Email setvalue
            self.ref = FIRDatabase.database().reference(withPath: "ID/\(self.uid)/Profile/Email")
            self.ref.setValue(Email_TextField.text!)
            
            //Extra setvalue for Phone
            self.ref = FIRDatabase.database().reference(withPath: "PhoneNumber").child(PhoneNumber_TextField.text!)
            self.ref.setValue(self.uid)
            
            //Iterate through every user's chatlist in database
            FIRDatabase.database().reference().child("ID/\(self.uid)/Profile/ChatList").observe(.value, with: { (snapshot) in
                
                if let snapshots = snapshot.children.allObjects as? [FIRDataSnapshot]{
                    
                    for child in snapshots{
                        
                        //好友uid
                        self.phoneNumber = child.key
                        print("ChatListAccount is \(self.phoneNumber)")
                        
                        //好友messengerAutoID
                        self.uidToDisplay = child.value as! String
                        print("messengerAutoID is \(self.uidToDisplay)")
                    }
                }
            })
            
            showConfirmationPage()
            
        }
    }
    
    func showConfirmationPage(){
        
        confirmMessage = "\n我的名字：" + Name_TextField.text! + "\n我的性別："  + Gender_TextField.text! + "\n我的手機：" + PhoneNumber_TextField.text! + "\n我的Email：" + Email_TextField.text!
        
        
        //Create Alert Controller
        let alert = UIAlertController(title: "註冊資料確認", message: confirmMessage, preferredStyle: UIAlertControllerStyle.alert)
        
        //Create confirm Action
        let confirm = UIAlertAction(title: "確定", style: UIAlertActionStyle.default) { (action: UIAlertAction) -> Void in
            
            //Open LogInViewController
            let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LogInViewControllerID") as! LogInViewController
            self.addChildViewController(popOverVC)
            popOverVC.view.frame = self.view.frame
            self.view.addSubview(popOverVC.view)
            popOverVC.didMove(toParentViewController: self)
            
            
        }
        
        alert.addAction(confirm)
        
        
        
        
        
        
        //Create Cancel Action
        let cancel = UIAlertAction(title: "取消", style: UIAlertActionStyle.cancel) { (action: UIAlertAction) -> Void in self.confirmMessage = ""
        }
        
        alert.addAction(cancel)
        
        
        
        
        //Present Alert Controller
        self.present(alert, animated: true, completion: nil)
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.uid = Manager.uidtext
        
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
        
        FIRDatabase.database().reference(withPath: "ID/\(self.uid)/Profile/Phone-Number").observe(.value, with: { (snapshot) in
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
    
    func loadTheme() {
        
        if Manager.currentThemeNumber == 0 {
            
            self.view.backgroundColor = UIColor.init(red: 170.0/255.0, green: 226.0/255.0, blue: 252.0/255.0, alpha: 1.0)
            
            
            
            
        } else if Manager.currentThemeNumber == 1 {
            
            
            self.view.backgroundColor = UIColor.init(red: 238.0/255.0, green: 189.0/255.0, blue: 217.0/255.0, alpha: 1.0)
            
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

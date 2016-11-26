//
//  SignUpViewController.swift
//  GitHub-Penguin
//
//  Created by M.A.D. Crew on 13/11/2016.
//  Copyright © 2016 M.A.D. Crew. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class SignUpViewController: UIViewController {

    var ref: FIRDatabaseReference!
    
    var SignUpCompletionProgressView_Count = 0.0
    var uid = ""
    
    
    @IBOutlet weak var Name_TextField: UITextField!
    
    @IBOutlet weak var Gender_TextField: UITextField!
    
    @IBOutlet weak var PhoneNumber_TextField: UITextField!
    
    @IBOutlet weak var Email_TextField: UITextField!
    
    @IBOutlet weak var Logo: UIImageView!
    
    @IBOutlet weak var Take_Picture_Button_Tapped: UIButton!
    
    

    
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
            
            //Setvalue to Firebase
            
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
            

            
        }
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        loadTheme()
        
        //Just to make sure confirmation page doesn't load before the app is done importing data from Firebase
        //拿 UID
        if let user = FIRAuth.auth()?.currentUser {
            
            uid = user.uid  // The user's ID, unique to the Firebase project.
            // Do NOT use this value to authenticate with
            // your backend server, if you have one. Use
            // getTokenWithCompletion:completion: instead.
            print("uid is \(uid)")
        } else {
            // No user is signed in.
        }
        
        
        
        self.ref = FIRDatabase.database().reference(withPath: "ID/\(uid)/Profile/Safety-Check")
        self.ref.setValue("ON")

        
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func loadTheme() {
    
        if Manager.currentThemeNumber == 0 {
            
            self.view.backgroundColor = UIColor.init(red: 170.0/255.0, green: 226.0/255.0, blue: 252.0/255.0, alpha: 1.0)
            
            
            Logo.image = UIImage(named: "angel-1")
            
            /////////set size

            
            
            
        } else if Manager.currentThemeNumber == 1 {
            
            
            self.view.backgroundColor = UIColor.init(red: 238.0/255.0, green: 189.0/255.0, blue: 217.0/255.0, alpha: 1.0)
            
            Logo.image = UIImage(named: "flower")
            
            
            //////Set image size
            /*
            let screenSize: CGRect = UIScreen.main.bounds
            Logo.frame = CGRectMake(0,0, screenSize.height * 0.2, 50)
            
*/
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

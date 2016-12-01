//
//  SetParentsViewController.swift
//  GitHub-Penguin
//
//  Created by M.A.D. Crew on 13/11/2016.
//  Copyright © 2016 M.A.D. Crew. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth

class SetParentsViewController: UIViewController, UITextFieldDelegate {
    
    var uid = ""
    var ref: FIRDatabaseReference!
    var myPhoneNumber = ""
    
    @IBOutlet weak var Parent_1_Name_Label: UILabel!
    @IBOutlet weak var Parent_1_Name: UILabel!
    @IBOutlet weak var Parent_1_Confirm_Button: UIButton!
    @IBOutlet weak var Parent_1_Account_TextField: UITextField!
    
    
    @IBOutlet weak var Parent_2_Name_Label: UILabel!
    @IBOutlet weak var Parent_2_Name: UILabel!
    @IBOutlet weak var Parent_2_Confirm_Button: UIButton!
    @IBOutlet weak var Parent_2_Account_TextField: UITextField!
    

    @IBOutlet weak var Parent_3_Name_Label: UILabel!
    @IBOutlet weak var Parent_3_Name: UILabel!
    @IBOutlet weak var Parent_3_Confirm_Button: UIButton!
    @IBOutlet weak var Parent_3_Account_TextField: UITextField!
    
    
    var phoneNumber = ""
    var uidToDisplay = ""
    
    @IBAction func Confirm_Button_Tapped(_ sender: UIButton) {
        //Iterate through every user's chatlist in database
        FIRDatabase.database().reference().child("PhoneNumber").observe(.value, with: { (snapshot) in
                
            if let snapshots = snapshot.children.allObjects as? [FIRDataSnapshot]{
                    
                for child in snapshots{
                        
                    //phoneNumber
                    self.phoneNumber = child.key
                    print("phoneNumber is \(self.phoneNumber)")
                        
                    //uidToDisplay
                    self.uidToDisplay = child.value as! String
                    print("uidToDisplay is \(self.uidToDisplay)")
                    
                    
                    
                    
                    
        //////////////////      Parent_1_Account_TextField      //////////////////
                    if self.Parent_1_Account_TextField.text == child.key && self.Parent_1_Account_TextField.text != self.myPhoneNumber{
                        print("phoneNumber1 is \(self.Parent_1_Account_TextField.text!)")
                        
                        
                        //Set Name on viewController
                         FIRDatabase.database().reference().child("ID/\(self.uidToDisplay)/Profile/Real-Name").observe(.value, with: { (snapshot) in
                            if let uidToDisplay_RealName = snapshot.value as? String{
                                self.Parent_1_Name.text = uidToDisplay_RealName
                                
                                self.Parent_1_Name_Label.isHidden = false
                                self.Parent_1_Name.isHidden = false
                                self.Parent_1_Confirm_Button.isHidden = false

                                
                                //set value on firebase
                                self.ref = FIRDatabase.database().reference(withPath: "ID/\(self.uid)/Profile/SetParent/1")
                                self.ref.setValue(self.uidToDisplay)

                            }
                         })
                        
                        
                        
                        //跟自己的電話一樣，跳出警示
                    } else if self.Parent_1_Account_TextField.text == self.myPhoneNumber{
                        
                        //Create Alert Controller
                        let alert = UIAlertController(title: "不能輸入自己的電話喔！", message: "請填寫別人的電話號碼，讓親朋好友保護你的安危。", preferredStyle: UIAlertControllerStyle.alert)
                        
                        //Create confirm Action
                        let confirm = UIAlertAction(title: "確定", style: UIAlertActionStyle.default) { (action: UIAlertAction) -> Void in
                            
                        }
                        
                        alert.addAction(confirm)
                        
                        //Present Alert Controller
                        self.present(alert, animated: true, completion: nil)
                        
                        
                        
                        
                        //沒有輸入東西，remove value
                    } else if self.Parent_1_Account_TextField.text == ""{
                        FIRDatabase.database().reference(withPath: "ID/\(self.uid)/Profile/SetParent/1").removeValue()
                    }
                    
                    
                    
                    
        //////////////////      Parent_2_Account_TextField      //////////////////
                    if self.Parent_2_Account_TextField.text == child.key && self.Parent_2_Account_TextField.text != self.myPhoneNumber{
                        print("phoneNumber2 is \(self.Parent_2_Account_TextField.text!)")
                        
                        
                        //Set Name on viewController
                        FIRDatabase.database().reference().child("ID/\(self.uidToDisplay)/Profile/Real-Name").observe(.value, with: { (snapshot) in
                            if let uidToDisplay_RealName = snapshot.value as? String{
                                self.Parent_2_Name.text = uidToDisplay_RealName
                                
                                self.Parent_2_Name_Label.isHidden = false
                                self.Parent_2_Name.isHidden = false
                                self.Parent_2_Confirm_Button.isHidden = false

                                
                                //set value on firebase
                                self.ref = FIRDatabase.database().reference(withPath: "ID/\(self.uid)/Profile/SetParent/2")
                                self.ref.setValue(self.uidToDisplay)
                                
                            }
                        })
                        
                        
                        //跟自己的電話一樣，跳出警示
                    } else if self.Parent_2_Account_TextField.text == self.myPhoneNumber{
                        
                        //Create Alert Controller
                        let alert = UIAlertController(title: "不能輸入自己的電話喔！", message: "請填寫別人的電話號碼，讓親朋好友保護你的安危。", preferredStyle: UIAlertControllerStyle.alert)
                        
                        //Create confirm Action
                        let confirm = UIAlertAction(title: "確定", style: UIAlertActionStyle.default) { (action: UIAlertAction) -> Void in
                            
                        }
                        
                        alert.addAction(confirm)
                        
                        
                        //Present Alert Controller
                        self.present(alert, animated: true, completion: nil)
                   
                    
                        
                        //沒有輸入東西，remove value
                    }else if self.Parent_2_Account_TextField.text == ""{
                        FIRDatabase.database().reference(withPath: "ID/\(self.uid)/Profile/SetParent/2").removeValue()
                    }

                    
                    
                    
                    
        //////////////////      Parent_3_Account_TextField      //////////////////
                    if self.Parent_3_Account_TextField.text == child.key && self.Parent_3_Account_TextField.text != self.myPhoneNumber{
                        print("phoneNumber3 is \(self.Parent_3_Account_TextField.text!)")
                        
                        
                        //Set Name on viewController
                        FIRDatabase.database().reference().child("ID/\(self.uidToDisplay)/Profile/Real-Name").observe(.value, with: { (snapshot) in
                            if let uidToDisplay_RealName = snapshot.value as? String{
                                self.Parent_3_Name.text = uidToDisplay_RealName
                                
                                self.Parent_3_Name_Label.isHidden = false
                                self.Parent_3_Name.isHidden = false
                                self.Parent_3_Confirm_Button.isHidden = false

                                
                                //set value on firebase
                                self.ref = FIRDatabase.database().reference(withPath: "ID/\(self.uid)/Profile/SetParent/3")
                                self.ref.setValue(self.uidToDisplay)
                                
                            }
                        })
                        
                        
                        //跟自己的電話一樣，跳出警示
                    }else if self.Parent_3_Account_TextField.text == self.myPhoneNumber{
                        
                        //Create Alert Controller
                        let alert = UIAlertController(title: "不能輸入自己的電話喔！", message: "請填寫別人的電話號碼，讓親朋好友保護你的安危。", preferredStyle: UIAlertControllerStyle.alert)
                        
                        //Create confirm Action
                        let confirm = UIAlertAction(title: "確定", style: UIAlertActionStyle.default) { (action: UIAlertAction) -> Void in
                            
                        }
                        
                        alert.addAction(confirm)
                        
                        
                        //Present Alert Controller
                        self.present(alert, animated: true, completion: nil)
                    
                    
                        
                        
                        //沒有輸入東西，remove value
                    }else if self.Parent_3_Account_TextField.text == ""{
                        FIRDatabase.database().reference(withPath: "ID/\(self.uid)/Profile/SetParent/3").removeValue()
                    }

                    
                    
                    
                    }
                }
            })
        
        
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.uid = Manager.uidtext

       //Retrieve myPhoneNumber from firebase
        FIRDatabase.database().reference().child("ID/\(self.uid)/Profile/Phone-Number").observe(.value, with: { snap in (self.myPhoneNumber = (snap.value as? String)!)
        })
        
        
        
        // Retrive the data from firebase for 1st
        FIRDatabase.database().reference(withPath: "ID/\(self.uid)/Profile/SetParent/1").observe(.value, with: { (snapshot) in
            if let secureUid1 = (snapshot.value){
                
                self.Parent_1_Name_Label.isHidden = false
                self.Parent_1_Name.isHidden = false
                self.Parent_1_Confirm_Button.isHidden = false
                
                print("secureuid1 is \(secureUid1)")
                //Phone number 1
                FIRDatabase.database().reference(withPath: "ID/\(secureUid1)/Profile/Phone-Number").observe(.value, with: { (snapshot) in
                    
                    if let securePhoneNumber1 = (snapshot.value){
                        print("securePhoneNumber1 is \(securePhoneNumber1)")
                        self.Parent_1_Account_TextField.text = securePhoneNumber1 as? String
                    }
                })
                
                //Name 1
                FIRDatabase.database().reference(withPath: "ID/\(secureUid1)/Profile/Real-Name").observe(.value, with: { (snapshot) in
                    
                    if let secureName1 = (snapshot.value){
                        self.Parent_1_Name.text = secureName1 as? String
                    }
                })
                
            }
        })
        
        
        
        // Retrive the data from firebase for 2nd
        FIRDatabase.database().reference(withPath: "ID/\(self.uid)/Profile/SetParent/2").observe(.value, with: { (snapshot) in
            if let secureUid2 = (snapshot.value){
                
                self.Parent_2_Name_Label.isHidden = false
                self.Parent_2_Name.isHidden = false
                self.Parent_2_Confirm_Button.isHidden = false

                
                //Phone number 2
                FIRDatabase.database().reference(withPath: "ID/\(secureUid2)/Profile/Phone-Number").observe(.value, with: { (snapshot) in
                    
                    if let securePhoneNumber2 = (snapshot.value){
                        self.Parent_2_Account_TextField.text = securePhoneNumber2 as? String
                    }
                })
                
                //Name 2
                FIRDatabase.database().reference(withPath: "ID/\(secureUid2)/Profile/Real-Name").observe(.value, with: { (snapshot) in
                    
                    if let secureName2 = (snapshot.value){
                        self.Parent_2_Name.text = secureName2 as? String
                    }
                })
            }
        })
        
        
        
        // Retrive the data from firebase for 3rd
        FIRDatabase.database().reference(withPath: "ID/\(self.uid)/Profile/SetParent/3").observe(.value, with: { (snapshot) in
            if let secureUid3 = (snapshot.value){
                
                self.Parent_3_Name_Label.isHidden = false
                self.Parent_3_Name.isHidden = false
                self.Parent_3_Confirm_Button.isHidden = false

                
                //Phone number 3
                FIRDatabase.database().reference(withPath: "ID/\(secureUid3)/Profile/Phone-Number").observe(.value, with: { (snapshot) in
                    
                    if let securePhoneNumber3 = (snapshot.value){
                        self.Parent_3_Account_TextField.text = securePhoneNumber3 as? String
                    }
                })
                
                //Name 3
                FIRDatabase.database().reference(withPath: "ID/\(secureUid3)/Profile/Real-Name").observe(.value, with: { (snapshot) in
                    
                    if let secureName3 = (snapshot.value){
                        self.Parent_3_Name.text = secureName3 as? String
                    }
                })
            }
        })
        
        
        /*
        if Parent_1_Account_TextField.text == ""{
            Parent_1_Name_Label.isHidden = true
            Parent_1_Name.isHidden = true
        }
        */
        
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

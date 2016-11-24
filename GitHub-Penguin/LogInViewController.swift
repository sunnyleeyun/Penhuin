//
//  LogInViewController.swift
//  GitHub-Penguin
//
//  Created by M.A.D. Crew on 13/11/2016.
//  Copyright © 2016 M.A.D. Crew. All rights reserved.
//

import UIKit

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
        
    }
    
    
    
    @IBAction func SignUp_Button_Tapped(_ sender: UIButton) {
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Logo_Red.isHidden = true
        
        loadTheme()
        
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

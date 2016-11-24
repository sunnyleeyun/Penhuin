//
//  SignUpViewController.swift
//  GitHub-Penguin
//
//  Created by M.A.D. Crew on 13/11/2016.
//  Copyright © 2016 M.A.D. Crew. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    
    @IBOutlet weak var Name_TextField: UITextField!
    
    
    @IBOutlet weak var Gender_TextField: UITextField!
    
    @IBOutlet weak var PhoneNumber_TextField: UITextField!
    
    @IBOutlet weak var Email_TextField: UITextField!
    
    @IBOutlet weak var Logo: UIImageView!
    
    @IBOutlet weak var Take_Picture_Button_Tapped: UIButton!
    
    @IBAction func Confirm_Button_Tapped(_ sender: UIButton) {
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
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

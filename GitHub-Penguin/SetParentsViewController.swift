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

class SetParentsViewController: UIViewController {
    
    
    //@IBOutlet weak var Parent_1_Name_TextField: UITextField!
    
    @IBOutlet weak var Parent_1_Account_TextField: UITextField!
    
    
    //@IBOutlet weak var Parent_2_Name_TextField: UITextField!
    
    @IBOutlet weak var Parent_2_Account_TextField: UITextField!
    
    
    //@IBOutlet weak var Parent_3_Name_TextField: UITextField!
    
    @IBOutlet weak var Parent_3_Account_TextField: UITextField!
    
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

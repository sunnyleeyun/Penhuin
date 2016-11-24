//
//  SecondViewController.swift
//  GitHub-Penguin
//
//  Created by M.A.D. Crew on 13/11/2016.
//  Copyright © 2016 M.A.D. Crew. All rights reserved.
//

import UIKit

class TrackTheirLocationsViewController: UIViewController {

    
    @IBAction func Center_Map_Button_Tapped(_ sender: UIButton) {
        
        
        
    }
    
    
    @IBOutlet weak var Picture_of_Tracked_Person: UIImageView!
    
    @IBOutlet weak var Name_of_Tracked_Person: UILabel!
    
    @IBOutlet weak var Profile_Background_View: UIView!
    
    func loadTheme() {
        
        if Manager.currentThemeNumber == 0 {
            
            self.view.backgroundColor = UIColor.init(red: 170.0/255.0, green: 226.0/255.0, blue: 252.0/255.0, alpha: 1.0)
            
            self.Profile_Background_View.backgroundColor = UIColor.init(red: 170.0/255.0, green: 226.0/255.0, blue: 252.0/255.0, alpha: 1.0)
            
            
            
            
            
        } else if Manager.currentThemeNumber == 1 {
            
            
            self.view.backgroundColor = UIColor.init(red: 238.0/255.0, green: 189.0/255.0, blue: 217.0/255.0, alpha: 1.0)
            
            self.Profile_Background_View.backgroundColor = UIColor.init(red: 238.0/255.0, green: 189.0/255.0, blue: 217.0/255.0, alpha: 1.0)
        
            
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadTheme()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


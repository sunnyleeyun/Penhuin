//
//  SecondViewController.swift
//  GitHub-Penguin
//
//  Created by M.A.D. Crew on 13/11/2016.
//  Copyright © 2016 M.A.D. Crew. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit
import Foundation
import Firebase
import FirebaseDatabase
import FirebaseAuth

class TrackTheirLocationsViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var track_theirLocation_Map: MKMapView!
    var locationManager: CLLocationManager!
    
    var uid = ""
    var ref: FIRDatabaseReference!
    
    var numberCounter = 0
    var mapShouldBeCentered = false
    var spanCount = 0 //To initially set the zoom level when map is first loaded
    
    var myCurrentLatitude = CLLocationDegrees()
    var myCurrentLongitude = CLLocationDegrees()

    
    @IBOutlet weak var Center_Map_Button: UIButton!
    @IBAction func Center_Map_Button_Tapped(_ sender: UIButton) {
        
        numberCounter = numberCounter + 1
        
        if numberCounter % 2 == 0 {
            
            if numberCounter > 999 {
                
                numberCounter = 2
                
            }
            
            mapShouldBeCentered = false
            
            Center_Map_Button.setImage(UIImage(named: "My_Location_OFF"), for: .normal)
            
            
        } else if numberCounter % 2 == 1 {
            
            if numberCounter > 999 {
                
                numberCounter = 1
                
            }
            
            mapShouldBeCentered = true
            
            Center_Map_Button.setImage(UIImage(named: "My_Location_ON"), for: .normal)
            
        }

        
    }
    
    
    @IBOutlet weak var Picture_of_Tracked_Person: UIImageView!
    
    @IBOutlet weak var Name_of_Tracked_Person: UILabel!
    
    @IBOutlet weak var Profile_Background_View: UIView!
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadTheme()
        
        //Hide the "Profile" (at the button of the view)
        Profile_Background_View.isHidden = true
        
        //拿 UID
        if let user = FIRAuth.auth()?.currentUser {
            
            let uid = user.uid  // The user's ID, unique to the Firebase project.
            // Do NOT use this value to authenticate with
            // your backend server, if you have one. Use
            // getTokenWithCompletion:completion: instead.
        } else {
            // No user is signed in.
        }
        
        
        
        ////////////////////   MAP   ////////////////////////
        
        //產生CLLocationManager，並要求授權
        locationManager = CLLocationManager()
        locationManager.requestAlwaysAuthorization()
        
        //設定準確度
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        //設定活動模式
        locationManager.activityType = .fitness
        //設定delegate
        locationManager.delegate = self
        //開始更新位置資訊
        locationManager.startUpdatingLocation()

        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]){
        
        

        //Getting the most recent location (from the end of the array)
        let lastLocation: CLLocation = locations[locations.count - 1]
        
        myCurrentLongitude = lastLocation.coordinate.longitude
        myCurrentLatitude = lastLocation.coordinate.latitude
        
        keepUploadingMyLocation()
        
        if mapShouldBeCentered == true || spanCount == 0 {
            
            spanCount = 1
            
            //設定預設地圖大小
            let span = MKCoordinateSpanMake(0.005, 0.005)
            
            let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: myCurrentLatitude, longitude: myCurrentLongitude), span: span)
            track_theirLocation_Map.setRegion(region, animated: true)
            
        }
        
    }

    
    func keepUploadingMyLocation(){
        //拿 UID
        if let user = FIRAuth.auth()?.currentUser {
            
            let uid = user.uid  // The user's ID, unique to the Firebase project.
            // Do NOT use this value to authenticate with
            // your backend server, if you have one. Use
            // getTokenWithCompletion:completion: instead.
        } else {
            // No user is signed in.
        }
        
        //Start updating my latitude to Firebase
        ref = FIRDatabase.database().reference(withPath: "ID/\(uid)/Profile/Current-Location/Latitude")
        
        ref.setValue(myCurrentLatitude, withCompletionBlock:
            {(Error, FIRDatabaseReference) -> Void in
                
                if Error != nil {
                    print("CAN'T UPLOAD, Error: \(Error)")
                }
                
        })
        
        
        //Start updating my longitude to Firebase
        ref = FIRDatabase.database().reference(withPath: "ID/\(uid)/Profile/Current-Location/Longitude")
        
        ref.setValue(myCurrentLongitude, withCompletionBlock:
            {(Error, FIRDatabaseReference) -> Void in
                
                if Error != nil {
                    print("CAN'T UPLOAD, Error: \(Error)")
                }
                
        })
        
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadTheme() {
        
        if Manager.currentThemeNumber == 0 {
            
            self.view.backgroundColor = UIColor.init(red: 170.0/255.0, green: 226.0/255.0, blue: 252.0/255.0, alpha: 1.0)
            
            self.Profile_Background_View.backgroundColor = UIColor.init(red: 170.0/255.0, green: 226.0/255.0, blue: 252.0/255.0, alpha: 1.0)
            
            
            
            
            
        } else if Manager.currentThemeNumber == 1 {
            
            
            self.view.backgroundColor = UIColor.init(red: 238.0/255.0, green: 189.0/255.0, blue: 217.0/255.0, alpha: 1.0)
            
            self.Profile_Background_View.backgroundColor = UIColor.init(red: 238.0/255.0, green: 189.0/255.0, blue: 217.0/255.0, alpha: 1.0)
            
            
        }
        
    }

}


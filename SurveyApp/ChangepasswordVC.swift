//
//  ChangepasswordVC.swift
//  SurveyApp
//
//  Created by Mac on 16/12/16.
//  Copyright © 2016 Realizer Tech. All rights reserved.
//


import UIKit
import Alamofire
class ChangePasswordVC: UIViewController {
    
   
    @IBOutlet weak var changepass: UIView!
    @IBOutlet weak var txtconfpass: UITextField!
    @IBOutlet weak var txtnewpass: UITextField!
    @IBOutlet weak var txtoldpass: UITextField!
    @IBAction func submitclick(sender: AnyObject) {
        if(txtoldpass.text=="")
        {
            let passwordcheck = UIAlertController(title: "Error", message: "Please enter Old Password", preferredStyle: .Alert)
            let cancelAction = UIAlertAction(title: "Ok", style: .Cancel, handler:nil)
            
            
            
            passwordcheck.addAction(cancelAction)
            
            
            presentViewController(passwordcheck, animated: true, completion: {  })
            
        }
        else if(!((txtoldpass.text?.characters.count)! >= 6) || !((txtoldpass.text?.characters.count)! <= 10))
        {
            
            let passwordcheck = UIAlertController(title: "Error", message: "Please enter Old Password which has 6-10 in length", preferredStyle: .Alert)
            let cancelAction = UIAlertAction(title: "Ok", style: .Cancel, handler:nil)
            
            
            
            passwordcheck.addAction(cancelAction)
            
            
             presentViewController(passwordcheck, animated: true, completion: {  })
            
        }
        else if(txtnewpass.text==""){
            
            let passwordcheck = UIAlertController(title: "Error", message: "Please enter new Password", preferredStyle: .Alert)
            let cancelAction = UIAlertAction(title: "Ok", style: .Cancel, handler:nil)
            
            
            
            passwordcheck.addAction(cancelAction)
            
            
             presentViewController(passwordcheck, animated: true, completion: {  })
            
        }
        else if(txtnewpass.text?.contains(" ")==true)
        {
            
            let passwordcheck = UIAlertController(title: "Error", message: "Whitespace does not allowed in Password", preferredStyle: .Alert)
            let cancelAction = UIAlertAction(title: "Ok", style: .Cancel, handler:nil)
            
            
            
            passwordcheck.addAction(cancelAction)
            
            
            presentViewController(passwordcheck, animated: true, completion: {  })
            
        }

        else if(!((txtnewpass.text?.characters.count)! >= 6) || !((txtnewpass.text?.characters.count)! <= 10))
        {
            let passwordcheck = UIAlertController(title: "Error", message: "Please enter new Password with 6-10 characters length", preferredStyle: .Alert)
            let cancelAction = UIAlertAction(title: "Ok", style: .Cancel, handler:nil)
            
            
            
            passwordcheck.addAction(cancelAction)
            
            
             presentViewController(passwordcheck, animated: true, completion: {  })
        }
        else if(txtconfpass.text=="")
        {
            let passwordcheck = UIAlertController(title: "Error", message: "Please enter new Password", preferredStyle: .Alert)
            let cancelAction = UIAlertAction(title: "Ok", style: .Cancel, handler:nil)
            
            
            
            passwordcheck.addAction(cancelAction)
            
            
            presentViewController(passwordcheck, animated: true, completion: {  })
            
        }
             else if(!((txtnewpass.text?.characters.count)! >= 6) || !((txtnewpass.text?.characters.count)! <= 10))
        {
            let passwordcheck = UIAlertController(title: "Error", message: "Please enter Confirm Password with 6-10 characters length", preferredStyle: .Alert)
            let cancelAction = UIAlertAction(title: "Ok", style: .Cancel, handler:nil)
            
            
            
            passwordcheck.addAction(cancelAction)
            
            
           presentViewController(passwordcheck, animated: true, completion: {  })
            
        }
        else if(txtconfpass.text != txtnewpass.text){
            
            let passwordcheck = UIAlertController(title: "Error", message: "Mismatch Password", preferredStyle: .Alert)
            let cancelAction = UIAlertAction(title: "Ok", style: .Cancel, handler:nil)
            
            
            
            passwordcheck.addAction(cancelAction)
                    presentViewController(passwordcheck, animated: true, completion: {  })
            
        }
        else{
            
          changePassword {}
            
            
                    }
        
       //self.dismissViewControllerAnimated(true, completion: nil)
    }
    @IBAction func cancellick(sender: AnyObject) {
        self.dismissViewControllerAnimated(false, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        changepass.layer.borderColor=UIColor.blackColor().CGColor
        changepass.layer.borderWidth=1
        
        
        // Do any additional setup after loading the view.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        
        //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
        //tap.cancelsTouchesInView = false
        
        view.addGestureRecognizer(tap)
    }
    
    //Calls this function when the tap is recognized.
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    
    
    
    func changePassword(completed:  DownloadComplete){
        //var userid:String = txtuserid.text!
        let oldpassword:String = txtoldpass.text!
        var cnfipass:String = txtconfpass.text!
        var newpass:String = txtnewpass.text!
        
        var userid1:String=NSUserDefaults.standardUserDefaults().valueForKey("UserId") as! String
        
let parameters=["oldPassword":oldpassword,"newPassword":newpass]
        
        print("==changepassword=====")
        print(oldpassword)
        print(newpass)
    
        let uri=URL_Security+"security/changePassword/\(userid1)"

        Alamofire.request(.POST,uri,parameters:parameters).responseString{ response in
            
            
            print("=======\(response)")
            
            
            let result=response.result
            let dict:String = result.value!
            
            if (dict == "true")
            {
                let passwordset = UIAlertController(title: "Set Password ", message: "Password change Successfully..!!", preferredStyle: .Alert )
                               
                let okAction = UIAlertAction(title: "OK", style: .Default, handler:{action in
                    self.dismissViewControllerAnimated(true, completion: nil)
                })
                
                
                
                passwordset.addAction(okAction)
               
                self.presentViewController(passwordset, animated: true, completion:nil)
                
            }
            else{
                let passwordset = UIAlertController(title: "Error", message: "Please try again ", preferredStyle: .Alert )
                // let cancelAction = UIAlertAction(title: "OK", style: .cancel, handler:nil)
                
                let okAction = UIAlertAction(title: "OK", style: .Cancel, handler: nil)
                
                
                // passwordset.addAction(cancelAction)
                passwordset.addAction(okAction)
                
                
                self.presentViewController(passwordset, animated: true, completion: {  })
                
            }
            
        }
        completed()
        
    }
    
    
    



}

//
//  ResetPasswordVC.swift
//  SurveyApp
//
//  Created by Mac on 16/12/16.
//  Copyright © 2016 Realizer Tech. All rights reserved.
//


import UIKit
import Alamofire

class ResetPasswordVC: UIViewController {
    
    @IBOutlet weak var ResetPasswordView: UIView!
    
    @IBOutlet weak var txtuserid: UITextField!
    @IBOutlet weak var ResetPasswordtxtConfPassword: UITextField!
    @IBOutlet weak var resetpasswordtxtPassword: UITextField!
    var userid1:String = NSUserDefaults.standardUserDefaults().valueForKey("UID") as! String
    
    
    var usersetid:String=NSUserDefaults.standardUserDefaults().valueForKey( "UserSetID")  as! String
    
    
    @IBAction func submitClick(sender: AnyObject) {
        
        
        if(resetpasswordtxtPassword.text==""  ){
            let passwordcheck = UIAlertController(title: "Error ", message: "Please enter new  Password", preferredStyle: .Alert)
            let cancelAction = UIAlertAction(title: "Ok", style: .Cancel, handler:nil)
            
            
            
            
            passwordcheck.addAction(cancelAction)
          
             presentViewController(passwordcheck, animated: true, completion: {  })
            
        }
        else if(resetpasswordtxtPassword.text?.contains(" ")==true)
        {
            let passwordcheck = UIAlertController(title: "Error ", message: "Whitespace does not allowed in Password", preferredStyle: .Alert)
            let cancelAction = UIAlertAction(title: "Ok", style: .Cancel, handler:nil)
            
            
            
            
            passwordcheck.addAction(cancelAction)
            
            presentViewController(passwordcheck, animated: true, completion: {  })
            
        }else if(!((resetpasswordtxtPassword.text?.characters.count)! >= 6) || !((resetpasswordtxtPassword.text?.characters.count)! <= 10)){
            
            let passwordcheck = UIAlertController(title: "Error ", message: "Please enter new  Password of length 6-10", preferredStyle: .Alert)
            let cancelAction = UIAlertAction(title: "Ok", style: .Cancel, handler:nil)
            
            
            
            
            passwordcheck.addAction(cancelAction)
            
            
             presentViewController(passwordcheck, animated: true, completion: {  })
        }
        
        if( ResetPasswordtxtConfPassword.text=="")
        {
            let passwordcheck = UIAlertController(title: "Error ", message: "Please enter Confirm Password", preferredStyle: .Alert)
            let cancelAction = UIAlertAction(title: "Ok", style: .Cancel, handler:nil)
            
            
            
            
            passwordcheck.addAction(cancelAction)
            
            
            presentViewController(passwordcheck, animated: true, completion: {  })
            
        }
            
        else{
            
            if(resetpasswordtxtPassword.text==ResetPasswordtxtConfPassword.text)
            {
                
               ResetPassword {}
                           }
            else{
                let passwordcheck = UIAlertController(title: "Mismatch Password", message: "Password does not Match", preferredStyle: .Alert)
                let cancelAction = UIAlertAction(title: "Ok", style: .Cancel, handler:nil)
                
                
                
                passwordcheck.addAction(cancelAction)
                
                
                 presentViewController(passwordcheck, animated: true, completion: {  })
            }
            
        }

    }
   
    @IBAction func cancelClick(sender: AnyObject) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
     
            }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ResetPasswordView.layer.borderColor=UIColor.blackColor().CGColor
        ResetPasswordView.layer.borderWidth=1
        //var  username:String = NSUserDefaults.standardUserDefaults().valueForKey( "UserName") as! String
        txtuserid.text=String(usersetid)
        
        print("========\(userid1)=====")
        
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

    func ResetPassword(completed: DownloadComplete){
        var userid:String = txtuserid.text!
        let password:String=resetpasswordtxtPassword.text!
        
        print(password)
        userid=userid1
        
        let uri=URL_Security+"Security/setPassword/\(userid1)/\(password)"
        print(userid)
        print("dfer====\(usersetid)")
        print("==resetpassword=====")
        print("http://45.35.4.250/chat/api/security/setPassword/\(userid1)/\(password)")

        Alamofire.request(.POST,uri).responseJSON{ response in
            print("====ghghjghjhj===\(response)")
            
            
            let result=response.result
         
                
                if let dict = result.value
                    
                {
                    print("====dict====\(dict)")
                    let res=dict["Success"] as? Int
                    
                    if (dict as! NSObject==1)
                    {
                        let passwordset = UIAlertController(title: "Set Password ", message: "Password reset Successfully..!!", preferredStyle: .Alert )
                        // let cancelAction = UIAlertAction(title: "OK", style: .cancel, handler:nil)
                        
                        let okAction = UIAlertAction(title: "OK", style: .Default, handler: {
                            action in  self.performSegueWithIdentifier("squeresetpass", sender: self)
                        })
                        
                        
                        // passwordset.addAction(cancelAction)
                        passwordset.addAction(okAction)
                        
                        
                         self.presentViewController(passwordset, animated: true, completion:nil)
                        
                    }
                    else{
                        
                        
                        let passwordset = UIAlertController(title: "Set Password ", message: "Please check User Id And Password", preferredStyle: .Alert )
                                               let okAction = UIAlertAction(title: "OK", style: .Cancel, handler: nil)
                        
                        
                   
                        passwordset.addAction(okAction)
                        
                        
                        
                        self.presentViewController(passwordset, animated: true, completion:nil)
                    }
                    
                    
                }
                
                
                      }
        
        
        completed()
            }
    
    
    
    
    
    
    
    
    
    
    
    
    
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
}

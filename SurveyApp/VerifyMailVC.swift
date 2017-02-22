//
//  VerifyMailVC.swift
//  SurveyApp
//
//  Created by Mac on 16/12/16.
//  Copyright © 2016 Realizer Tech. All rights reserved.
//



import UIKit
import Alamofire
class VerifyMailVC: UIViewController {
    
    @IBOutlet weak var VerifyMailView: UIView!
    
    @IBOutlet weak var txtuserId: UITextField!
    
    @IBOutlet weak var lblHeaderverifyMail: UILabel!
    @IBOutlet weak var txtVerifyMail: UITextField!
    
    func isValidEmail(testStr:String) -> Bool {
        
        
        print("validate emilId: \(testStr)")
        let emailRegEx = "^(?:(?:(?:(?: )*(?:(?:(?:\\t| )*\\r\\n)?(?:\\t| )+))+(?: )*)|(?: )+)?(?:(?:(?:[-A-Za-z0-9!#$%&’*+/=?^_'{|}~]+(?:\\.[-A-Za-z0-9!#$%&’*+/=?^_'{|}~]+)*)|(?:\"(?:(?:(?:(?: )*(?:(?:[!#-Z^-~]|\\[|\\])|(?:\\\\(?:\\t|[ -~]))))+(?: )*)|(?: )+)\"))(?:@)(?:(?:(?:[A-Za-z0-9](?:[-A-Za-z0-9]{0,61}[A-Za-z0-9])?)(?:\\.[A-Za-z0-9](?:[-A-Za-z0-9]{0,61}[A-Za-z0-9])?)*)|(?:\\[(?:(?:(?:(?:(?:[0-9]|(?:[1-9][0-9])|(?:1[0-9][0-9])|(?:2[0-4][0-9])|(?:25[0-5]))\\.){3}(?:[0-9]|(?:[1-9][0-9])|(?:1[0-9][0-9])|(?:2[0-4][0-9])|(?:25[0-5]))))|(?:(?:(?: )*[!-Z^-~])*(?: )*)|(?:[Vv][0-9A-Fa-f]+\\.[-A-Za-z0-9._~!$&'()*+,;=:]+))\\])))(?:(?:(?:(?: )*(?:(?:(?:\\t| )*\\r\\n)?(?:\\t| )+))+(?: )*)|(?: )+)?$"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        let result = emailTest.evaluateWithObject(testStr)
        return result
    }
    
    
    
    @IBAction func CancelClick(sender: AnyObject) {
       self.dismissViewControllerAnimated(true, completion: nil)

    }
    @IBAction func VerifyMailSubmitClick(sender: AnyObject) {
        
        //verifyEmail {}
        
        var mail=txtVerifyMail.text
        var userid=txtuserId.text
        if(txtuserId.text==""  )
        {
            let emailBtn = UIAlertController(title: "Error", message: "Please enter User Id", preferredStyle: .Alert )
            let okAction = UIAlertAction(title: "Ok", style: .Cancel, handler:nil)
            
            
            emailBtn.addAction(okAction)
           
         presentViewController(emailBtn, animated: true, completion: {  })
            
            
            
        }
        else if( !((txtuserId.text?.characters.count)! >= 6) || !((txtuserId.text?.characters.count)! <= 10)){
            let emailBtn = UIAlertController(title: "Error", message: "Invalid User ID", preferredStyle: .Alert )
            let okAction = UIAlertAction(title: "Ok", style: .Cancel, handler:nil)
            
            
            emailBtn.addAction(okAction)
            
            presentViewController(emailBtn, animated: true, completion: {  })
        }
        else if(txtVerifyMail.text=="" )
        {
            let emailBtn = UIAlertController(title: "Error", message: "Please enter Email ID", preferredStyle: .Alert )
            let okAction = UIAlertAction(title: "Ok", style: .Cancel, handler:nil)
            
            
            emailBtn.addAction(okAction)
            
            presentViewController(emailBtn, animated: true, completion: {  })
            
            
        }
        else if (isValidEmail(txtVerifyMail.text!)) {
            
            
            
            verifyEmail {}
                

                 }
        else{
            
            let emailBtn = UIAlertController(title: "Error", message: "Invalid Email", preferredStyle: .Alert )
            let okAction = UIAlertAction(title: "OK", style: .Cancel, handler:nil)
            
            emailBtn.addAction(okAction)
            
            
            presentViewController(emailBtn, animated: true, completion: {  })
        }
        
        
    }
    
    func verifyEmail(completed: DownloadComplete){
        let userid:String = txtuserId.text!
        let email:String=txtVerifyMail.text!
        print(userid)
        print(email)
        
        let headers:[String:String] = ["emailId":email as! String]
        let uri = URL_Security+"Security/sendPaswordToEmail/\(userid)"
        print(uri)
       // "http://45.35.4.250/survey/api/Security/sendPaswordToEmail/\(userid)"
        Alamofire.request(.POST,uri,headers: headers).responseString{ response in
            print("====\(response)")
            
            let result=response.result
            //if let dict = result.value  as?  Dictionary<String,AnyObject>
            
            let dict:String = result.value!
            
            // {
            print(".........\(dict)")
            //let res=dict["Success"] as? Int
            
            if (dict == "true")
            {
                
                let passwordcheck = UIAlertController(title: "Set Password", message: "Password sent to your Email Address", preferredStyle: .Alert)
                let cancelAction = UIAlertAction(title: "Ok", style: .Default, handler:{
                    action in  self.performSegueWithIdentifier("squesetpass", sender: self)//self.performSegue(withIdentifier: "squePasswordset", sender: self)
                    
                })
                
                
                
                passwordcheck.addAction(cancelAction)
                
                
                self.presentViewController(passwordcheck, animated: true, completion: {  })
                
                
                
                
                
            }
                
            else{
                
                
                let passwordcheck = UIAlertController(title: "Error", message: "Please Check UserName/EmailId", preferredStyle: .Alert)
                let cancelAction = UIAlertAction(title: "Ok", style: .Default, handler:nil)
                
                
                
                passwordcheck.addAction(cancelAction)
                
                
                self.presentViewController(passwordcheck, animated: true, completion: {  })
                
            }
            // }
            
            print(response)
            
            
        }
        
        
        completed()
        
        
    }
    
    
  
    @IBOutlet weak var lblentervalidmail: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        VerifyMailView.layer.borderColor=UIColor.blackColor().CGColor
        VerifyMailView.layer.borderWidth=1
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
    
    
    override func viewDidAppear(_ animated: Bool) {
        
    }
    
}

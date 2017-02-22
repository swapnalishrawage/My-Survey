//
//  VerifymagicWordVC.swift
//  SurveyApp
//
//  Created by Mac on 16/12/16.
//  Copyright © 2016 Realizer Tech. All rights reserved.
//



import UIKit
import Alamofire
class VerifyMagicWordVC: UIViewController {
    
    
    @IBOutlet weak var VerifyMagicwordView: UIView!
    private var _userid:String!
    @IBOutlet weak var txtUserId: UITextField!
    @IBOutlet weak var txtverifyMagicword: UITextField!
    var userid:String
        {
        get{
            return _userid
        }
        set{
            _userid=newValue
        }
    }
    @IBAction func submitClick(sender: AnyObject) {
        
        var mail=txtverifyMagicword.text
        let userid=txtUserId.text
        
        NSUserDefaults.standardUserDefaults().setObject(userid, forKey: "UserSetID")
                if(txtUserId.text=="" ){
            let Verifyuserid = UIAlertController(title: "Error", message: "Please enter User ID", preferredStyle: .Alert )
            let cancelAction = UIAlertAction(title: "OK", style: .Cancel, handler:nil)
            
            
            Verifyuserid.addAction(cancelAction)
            
            presentViewController(Verifyuserid, animated: true, completion: {  })
            
            
            
        }
        else if( !((txtUserId.text?.characters.count)! >= 6) || !((txtUserId.text?.characters.count)! <= 10) )
        {
            let Verifyuserid = UIAlertController(title: "Error", message: "Please Enter User ID with 6-10 length", preferredStyle: .Alert )
            let cancelAction = UIAlertAction(title: "OK", style: .Cancel, handler:nil)
            
            
            Verifyuserid.addAction(cancelAction)
            
            presentViewController(Verifyuserid, animated: true, completion: {  })
            
        }
                    else if(txtverifyMagicword.text?.contains(" ")==true)
                {
                    let VerifyMagic = UIAlertController(title: "Error", message: "WhiteSpace does not Allow in MagicWord", preferredStyle: .Alert )
                    let cancelAction = UIAlertAction(title: "OK", style: .Cancel, handler:nil)
                    
                    
                    VerifyMagic.addAction(cancelAction)
                    
                    
                    presentViewController(VerifyMagic, animated: true, completion: {  })

                }
        else   if(txtverifyMagicword.text=="")
        {
            let VerifyMagic = UIAlertController(title: "Error", message: "Please enter Magic Word", preferredStyle: .Alert )
            let cancelAction = UIAlertAction(title: "OK", style: .Cancel, handler:nil)
            
            
            VerifyMagic.addAction(cancelAction)
            
          
             presentViewController(VerifyMagic, animated: true, completion: {  })
            
        }
        else
        {
            verifymagicword {}
        }
    }
    @IBAction func CancelClick(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
            }
    
    
       func verifymagicword(completed: DownloadComplete){
        let userid:String = txtUserId.text!
        let magicword:String=txtverifyMagicword.text!
        print(userid)
        print(magicword)
        
       
        print("http://45.35.4.250/survey/api/Security/validateMagicWord/\(userid)/\(magicword)")
       
        let uri=URL_Security+"Security/validateMagicWord/\(userid)/\(magicword)"
        //"http://45.35.4.250/survey/api/Security/validateMagicWord/\(userid)/\(magicword)"
        Alamofire.request(.GET,uri).responseJSON{ response in
            //print("====\(response)")
            
            let result=response.result
            if let dict = result.value  as?  Dictionary<String,AnyObject>
                
            {
                let res=dict["Success"] as? Int
                
                if (res == 1)
                {
                    
                    
                    if let uid = dict["userId"] as? String {
                        self._userid=uid
                        let uID:String = self._userid
                        print("-------\(uID)------")
                        
                        NSUserDefaults.standardUserDefaults().setObject(uID, forKey: "UID")
                        self.performSegueWithIdentifier("squeresetpass", sender: nil)
                      //  self.performSegue(withIdentifier: "SgueMgicWordSubmit", sender: nil)
                        
                        
                        
                        
                    }
                    
                    
                    
                    
                }
                else{
                    
                    
                    let passwordcheck = UIAlertController(title: "Error", message: "Please check UserName or Magic Word", preferredStyle: .Alert)
                    let cancelAction = UIAlertAction(title: "Ok", style: .Cancel, handler:nil)
                    
                    
                    
                    passwordcheck.addAction(cancelAction)
                    self.presentViewController(passwordcheck, animated: true, completion: nil)
            
                    
                }
            }
            
            print(response)
            
            
        }
        
        
        completed()
        
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        VerifyMagicwordView.layer.borderColor=UIColor.blackColor().CGColor
        VerifyMagicwordView.layer.borderWidth=1
        
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
    
    
    
    
}

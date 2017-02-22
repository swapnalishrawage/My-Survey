//
//  LoginVC.swift
//  SurveyApp
//
//  Created by Mac on 13/12/16.
//  Copyright © 2016 Realizer Tech. All rights reserved.
//

import UIKit
import Alamofire
class LoginVC: UIViewController {
    var spinner = UIActivityIndicatorView(activityIndicatorStyle: .WhiteLarge)
    var loadingView: UIView = UIView()
    

    @IBOutlet weak var menu: UIBarButtonItem!
    @IBOutlet weak var txtpassword: UITextField!
    
    @IBOutlet var mainview: UIView!
    @IBOutlet weak var txtusername: UITextField!
    private var _userName:String!
    private var _deviceid:String!
    private var _userid:String!
    private var _userinitials:String!
    private var _thumbnailurl:String!
    private var _ContactNo:String!
      private var _Dob:String!
     private var _Email:String!
    var userName : String{
        get {
            return _userName
            
        }
        set
        {
            _userName = newValue
        }
    }
    
    var userid:String
        {
        get{
            return _userid
        }
        set{
            _userid=newValue
        }
        
        
    }
    var deviceid : String{
        get {
            return _deviceid
            
        }
        set
        {
            _deviceid = newValue
        }
    }
    var ContactNo : String{
        get {
            return _ContactNo
            
        }
        set
        {
            _ContactNo = newValue
        }
    }
    var Dob : String{
        get {
            return _Dob
            
        }
        set
        {
            _Dob = newValue
        }
    }
    var Email : String{
        get {
            return _Email
            
        }
        set
        {
            _Email = newValue
        }
    }

    
    var userinitials:String
        {
        get{
            return _userinitials
        }
        set{
            _userinitials=newValue
        }
        
        
    }
    
    

    @IBAction func loginclick(sender: AnyObject) {
        
        if(txtusername.text=="" )
        {
            let username = UIAlertController(title: "Error", message: "Please enter User Id ", preferredStyle:.Alert)
            let cancelAction = UIAlertAction(title: "Ok", style: .Cancel, handler:nil)
            
            
            
            username.addAction(cancelAction)
            
            
            
            presentViewController(username, animated: true, completion: nil)
            
        }
        else if(  !((txtusername.text?.characters.count)! >= 6) || !((txtusername.text?.characters.count)! <= 10))
        {
            
            let check = UIAlertController(title: "Error ", message: "Incorrect User Id ", preferredStyle: .Alert )
            let okAction = UIAlertAction(title: "Ok", style: .Cancel, handler:nil)
            
            
            check.addAction(okAction)
            
            presentViewController(check, animated: true, completion: {  })
        }
        else  if(txtpassword.text=="")
        {
            let passwordcheck = UIAlertController(title: "Error", message: "Please enter Password ", preferredStyle: .Alert)
            let cancelAction = UIAlertAction(title: "Ok", style: .Cancel, handler:nil)
            
            
            
            passwordcheck.addAction(cancelAction)
            
            
            presentViewController(passwordcheck, animated: true, completion: {  })
            
            
        }
            
        else  if( !((txtpassword.text?.characters.count)! >= 6) || !((txtpassword.text?.characters.count)! <= 10) )
        {
            let passwordcheck = UIAlertController(title: "Error", message: " Incorrect Password", preferredStyle: .Alert)
            let cancelAction = UIAlertAction(title: "Ok", style: .Cancel, handler:nil)
            
            
            
            
            passwordcheck.addAction(cancelAction)
            
            
            presentViewController(passwordcheck, animated: true, completion: {  })
            
        }
        else{
            downloadLoginDetails{}
        }
        
    }
    func showActivityIndicator() {
        dispatch_async(dispatch_get_main_queue()) {
            self.loadingView = UIView()
            self.loadingView.frame = CGRect(x: 0.0, y: 0.0, width: 100.0, height: 100.0)
            self.loadingView.center = self.view.center
            self.loadingView.backgroundColor = UIColor.orangeColor()
            self.loadingView.alpha = 0.7
            self.loadingView.clipsToBounds = true
            self.loadingView.layer.cornerRadius = 10
            
            self.spinner = UIActivityIndicatorView(activityIndicatorStyle: .WhiteLarge)
            self.spinner.frame = CGRect(x: 0.0, y: 0.0, width: 80.0, height: 80.0)
            self.spinner.center = CGPoint(x:self.loadingView.bounds.size.width / 2, y:self.loadingView.bounds.size.height / 2)
            
            self.loadingView.addSubview(self.spinner)
            self.view.addSubview(self.loadingView)
            self.spinner.startAnimating()
        }
    }
    
    func hideActivityIndicator() {
        dispatch_async(dispatch_get_main_queue()) {
            self.spinner.stopAnimating()
            self.loadingView.removeFromSuperview()
        }
    }
    

    
    
    func downloadLoginDetails(completed: DownloadComplete){
        let m = BASE_URL + "login"
        var thumbnailpic:String!
        showActivityIndicator()
        
        let base_url = NSURL(string: m )!

        
        var userid:String = txtusername.text!
        var password:String=txtpassword.text!
   
        
        let parameters = ["LoginId":userid,"Password":password,"DeviceId":"12345"]
        
        
        Alamofire.request(.POST, base_url,parameters: parameters,encoding: .JSON).responseJSON{ response in
         
     
            let result=response.result
            if let dict=result.value as? Dictionary<String,AnyObject>
            {
              
                let res=dict["Success"] as? Int
                
                if (res == 1)
                {
                  
                    if let username = dict["UserFullName"] as? String {
                        self._userName=username
                        let uname:String = self._userName
                      
                        NSUserDefaults.standardUserDefaults().setObject(uname, forKey: "UserName")
                    }
                    if let uid=dict["UserId"] as? String{
                        self._userid=uid
                        let ud:String = self._userid
                        
                        NSUserDefaults.standardUserDefaults().setObject(ud, forKey: "UserId")
                        
                    }
                    if let userinitial=dict["UserInitials"] as? String{
                        self._userinitials=userinitial
                        let ud:String = self._userinitials
                     
                        NSUserDefaults.standardUserDefaults().setObject(ud, forKey: "UserInitials")
                        
                        
                    }
                    if let ContactNo=dict["ContactNo"] as? String{
                        self._ContactNo=ContactNo
                        let mbno:String = self._ContactNo
                                               NSUserDefaults.standardUserDefaults().setObject(mbno, forKey: "ContactNo")
                        
                        
                    }
                    if let Dob = dict["Dob"] as? String{
                        self._Dob = Dob
                        let dob:String = self._Dob
              
                        NSUserDefaults.standardUserDefaults().setObject(dob, forKey: "Dob")
                        
                        
                    }
                    
                    if let Email = dict["Email"] as? String{
                        self._Email = Email
                        let Email:String = self._Email
                     
                        NSUserDefaults.standardUserDefaults().setObject(Email, forKey: "Email")
                        
                        
                    }
                    
                    
                    
                    if let thubnailurl=dict["ThumbanilUrl"] as? String{
                        self._thumbnailurl=thubnailurl
                        thumbnailpic = self._thumbnailurl
                  
                        
                        
                        
                        let downloadimage = DownloadImage()
                        
                        downloadimage.userImage(thumbnailpic)
                        
                        
                        
                    }
                    else if  (dict["ThumbanilUrl"] is NSNull){
                        self._thumbnailurl=""
                        thumbnailpic = self._thumbnailurl
                        print("---\(self._thumbnailurl)------")
                        
                        
                        let downloadimage = DownloadImage()
                        
                        downloadimage.userImage(thumbnailpic)
                        
                    }
                    
                    NSUserDefaults.standardUserDefaults().setObject(thumbnailpic, forKey: "UserPic")
                    
                    
                    NSUserDefaults.standardUserDefaults().setObject("2", forKey: "getby")
                    
                    self.performSegueWithIdentifier("validuser", sender: nil)
                    
                }
                    else if(response.response?.statusCode==400)
                {
                    let passwordcheck = UIAlertController(title: "Error", message: "Please try after some time!", preferredStyle: .Alert)
                    let cancelAction = UIAlertAction(title: "Ok", style: .Cancel, handler:nil)
                    
                    
                    
                    passwordcheck.addAction(cancelAction)
                    
                    
                    self.presentViewController(passwordcheck, animated: true, completion:nil)

                }
                else{
                    let passwordcheck = UIAlertController(title: "Invalid Credentials", message: "Please enter Correct  UserName and Password", preferredStyle: .Alert)
                    let cancelAction = UIAlertAction(title: "Ok", style: .Cancel, handler:nil)
                    
                    
                    
                    passwordcheck.addAction(cancelAction)
                    
                    
                    self.presentViewController(passwordcheck, animated: true, completion:nil)
                    
                }
                
                
                
            }
            
            print(response)
            
            self.hideActivityIndicator()
            
        }
        
        
        completed()
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
               self.navigationController?.setNavigationBarHidden(true, animated:true)
    navigationController?.navigationBarHidden=true
      
        if Reachability.isConnectedToNetwork() == true {
            print("Internet connection OK")
        } else {
            print("Internet connection FAILED")
            let alert1 = UIAlertView(title: "No Internet Connection", message: "Make sure your device is connected to the internet.", delegate: nil, cancelButtonTitle: "OK")
            alert1.show()
        }
     

        // Do any additional setup after loading the view.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        
        
        view.addGestureRecognizer(tap)
    }
    
    //Calls this function when the tap is recognized.
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    override func viewWillAppear(animated: Bool) {
          navigationController?.navigationBarHidden=true
    }

    @IBAction func signupclick(sender: AnyObject) {
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

  
}

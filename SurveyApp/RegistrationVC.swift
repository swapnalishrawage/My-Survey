//
//  RegistrationVC.swift
//  SurveyApp
//
//  Created by Mac on 13/12/16.
//  Copyright © 2016 Realizer Tech. All rights reserved.
//

import UIKit
import Alamofire
class RegistrationVC: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate,UITextFieldDelegate {
    
    @IBOutlet weak var leftbar: UIBarButtonItem!
    
    @IBOutlet weak var txtfirstname: UITextField!
    var b:Bool=true
    @IBOutlet weak var txtaddress: UITextField!
    @IBOutlet weak var txtlastname: UITextField!
    @IBOutlet weak var txtmobile: UITextField!
    
    @IBOutlet weak var logoimage: UIImageView!
    @IBOutlet weak var txtmagic: UITextField!
    @IBOutlet weak var txtconfpass: UITextField!
    @IBOutlet weak var txtpass1: UITextField!
    @IBOutlet weak var txtuserid: UITextField!
    @IBOutlet weak var datepicker: UIDatePicker!
    @IBOutlet weak var txtemailid: UITextField!
    var spinner = UIActivityIndicatorView(activityIndicatorStyle: .WhiteLarge)
    var loadingView: UIView = UIView()
    let im1=UIImage(named: "check.png")
    let image = UIImage(named: "uncheck.png")
    override func viewDidLoad() {
        super.viewDidLoad()
        //navigationController?.setToolbarHidden(false, animated: false)
           txtfirstname.layer.borderWidth=1
        txtfirstname.layer.cornerRadius=5
        txtfirstname.layer.borderColor=UIColor(red: 33/255, green: 69/255, blue: 143/255, alpha: 0.7).CGColor
     
        
        
        txtlastname.layer.borderWidth=1
      txtlastname.layer.cornerRadius=5
        txtlastname.layer.borderColor=UIColor(red: 33/255, green: 69/255, blue: 143/255, alpha: 0.7).CGColor
        

        txtaddress.layer.borderWidth=1
        txtaddress.layer.cornerRadius=5
        txtaddress.layer.borderColor=UIColor(red: 33/255, green: 69/255, blue: 143/255, alpha: 0.7).CGColor
        
        
        txtmobile.layer.borderWidth=1
        txtmobile.layer.cornerRadius=5
        txtmobile.layer.borderColor=UIColor(red: 33/255, green: 69/255, blue: 143/255, alpha: 0.7).CGColor
        
        txtemailid.layer.borderWidth=1
       txtemailid.layer.cornerRadius=5
        txtemailid.layer.borderColor=UIColor(red: 33/255, green: 69/255, blue: 143/255, alpha: 0.7).CGColor
        
        txtuserid.layer.borderWidth=1
        txtuserid.layer.cornerRadius=5
        txtuserid.layer.borderColor=UIColor(red: 33/255, green: 69/255, blue: 143/255, alpha: 0.7).CGColor
        
        
        txtpass1.layer.borderWidth=1
       txtpass1.layer.cornerRadius=5
        txtpass1.layer.borderColor=UIColor(red: 33/255, green: 69/255, blue: 143/255, alpha: 0.7).CGColor
        

        txtconfpass.layer.borderWidth=1
       txtconfpass.layer.cornerRadius=5
        txtconfpass.layer.borderColor=UIColor(red: 33/255, green: 69/255, blue: 143/255, alpha: 0.7).CGColor
        txtmagic.layer.borderWidth=1
        txtmagic.layer.cornerRadius=5
       txtmagic.layer.borderColor=UIColor(red: 33/255, green: 69/255, blue: 143/255, alpha: 0.7).CGColor
        
          datepicker.maximumDate = datepicker.date
        tabBarController?.hidesBottomBarWhenPushed=true
        // Do any additional setup after loading the view, typically from a nib.
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
    
    @IBOutlet weak var btnradiofemale: UIButton!
    var strBase64:String = ""
    

    @IBAction func closeClick(sender: AnyObject) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
        self.performSegueWithIdentifier("Squeregister", sender: nil)

        
    }
    @IBOutlet weak var uploadimage: UIImageView!
    @IBAction func registerClick(sender: AnyObject) {
        
        
        let mb=txtmobile.text
        let fnm=txtfirstname.text
        let lnm=txtlastname.text
        
        
        
        let userid=txtuserid.text
        let pass=txtpass1.text
        if(txtfirstname.text=="" && txtlastname.text=="" && txtaddress.text=="" && txtemailid.text==""   && txtpass1.text=="" && txtmagic.text==""  && txtmobile.text=="" && txtuserid.text=="" &&  txtconfpass.text=="")
        {
            
            let check = UIAlertController(title: "Error ", message: "Please fill all Information..", preferredStyle: .Alert )
            let okAction = UIAlertAction(title: "Ok", style: .Cancel, handler:nil)
            
            
            check.addAction(okAction)
            presentViewController(check, animated: true, completion:nil)
             self.hideActivityIndicator()
            
        }
            
        else   if(txtfirstname.text=="" || txtlastname.text=="" || txtaddress.text=="" || txtemailid.text==""   || txtpass1.text=="" || txtmagic.text==""  || txtmobile.text=="" || txtuserid.text=="" || txtconfpass.text=="")
        {
            
            if(txtfirstname.text!=="" || (txtfirstname.text?.characters.count)! > 20 || (fnm?.containsNumbers())!)
            {
                let check = UIAlertController(title: "Error", message: "Please enter First Name", preferredStyle: .Alert )
                let okAction = UIAlertAction(title: "Ok", style: .Cancel, handler:nil)
                
                
                check.addAction(okAction)
                
                presentViewController(check, animated: true, completion:nil)            }
            else
            {
                let fn=txtfirstname.text
                
                let  n=fn?.characters.count
                if(n! > 20 )
                {
                    let check = UIAlertController(title: "Error", message: "Please enter Name with max 20 Characters", preferredStyle: .Alert )
                    let okAction = UIAlertAction(title: "Ok", style: .Cancel, handler:nil)
                    
                    
                    check.addAction(okAction)
                    
                    presentViewController(check, animated: true, completion:nil)                }
                
            }
            
            if(txtlastname.text=="" || (txtlastname.text?.characters.count)! > 20 || (lnm?.containsNumbers())!)
            {
                let check = UIAlertController(title: "Error", message: "Please enter Last Name", preferredStyle: .Alert )
                let okAction = UIAlertAction(title: "Ok", style: .Cancel, handler:nil)
                
                
                check.addAction(okAction)
                
                presentViewController(check, animated: true, completion:nil)
                self.hideActivityIndicator()
            }
            else if((txtlastname.text?.characters.count)! > 20){
                let check = UIAlertController(title: "Error", message: "Please enter Last Name of 20 charecters", preferredStyle: .Alert )
                let okAction = UIAlertAction(title: "Ok", style: .Cancel, handler:nil)
                
                
                check.addAction(okAction)
                
                presentViewController(check, animated: true, completion:nil)
                
                self.hideActivityIndicator()
            }
            
            
            
            if(txtaddress.text!=="" || (txtaddress.text?.characters.count)! > 50)
            {
                let check = UIAlertController(title: "Error", message: "Please enter Address", preferredStyle: .Alert )
                let okAction = UIAlertAction(title: "Ok", style: .Cancel, handler:nil)
                
                
                check.addAction(okAction)
                
                presentViewController(check, animated: true, completion:nil)
                self.hideActivityIndicator()}
            else
            {
                let fn=txtaddress.text
                
                let  n=fn?.characters.count
                if(n! > 50)
                {
                    let check = UIAlertController(title: "Error", message: "Address  have maximum 50 Characters", preferredStyle: .Alert )
                    let okAction = UIAlertAction(title: "Ok", style: .Cancel, handler:nil)
                    
                    
                    check.addAction(okAction)
                    
                    presentViewController(check, animated: true, completion:nil)                }
                self.hideActivityIndicator()
                
            }
            
            if(txtmobile.text  == "" ){let check = UIAlertController(title: "Error", message: "Please enter Mobile Number ", preferredStyle: .Alert )
                let okAction = UIAlertAction(title: "Ok", style: .Cancel, handler:nil)
                
                
                check.addAction(okAction)
                
                presentViewController(check, animated: true, completion:nil) }
            else if( (txtmobile.text?.characters.count)! < 10 || (txtmobile.text?.characters.count)! > 10 || !((mb?.containsNumbers())!) ||  (mb?.containsCharacters())!)
            {
                let check = UIAlertController(title: "Error", message: "Please enter Mobile Number with 10 digit", preferredStyle: .Alert )
                let okAction = UIAlertAction(title: "Ok", style: .Cancel, handler:nil)
                
                
                check.addAction(okAction)
                
                presentViewController(check, animated: true, completion:nil)
                self.hideActivityIndicator()
            }
            if(txtuserid.text == ""){
                let check = UIAlertController(title: "Error ", message: " Please enter User Id  ", preferredStyle: .Alert )
                let okAction = UIAlertAction(title: "Ok", style: .Cancel, handler:nil)
                
                
                check.addAction(okAction)
                
                presentViewController(check, animated: true, completion:nil)
                self.hideActivityIndicator()
            }
            else    if((userid?.contains(" "))==true)
            {
                
                let passwordcheck = UIAlertController(title: "Error", message: " Whitespace not allowed in User Id", preferredStyle: .Alert)
                let cancelAction = UIAlertAction(title: "Ok", style: .Cancel, handler:nil)
                
                
                
                
                passwordcheck.addAction(cancelAction)
                
                
                presentViewController(passwordcheck, animated: true, completion:nil)
                self.hideActivityIndicator()
                
            }
            else if((!((txtuserid.text?.characters.count)! >= 6) || !((txtuserid.text?.characters.count)! <= 10)   ))
            {
                let check = UIAlertController(title: "Error ", message: "  User Id Must be in Range of 6-10 Characters length", preferredStyle: .Alert )
                let okAction = UIAlertAction(title: "Ok", style: .Cancel, handler:nil)
                
                
                check.addAction(okAction)
                
                presentViewController(check, animated: true, completion:nil)
                self.hideActivityIndicator()
            }
            if(txtpass1.text==""){
                let passwordcheck = UIAlertController(title: "Error", message: "Please eSnter Password ", preferredStyle: .Alert)
                let cancelAction = UIAlertAction(title: "Ok", style: .Cancel, handler:nil)
                
                
                
                
                passwordcheck.addAction(cancelAction)
                
                
                presentViewController(passwordcheck, animated: true, completion:nil)
                self.hideActivityIndicator()
            }
            else if((pass?.containsString(" ")) == true)
            {
                let passwordcheck = UIAlertController(title: "Error", message: " Whitespace not allowed in Password", preferredStyle: .Alert)
                let cancelAction = UIAlertAction(title: "Ok", style: .Cancel, handler:nil)
                
                
                
                
                passwordcheck.addAction(cancelAction)
                
                
                presentViewController(passwordcheck, animated: true, completion:nil)
                self.hideActivityIndicator()
            }
                
            else if( !((txtpass1.text?.characters.count)! >= 6) || !((txtpass1.text?.characters.count)! <= 10) )
            {
                let passwordcheck = UIAlertController(title: "Error", message: " Password Must be  Range 6-10 Characters", preferredStyle: .Alert)
                let cancelAction = UIAlertAction(title: "Ok", style: .Cancel, handler:nil)
                
                
                
                
                passwordcheck.addAction(cancelAction)
                
                
                presentViewController(passwordcheck, animated: true, completion:nil)
                self.hideActivityIndicator()
            }
            
            if(txtconfpass.text==""){ let passwordcheck = UIAlertController(title: "Error", message: " Please enter 'Confirm Password'", preferredStyle: .Alert)
                let cancelAction = UIAlertAction(title: "Ok", style: .Cancel, handler:nil)
                
                
                
                
                passwordcheck.addAction(cancelAction)
                
                presentViewController(passwordcheck, animated: true, completion:nil)
                self.hideActivityIndicator()}
            if( !((txtconfpass.text?.characters.count)! >= 6) || !((txtconfpass.text?.characters.count)! <= 10) )
            {
                let passwordcheck = UIAlertController(title: "Error", message: " Password Mismatch", preferredStyle: .Alert)
                let cancelAction = UIAlertAction(title: "Ok", style: .Cancel, handler:nil)
                
                
                
                
                passwordcheck.addAction(cancelAction)
                
                presentViewController(passwordcheck, animated: true, completion:nil)
                self.hideActivityIndicator()
            }
                
                
            else{
                
                if( txtpass1.text != txtconfpass.text)
                {
                    if(txtconfpass.text=="" || !((txtpass1.text?.characters.count)! >= 6) || !((txtpass1.text?.characters.count)! <= 10))
                    {
                        let passwordcheck = UIAlertController(title: "Mismatch Password", message: "Please enter 'Confirm Password'", preferredStyle: .Alert)
                        let cancelAction = UIAlertAction(title: "Ok", style: .Cancel, handler:nil)
                        
                        
                        
                        passwordcheck.addAction(cancelAction)
                        
                        
                        presentViewController(passwordcheck, animated: true, completion: {  })
                        self.hideActivityIndicator()
                    }
                    else if(txtpass1.text != txtconfpass.text)
                    {
                        let passwordcheck = UIAlertController(title: "Mismatch Password", message: "Password does not match", preferredStyle: .Alert)
                        let cancelAction = UIAlertAction(title: "Ok", style: .Cancel, handler:nil)
                        
                        
                        
                        passwordcheck.addAction(cancelAction)
                        
                        
                        presentViewController(passwordcheck, animated: true, completion: {  })
                        self.hideActivityIndicator()
                    }
                    else if( txtconfpass.text != txtpass1.text)
                        
                    {
                        let passwordcheck = UIAlertController(title: "Missmatch Password", message: "Password does not match", preferredStyle: .Alert)
                        let cancelAction = UIAlertAction(title: "Ok", style: .Cancel, handler:nil)
                        
                        
                        
                        passwordcheck.addAction(cancelAction)
                        
                        
                        presentViewController(passwordcheck, animated: true, completion: {  })
                        self.hideActivityIndicator()
                    }
                }
                
            }
            
            if (!isValidEmail(txtemailid.text!)) {
                
                
                let emailBtn = UIAlertController(title: "Verify Email", message: "Invalid Email", preferredStyle: .Alert )
                let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler:nil)
                
                let okAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
                
                
                emailBtn.addAction(cancelAction)
                emailBtn.addAction(okAction)
                
                
                presentViewController(emailBtn, animated: true, completion: {  })
                self.hideActivityIndicator()
            }
            if(txtmagic.text=="")
            {
                let passwordcheck = UIAlertController(title: "Magic word", message: "Please enter Magic  Word ", preferredStyle: .Alert)
                let cancelAction = UIAlertAction(title: "Ok", style: .Cancel, handler:nil)
                
                
                
                passwordcheck.addAction(cancelAction)
                
                
                presentViewController(passwordcheck, animated: true, completion: {  })
                self.hideActivityIndicator()
            }
            
            
            if( txtconfpass.text != txtpass1.text)
                
            {
                let passwordcheck = UIAlertController(title: "Mismatch Password", message: "Password does not match", preferredStyle: .Alert)
                let cancelAction = UIAlertAction(title: "Ok", style: .Cancel, handler:nil)
                
                
                
                passwordcheck.addAction(cancelAction)
                
                
                presentViewController(passwordcheck, animated: true, completion: {  })
                self.hideActivityIndicator()
            }
            
             self.hideActivityIndicator()
            
        }
        else
        {
            
            
            if((txtfirstname.text?.characters.count)! > 20 || (fnm?.containsNumbers())!)
            {
                let check = UIAlertController(title: "Error", message: "Please enter First Name", preferredStyle: .Alert )
                let okAction = UIAlertAction(title: "Ok", style: .Cancel, handler:nil)
                
                
                check.addAction(okAction)
                
                presentViewController(check, animated: true, completion:nil)            }
            else
            {
                let fn=txtfirstname.text
                
                let  n=fn?.characters.count
                if(n! > 20 )
                {
                    let check = UIAlertController(title: "Error", message: "Please enter Name with max 20 Characters", preferredStyle: .Alert )
                    let okAction = UIAlertAction(title: "Ok", style: .Cancel, handler:nil)
                    
                    
                    check.addAction(okAction)
                    
                    presentViewController(check, animated: true, completion:nil)                }
                self.hideActivityIndicator()
            }
            
            if( (txtlastname.text?.characters.count)! > 20 || (lnm?.containsNumbers())!)
            {
                let check = UIAlertController(title: "Error", message: "Please enter Last Name", preferredStyle: .Alert )
                let okAction = UIAlertAction(title: "Ok", style: .Cancel, handler:nil)
                
                
                check.addAction(okAction)
                
                presentViewController(check, animated: true, completion:nil)
                self.hideActivityIndicator()
            }
            else if((txtlastname.text?.characters.count)! > 20){
                let check = UIAlertController(title: "Error", message: "Please enter Last Name of 10 charecters", preferredStyle: .Alert )
                let okAction = UIAlertAction(title: "Ok", style: .Cancel, handler:nil)
                
                
                check.addAction(okAction)
                
                presentViewController(check, animated: true, completion:nil)
                self.hideActivityIndicator()
            }
            
            
            
            if( (txtaddress.text?.characters.count)! > 20)
            {
                let check = UIAlertController(title: "Error", message: "Please enter Address", preferredStyle: .Alert )
                let okAction = UIAlertAction(title: "Ok", style: .Cancel, handler:nil)
                
                
                check.addAction(okAction)
                
                presentViewController(check, animated: true, completion:nil)
                self.hideActivityIndicator()
            }
            else
            {
                let fn=txtaddress.text
                
                let  n=fn?.characters.count
                if(n! > 50)
                {
                    let check = UIAlertController(title: "Error", message: "Address  have maximum 50 Characters", preferredStyle: .Alert )
                    let okAction = UIAlertAction(title: "Ok", style: .Cancel, handler:nil)
                    
                    
                    check.addAction(okAction)
                    
                    presentViewController(check, animated: true, completion:nil)
                    self.hideActivityIndicator()}
                
            }
            
            if( (txtmobile.text?.characters.count)! < 10 || (txtmobile.text?.characters.count)! > 10 || !((mb?.containsNumbers())!) ||  (mb?.containsCharacters())!)
            {
                let check = UIAlertController(title: "Error", message: "Please enter Mobile Number with 10 digit", preferredStyle: .Alert )
                let okAction = UIAlertAction(title: "Ok", style: .Cancel, handler:nil)
                
                
                check.addAction(okAction)
                
                presentViewController(check, animated: true, completion:nil)
                self.hideActivityIndicator()
            }
            if(!((txtuserid.text?.characters.count)! >= 6) || !((txtuserid.text?.characters.count)! <= 10))
            {
                let check = UIAlertController(title: "Error ", message: "  User Id Must be Range of 6-10 Character length", preferredStyle: .Alert )
                let okAction = UIAlertAction(title: "Ok", style: .Cancel, handler:nil)
                
                
                check.addAction(okAction)
                
                presentViewController(check, animated: true, completion:nil)
                self.hideActivityIndicator()
            }
            
            
            if( !((txtpass1.text?.characters.count)! >= 6) || !((txtpass1.text?.characters.count)! <= 10) )
            {
                let passwordcheck = UIAlertController(title: "Error", message: " Password Must be  Range 6-10 Character", preferredStyle: .Alert)
                let cancelAction = UIAlertAction(title: "Ok", style: .Cancel, handler:nil)
                
                
                
                
                passwordcheck.addAction(cancelAction)
                
                
                presentViewController(passwordcheck, animated: true, completion:nil)
                self.hideActivityIndicator()
            }
            
            if( !((txtconfpass.text?.characters.count)! >= 6) || !((txtconfpass.text?.characters.count)! <= 10) )
            {
                let passwordcheck = UIAlertController(title: "Error", message: "Mismatch Password", preferredStyle: .Alert)
                let cancelAction = UIAlertAction(title: "Ok", style: .Cancel, handler:nil)
                
                
                
                
                passwordcheck.addAction(cancelAction)
                
                presentViewController(passwordcheck, animated: true, completion:nil)
                self.hideActivityIndicator()}
                
                
            else{
                
                if( txtpass1.text != txtconfpass.text)
                {
                    if(txtconfpass.text=="" || !((txtpass1.text?.characters.count)! >= 6) || !((txtpass1.text?.characters.count)! <= 10))
                    {
                        let passwordcheck = UIAlertController(title: "Mismatch Password", message: "Please enter 'Confirm Password'", preferredStyle: .Alert)
                        let cancelAction = UIAlertAction(title: "Ok", style: .Cancel, handler:nil)
                        
                        
                        
                        passwordcheck.addAction(cancelAction)
                        
                        
                        presentViewController(passwordcheck, animated: true, completion: {  })
                        self.hideActivityIndicator()
                    }
                    else if(txtpass1.text != txtconfpass.text)
                    {
                        let passwordcheck = UIAlertController(title: "Mismatch Password", message: "Password does not match", preferredStyle: .Alert)
                        let cancelAction = UIAlertAction(title: "Ok", style: .Cancel, handler:nil)
                        
                        
                        
                        passwordcheck.addAction(cancelAction)
                        
                        
                        presentViewController(passwordcheck, animated: true, completion: {  })
                        self.hideActivityIndicator()
                    }
                    else if( txtconfpass.text != txtpass1.text)
                        
                    {
                        let passwordcheck = UIAlertController(title: "Mismatch Password", message: "Password does not match", preferredStyle: .Alert)
                        let cancelAction = UIAlertAction(title: "Ok", style: .Cancel, handler:nil)
                        
                        
                        
                        passwordcheck.addAction(cancelAction)
                        
                        
                        presentViewController(passwordcheck, animated: true, completion: {  })
                        self.hideActivityIndicator()
                        
                    }
                }
                
            }
            
            if (!isValidEmail(txtemailid.text!)) {
                
                
                let emailBtn = UIAlertController(title: "Verify Email", message: "Invalid Email", preferredStyle: .Alert )
                let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler:nil)
                
                let okAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
                
                
                emailBtn.addAction(cancelAction)
                emailBtn.addAction(okAction)
                
                
                presentViewController(emailBtn, animated: true, completion: {  })
                self.hideActivityIndicator()
                
            }
            
            if( txtconfpass.text != txtpass1.text)
                
            {
                let passwordcheck = UIAlertController(title: "Mismatch Password", message: " Password does not match", preferredStyle: .Alert)
                let cancelAction = UIAlertAction(title: "Ok", style: .Cancel, handler:nil)
                
                
                
                passwordcheck.addAction(cancelAction)
                
                
                presentViewController(passwordcheck, animated: true, completion: {  })
                self.hideActivityIndicator()
                
            }
            
            downloadregister(){}
            
            
            
        }
        
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewDidAppear(animated: Bool) {
   // navigationController?.setToolbarHidden(false, animated: false)
        tabBarController?.hidesBottomBarWhenPushed=true
    }

    override func viewWillAppear(animated: Bool) {
       navigationController?.navigationBarHidden=false
        tabBarController?.hidesBottomBarWhenPushed=true
     

    }
   
    @IBAction func btnfemaleclick(sender: AnyObject) {
        if(btnradiofemale.currentImage == im1)
        {
            btnradiomale.setImage(image,forState:UIControlState.Normal)
            
            btnradiofemale.setImage(image, forState:UIControlState.Normal)
            
        }
        else
        {
            btnradiofemale.setImage(im1, forState:UIControlState.Normal)
            if(btnradiofemale.currentImage==im1)
            {
                btnradiomale.setImage(image, forState:UIControlState.Normal)
            }
            
        }
        btnradiomale.setTitle("Female", forState: UIControlState.Normal)
     
    }
    @IBAction func btnmaleclick(sender: AnyObject) {
        if(btnradiomale.currentImage == im1)
        {
            var m:String="Male"
            btnradiofemale.setImage(image, forState:UIControlState.Normal)
            btnradiomale.setImage(image, forState:UIControlState.Normal)
        }
        else
        {
            btnradiomale.setImage(im1, forState:UIControlState.Normal)
            if(btnradiofemale.currentImage==im1)
            {
                btnradiofemale.setImage(image, forState:UIControlState.Normal)
            }
        }
        btnradiomale.setTitle("Male", forState:UIControlState.Normal)
        
        
    }
    @IBOutlet weak var btnradiomale: UIButton!

    func downloadregister(completed:  DownloadComplete){
        
        let m = BASE_URL + "registerUser"
        
        showActivityIndicator()
        let base_url = NSURL(string: m )!
        print(base_url)
        var m0:String = txtfirstname.text!
        let lnm:String=txtlastname.text!
        var add:String=txtaddress.text!
        let mb:String=txtmobile.text!
        let mail:String=txtemailid.text!
        var magic:String=txtmagic.text!
        let pass1:String = txtpass1.text!
        let userid:String = txtuserid.text!
        
        let dob = datepicker.date
  
        let d1 = dob
        
        datepicker.datePickerMode = UIDatePickerMode.Date
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy"
        let selectedDate = dateFormatter.stringFromDate(datepicker.date)
        print(selectedDate)
        
        print("////////////\(dob)")
             var g :String="female"
        if(btnradiofemale.currentImage==im1){
            
            g="female"
        }
        else{
            g="male"
            
            
        }
        
        
        if(txtuserid.text?.contains(" ")==true)
        {
            let passwordcheck = UIAlertController(title: "Error", message: " Whitespace not allow in UserId", preferredStyle: .Alert)
            let cancelAction = UIAlertAction(title: "Ok", style: .Cancel, handler:nil)
            
            
            
            
            passwordcheck.addAction(cancelAction)
            
            
            presentViewController(passwordcheck, animated: true, completion:nil)
            
        }
        if(txtpass1.text?.contains(" ")==true){
            let passwordcheck = UIAlertController(title: "Error", message: " Whitespace not allowed in Password", preferredStyle: .Alert)
            let cancelAction = UIAlertAction(title: "Ok", style: .Cancel, handler:nil)
            
            
            
            
            passwordcheck.addAction(cancelAction)
            
            
            presentViewController(passwordcheck, animated: true, completion:nil)
        }
                let parameters=["firstName":m0,"lastName":lnm,"emailId"
            :mail,"dateofBirth":selectedDate,"phoneNo":mb,"loginId":userid,"password":pass1,"magicWord":magic,"gender":g,
            "thumbnailUrl":strBase64]
        Alamofire.request(.POST,base_url,parameters:parameters).responseString{ response in
            
            self.hideActivityIndicator()
            print(response)
            
            let result=response.result
            print("=======\(result.value)")
            
            let rs:String=result.value as String!
            print("////////\(rs)")
            if(response.response?.statusCode==406)
            {
                let register = UIAlertController(title: "Registration Failed..!!", message: "UserName already registered.. ", preferredStyle: .Alert)
                let cancelAction = UIAlertAction(title: "Ok", style: .Default, handler:{action in self.txtuserid.text=""})
                
                
                
                register.addAction(cancelAction)
                
                self.presentViewController(register, animated: true, completion: {  })
                
                
                
                
            }
            
            if (rs == "true")
            {
                
                
                let register = UIAlertController(title: "Registration Successful!", message: "Congratulations, You have registered Successfully...!! ", preferredStyle: .Alert)
                let cancelAction = UIAlertAction(title: "Ok", style: .Default, handler:{
                    action in self.performSegueWithIdentifier("Squeregister", sender: self)
                    
                    
                })
                
                register.addAction(cancelAction)
                self.presentViewController(register, animated: true, completion:nil)
                
            }
                
            else{
                
                
                
                
                
                
                let register = UIAlertController(title: "Registration Failed..!!", message: "Registration Failed Please try again! ", preferredStyle: .Alert)
                let cancelAction = UIAlertAction(title: "Ok", style: .Cancel, handler:nil)
                
                
                
                register.addAction(cancelAction)
                
                self.presentViewController(register, animated: true, completion: {  })
                
                
            }
            
            self.hideActivityIndicator()
            
            completed()
        }
        
    }
    func isValidEmail(testStr:String) -> Bool {
        
        
        print("validate emilId: \(testStr)")
        let emailRegEx = "^(?:(?:(?:(?: )*(?:(?:(?:\\t| )*\\r\\n)?(?:\\t| )+))+(?: )*)|(?: )+)?(?:(?:(?:[-A-Za-z0-9!#$%&’*+/=?^_'{|}~]+(?:\\.[-A-Za-z0-9!#$%&’*+/=?^_'{|}~]+)*)|(?:\"(?:(?:(?:(?: )*(?:(?:[!#-Z^-~]|\\[|\\])|(?:\\\\(?:\\t|[ -~]))))+(?: )*)|(?: )+)\"))(?:@)(?:(?:(?:[A-Za-z0-9](?:[-A-Za-z0-9]{0,61}[A-Za-z0-9])?)(?:\\.[A-Za-z0-9](?:[-A-Za-z0-9]{0,61}[A-Za-z0-9])?)*)|(?:\\[(?:(?:(?:(?:(?:[0-9]|(?:[1-9][0-9])|(?:1[0-9][0-9])|(?:2[0-4][0-9])|(?:25[0-5]))\\.){3}(?:[0-9]|(?:[1-9][0-9])|(?:1[0-9][0-9])|(?:2[0-4][0-9])|(?:25[0-5]))))|(?:(?:(?: )*[!-Z^-~])*(?: )*)|(?:[Vv][0-9A-Fa-f]+\\.[-A-Za-z0-9._~!$&'()*+,;=:]+))\\])))(?:(?:(?:(?: )*(?:(?:(?:\\t| )*\\r\\n)?(?:\\t| )+))+(?: )*)|(?: )+)?$"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
               let result = emailTest.evaluateWithObject(testStr)
        return result
    }

    @IBOutlet weak var img: UIImageView!

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
    


   @IBAction func selectimage(sender: AnyObject) {
        let mypicker=UIImagePickerController()
        mypicker.delegate = self
        mypicker.sourceType =
           UIImagePickerControllerSourceType.PhotoLibrary
        self.presentViewController(mypicker, animated: true, completion: nil)
        
    }
   
   func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
        let profilepic:UIImage = (info[UIImagePickerControllerOriginalImage] as? UIImage)!
      logoimage.image = (info[UIImagePickerControllerOriginalImage] as? UIImage)!
        self.dismissViewControllerAnimated(true, completion: nil)
        
    let image : UIImage = profilepic
    //Now use image to create into NSData format
    let imageData:NSData = UIImagePNGRepresentation(image)! as NSData
    strBase64 = imageData.base64EncodedStringWithOptions(NSDataBase64EncodingOptions(rawValue: 0))        
    }


    func hideActivityIndicator() {
        dispatch_async(dispatch_get_main_queue()) {
            self.spinner.stopAnimating()
            self.loadingView.removeFromSuperview()
        }
        


}

}
extension String
{
    func containsNumbers() -> Bool
    {
        let numberRegEx  = ".*[0-9]+.*"
        let testCase     = NSPredicate(format:"SELF MATCHES %@", numberRegEx)
        return testCase.evaluateWithObject(self)
            }
}

extension String
{
    func containsCharacters() -> Bool
    {
        let numberRegEx  = ".*[a-zA-Z]+.*"
        let testCase     = NSPredicate(format:"SELF MATCHES %@", numberRegEx)
        return testCase.evaluateWithObject(self)

    }
}

extension String
{
    func containsNumberCharacters() -> Bool
    {
        let numberRegEx  = ".*[0-9a-zA-Z]+.*"
        let testCase     = NSPredicate(format:"SELF MATCHES %@", numberRegEx)
        return testCase.evaluateWithObject(self)

    }
}
extension UITextField {
    //@discardableResult
    func textIsContained( target: String) -> Bool {
        // Precondition
        guard let text = self.text else { return false }
        
        let isContained = target.containsString(text)
        if isContained { print("\(target) contains \(text)") }
        return isContained
    }
}
extension String {
    
    func contains(find: String) -> Bool{
        return self.rangeOfString(find) != nil
    }
    
    func containsIgnoringCase(find: String) -> Bool{
        return self.rangeOfString(find, options: NSStringCompareOptions.CaseInsensitiveSearch) != nil
    }
}

//
//  ProfileVC.swift
//  SurveyApp
//
//  Created by Mac on 17/12/16.
//  Copyright © 2016 Realizer Tech. All rights reserved.
//



import UIKit
import Alamofire
class ProfileVC: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate,UITextFieldDelegate  {
    @IBOutlet weak var lblphone: UILabel!
    @IBOutlet var mainview: UIView!
    private var _userId:String!
    private var _firstName:String!
    @IBOutlet weak var lblname: UILabel!
    private var _lastName:String!
    @IBOutlet weak var lbldtbth: UILabel!
    private var _emailId:String!
    @IBOutlet weak var lblemailid: UILabel!
    private var _dateofBirth:String!
    private var _phoneNo:String!
    private var _loginId:String!
    private var _password:String!
    private var _magicWord:String!
    private var _deviceId1:String!
    private var _registrationId1:String!
    private var _deviceId2:String!
    private var _registrationId2:String!
    private var _deviceId3:String!
    private var _registrationId3:String!
    private var _createTS:String!
    private var _isActive:Bool!
    private var _gender:String!
    private var _thumbnailUrl:String!
    
    @IBOutlet weak var menu: UIBarButtonItem!
    var uinitial:String=NSUserDefaults.standardUserDefaults().valueForKey("UserInitials") as! String
    var username:String=NSUserDefaults.standardUserDefaults().valueForKey( "UserName") as! String
    var Mbno:String=NSUserDefaults.standardUserDefaults().valueForKey("ContactNo") as! String
    var Email:String=NSUserDefaults.standardUserDefaults().valueForKey("Email") as! String
    var Dob:String=NSUserDefaults.standardUserDefaults().valueForKey("Dob") as! String
    var thumbnail:String=NSUserDefaults.standardUserDefaults().valueForKey("UserPic") as! String
    let img0=UIImage(named: "graybg.jpg")
    var userId : String{
        get {
            return _userId
            
        }
        set
        {
            _userId = newValue
        }
    }
    
    var firstName:String
        {
        get{
            return _firstName
        }
        set{
            _firstName=newValue
        }
        
        
    }
    var lastName:String
        {
        get{
            return _lastName
        }
        set{
            _lastName=newValue
        }
        
        
    }
    var emailId:String
        {
        get{
            return _emailId
        }
        set{
            _emailId=newValue
        }
        
        
    }
    
    var dateofBirth:String
        {
        get{
            return _dateofBirth
        }
        set{
            _dateofBirth=newValue
        }
        
        
    }
    var phoneNo:String
        {
        get{
            return _phoneNo
        }
        set{
            _phoneNo=newValue
        }
        
        
    }
    var loginId:String{
        get {
            return _loginId
        }
        set{
            _loginId=newValue
        }
    }
    var password:String{
        get {
            return _password
        }
        set{
            _password=newValue
        }
    }
    
    var magicWord:String{
        get {
            return _magicWord
        }
        set{
            _magicWord=newValue
        }
    }
    
    var deviceId1:String{
        get {
            return _deviceId1
        }
        set{
            _deviceId1=newValue
        }
    }
    
    var registrationId1:String{
        get {
            return _registrationId1
        }
        set{
            _registrationId1=newValue
        }
    }
    
    var deviceId2:String{
        get {
            return _deviceId2
        }
        set{
            _deviceId2=newValue
        }
    }
    
    var registrationId2:String{
        get {
            return _registrationId2
        }
        set{
            _registrationId2=newValue
        }
    }
    var deviceId3:String{
        get {
            return _deviceId3
        }
        set{
            _deviceId3=newValue
        }
    }
    var registrationId3:String{
        get {
            return _registrationId3
        }
        set{
            _registrationId3=newValue
        }
    }
    var createTS:String{
        get {
            return _createTS
        }
        set{
            _createTS=newValue
        }
    }
    var isActive:Bool{
        return _isActive
    }
    var gender:String{
        get {
            return _gender
        }
        set{
            _gender=newValue
        }
    }
    var thumbnailUrl:String{
        get {
            return _thumbnailUrl
        }
        set{
            _thumbnailUrl=newValue
        }
    }
    
    @IBOutlet weak var imglogo: UIButton!
    override func viewWillAppear(animated: Bool) {
        
        self.navigationController?.navigationBar.barStyle=UIBarStyle.Default
          }
    override func viewDidLoad() {
        super.viewDidLoad()
        
         let formatter=NSDateFormatter()
        formatter.dateFormat="MMM dd,yyyy"
             let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss,"
        let d:String=Dob
        let date = dateFormatter.dateFromString(d)
        
        
        let d1:String=formatter.stringFromDate(date!)
        
        
        let stringA = formattedDateFromString(d1, withFormat: "yyyy-MM-dd")
        let stringB = formattedDateFromString(d1, withFormat: "MMM dd, yyyy")
        
        NSLog("stringA: \(stringA)") // 2016-07-21
        NSLog("stringB: \(stringB)")
        lblname.text=username
        lbldtbth.text=d1
        lblemailid.text=Email
        lblphone.text=Mbno
        
        let v=username
        let stArr = v.componentsSeparatedByString(" ")
        
        var st=""
        for s in stArr{
            if let      str=s.characters.first{
                st+=String(str).capitalizedString
            }
        }
        
        
        
        if(thumbnail.isEmpty)
       {
            
            
           let img = ImageToText()
            let tempimg = img.textToImage(st as NSString, inImage: img0!, atPoint: CGPoint(x: 20.0, y: 20.0))
            self.imagebutton.layer.borderColor =
           UIColor.grayColor().CGColor
            self.imagebutton.layer.cornerRadius = 40.0
            self.imagebutton.layer.masksToBounds = true
            self.imagebutton.setImage(tempimg, forState: UIControlState.Normal)
        
            
            
        }
        else{
            
            
            let imagedownload = DownloadImage()
            
            let profileimage = imagedownload.userImage(thumbnail)
            
            
            self.imagebutton.layer.cornerRadius = 40.0
            self.imagebutton.layer.masksToBounds = true
            self.imagebutton.setImage(profileimage, forState: UIControlState.Normal)
            
            
            imagebutton.setImage(profileimage, forState: UIControlState.Normal)
       }
        

        
        
    print("-----------\(Email)-----\(Mbno)")
    
    
    }
    
    func formattedDateFromString(dateString: String, withFormat format: String) -> String? {
        
        let inputFormatter = NSDateFormatter()
        inputFormatter.dateFormat = "dd/MM/yyyy"
        
        if let date = inputFormatter.dateFromString(dateString) {
            
            let outputFormatter = NSDateFormatter()
            outputFormatter.dateFormat = format
            
            return outputFormatter.stringFromDate(date)
        }
        
        return nil
    }
    
    @IBOutlet weak var imagebutton: UIButton!
    @IBAction func clickmenu(sender: AnyObject) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
        performSegueWithIdentifier("backtolist", sender: nil)
    }
    
    @IBAction func picclick(sender: AnyObject) {
        let mypicker=UIImagePickerController()
        mypicker.delegate=self
        mypicker.sourceType=UIImagePickerControllerSourceType.PhotoLibrary
       
       
        self.presentViewController(mypicker, animated: true, completion: nil)
    } 
    
        func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
            let profilepic:UIImage = (info[UIImagePickerControllerOriginalImage] as? UIImage)!
           
             self.dismissViewControllerAnimated(true, completion: nil)
            imagebutton.setImage(profilepic, forState:UIControlState.Normal)
           let image : UIImage = profilepic
            let uid = NSUserDefaults.standardUserDefaults().valueForKey("UserId") as! String
          
            let m = BASE_URL + "UpdateProfilePicture/\(uid)"
           
       
            let parameters=["base64Pic":profilepic]
                        Alamofire.request(.POST,m,parameters:parameters).responseJSON{ response in
                let result = response.result
                print(result)
                if(result.isSuccess)
                {
                let register = UIAlertController(title: "Upload Photo!!", message: "Profile Photo Upload Sucessfully ", preferredStyle: .Alert)
                let cancelAction = UIAlertAction(title: "Ok", style: .Default, handler:nil)
                
                
                
                register.addAction(cancelAction)
                
                self.presentViewController(register, animated: true, completion: {  })
                
                }
                else
                {
                    let register = UIAlertController(title: "Error", message: "Profile Photo Upload Failed", preferredStyle: .Alert)
                    let cancelAction = UIAlertAction(title: "Ok", style: .Default, handler:nil)
                    
                    
                    
                    register.addAction(cancelAction)
                    
                    self.presentViewController(register, animated: true, completion: {  })
                    

                }
                
                
            }
          let imageData:NSData = UIImagePNGRepresentation(image)! as NSData
            
    }
    
          
    
    }
    
    



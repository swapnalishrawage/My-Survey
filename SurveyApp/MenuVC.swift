        //
//  MenuVC.swift
//  SurveyApp
//
//  Created by Mac on 16/12/16.
//  Copyright © 2016 Realizer Tech. All rights reserved.
//


import UIKit
import Alamofire

import AlamofireImage
class  MenuVC : UIViewController,UITableViewDelegate,UITableViewDataSource {
    var MenuArr=[Menu]()
  
    

    @IBOutlet weak var menuview: UITableView!
    
    @IBOutlet weak var lblusername: UILabel!
    @IBOutlet weak var profileimgview: UIImageView!
    let im1=UIImage(named: "userprofile-1.png")
    let image = UIImage(named: "changepass.png")
  let image1 = UIImage(named: "logout-1.png")
      let image2 = UIImage(named: "info.png")
    
    let image3=UIImage(named: "surveyreport.png")
      let image4=UIImage(named: "survey-1.png")
    
    let img0=UIImage(named: "graybg.jpg")
     var spinner = UIActivityIndicatorView(activityIndicatorStyle: .WhiteLarge)
    var loadingView: UIView = UIView()
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
    
        let m1=Menu(menulabel: "Profile", menuimage: im1!)
        let m2=Menu(menulabel: "Change Password", menuimage:image!)
        let m4=Menu(menulabel: "About Us", menuimage: image2!)
      
        let m3 = Menu(menulabel: "Logout", menuimage: image1!)
        let m5=Menu(menulabel: "Survey Report", menuimage: image3!)
            let m6=Menu(menulabel: "Survey", menuimage: image4!)
        MenuArr.append(m1)
        MenuArr.append(m5)
        MenuArr.append(m6)
        MenuArr.append(m2)
        MenuArr.append(m4)
        MenuArr.append(m3)
        
        let imagedownload = DownloadImage()
       
        lblusername.text=NSUserDefaults.standardUserDefaults().valueForKey("UserName") as! String
         let imageurl:String = NSUserDefaults.standardUserDefaults().valueForKey("UserPic") as! String
        var imageurl1:String=imageurl
        print(imageurl1)
        let v=lblusername.text
        
        let stArr = v?.componentsSeparatedByString(" ")
  
        var st=""
        for s in stArr!{
            if let      str=s.characters.first{
                st+=String(str).capitalizedString
            }
        }
        
        print(st)
        
        var profileimage:UIImage!
        
               if(imageurl1.isEmpty)
        {
            let img = ImageToText()
            profileimage=img.textToImage(st as NSString, inImage:img0!, atPoint: CGPoint(x: 20.0, y: 20.0))
            profileimgview.layer.cornerRadius=40
            
            
            profileimgview.layer.masksToBounds = true

            
        }
              
        else{
            
            profileimage = imagedownload.userImage(imageurl)
          
            if(profileimage == nil)
            {
                let img = ImageToText()
                profileimage = img.textToImage(st as NSString, inImage: img0!, atPoint: CGPoint(x: 20.0, y: 20.0))
                profileimgview.layer.cornerRadius=40
            
                profileimgview.layer.masksToBounds = true
                
            }
        }
        
        lblusername.text=NSUserDefaults.standardUserDefaults().valueForKey("UserName") as! String
        
        self.profileimgview.image = profileimage
        
      self.menuview.dataSource=self
        self.menuview.delegate=self
        
        
        
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if let cell=tableView.dequeueReusableCellWithIdentifier( "MenuTableCell", forIndexPath: indexPath) as? MenuTableCell
            
        {
            let menu=MenuArr[indexPath.row]
            
            cell.updateCell(menu.menulabel, menuimage: menu.menuimage)
            return cell
            
        }
            
        else{
            
            return UITableViewCell()
            
        }
        
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MenuArr.count
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        
        let rows = tableView.indexPathsForSelectedRows.map{$0.map{$0.row}}
        
        let revealviewcontroller:SWRevealViewController=self.revealViewController()
        let cell:MenuTableCell=tableView.cellForRowAtIndexPath(indexPath) as! MenuTableCell//tableView.cellForRow(at: indexPath) as! MenuTableCell
        
        if(cell.menu.text=="Survey Report"){
            
            let mainstorybord:UIStoryboard=UIStoryboard(name: "Main", bundle: nil)
            let des=mainstorybord.instantiateViewControllerWithIdentifier("SurveyListVC") as! SurveyListVC
            let frontview=UINavigationController.init(rootViewController:des)
                NSUserDefaults.standardUserDefaults().setObject("1", forKey: "getby")
            revealViewController().pushFrontViewController(frontview, animated:true)
        }
        if(cell.menu.text=="Survey"){
            
            let mainstorybord:UIStoryboard=UIStoryboard(name: "Main", bundle: nil)
            let des=mainstorybord.instantiateViewControllerWithIdentifier("SurveyListVC") as! SurveyListVC
            let frontview=UINavigationController.init(rootViewController:des)
            NSUserDefaults.standardUserDefaults().setObject("2", forKey: "getby")
            revealViewController().pushFrontViewController(frontview, animated:true)
        }
        if(cell.menu.text=="Profile"){
            
            let mainstorybord:UIStoryboard=UIStoryboard(name: "Main", bundle: nil)
            let des=mainstorybord.instantiateViewControllerWithIdentifier("ProfileVC") as! ProfileVC
            let frontview=UINavigationController.init(rootViewController:des)
           
            revealViewController().pushFrontViewController(frontview, animated:true)
        }
        if(cell.menu.text=="Change Password"){
            
          
              performSegueWithIdentifier("squechangepass", sender: nil)
        }
        if(cell.menu.text=="About Us"){
            
            self.dismissViewControllerAnimated(true, completion: nil)
            performSegueWithIdentifier("sgueAboutus", sender: nil)
            

           
        }
        if(cell.menu.text=="Logout"){
            
            let appDomain = NSBundle.mainBundle().bundleIdentifier
            NSUserDefaults.standardUserDefaults().removePersistentDomainForName(appDomain!)
                          print("session end")

            let mainstorybord:UIStoryboard=UIStoryboard(name: "Main", bundle: nil)
            let des=mainstorybord.instantiateViewControllerWithIdentifier("LoginVC") as! LoginVC
            let frontview=UINavigationController.init(rootViewController:des)
            
            revealViewController().pushFrontViewController(frontview, animated:true)
        }


        
    }

       
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
    
    
}

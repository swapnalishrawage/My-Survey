//
//  ForgotPasswordPopupVC.swift
//  SurveyApp
//
//  Created by Mac on 16/12/16.
//  Copyright © 2016 Realizer Tech. All rights reserved.
//


import UIKit

class ForgotPasswordPopupVC: UIViewController {
    
    @IBOutlet weak var PwdRecoveryPanel: UIView!
    @IBOutlet weak var FWbtnsubmit: UIButton!
    
    @IBOutlet weak var FWradiomagic: UIButton!
    
    @IBOutlet weak var FWradioEmail: UIButton!
    let im1=UIImage(named: "check.png")
    let image = UIImage(named: "uncheck.png")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.layoutIfNeeded()
        PwdRecoveryPanel.layer.borderColor=UIColor.blackColor().CGColor
        PwdRecoveryPanel.layer.borderWidth=1
        FWradioEmail.setImage(im1, forState: UIControlState.Normal)
        // self.view.alpha=0.3
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func FWradiomagicClick(sender: AnyObject) {
        
        if(FWradiomagic.currentImage ==  im1)
        {
            FWradioEmail.setImage( image, forState:UIControlState.Normal)
            FWradiomagic.setImage(image, forState:UIControlState.Normal)
        }
        else
        {
            FWradiomagic.setImage( im1, forState:UIControlState.Normal)
            if(FWradioEmail.currentImage==im1)
            {
                FWradioEmail.setImage(image, forState:UIControlState.Normal)
            }
        }

    }
    
    
    
    @IBAction func FWradioEmailClick(sender: AnyObject) {
        if(FWradioEmail.currentImage == im1)
        {
            FWradiomagic.setImage(image,forState:UIControlState.Normal)
            
            FWradioEmail.setImage(image, forState:UIControlState.Normal)
            
        }
        else
        {
            FWradioEmail.setImage(im1, forState:UIControlState.Normal)
            if(FWradioEmail.currentImage==im1)
            {
                FWradiomagic.setImage(image, forState:UIControlState.Normal)
            }
            
        }

    }
    
    @IBAction func FWcancleclick(sender: AnyObject) {
        self.dismissViewControllerAnimated(false, completion: nil)
        
    }
    
    @IBAction func submitclick(sender: AnyObject) {
        if(FWradioEmail.currentImage==im1)
        {
            performSegueWithIdentifier("SgueVerifyMailVC", sender: nil)
            
            
        }
        else{
            performSegueWithIdentifier("SgueVerifyMagicVC", sender: nil)
       
        }

    }
   
    
}

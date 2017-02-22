//
//  AboutusVc.swift
//  SurveyApp
//
//  Created by Mac on 16/12/16.
//  Copyright © 2016 Realizer Tech. All rights reserved.
//

import UIKit

class AboutusVc: UIViewController {
    @IBOutlet weak var menu: UIBarButtonItem!

    @IBOutlet var mainview: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
            }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(animated: Bool) {
      //  self.navigationController?.navigationBar.barTintColor=UIColor(red:36/255,green:73/255,blue:210/255,alpha:1.0)
        
       // self.navigationController?.navigationBar.tintColor=UIColor.blueColor()
    }

    @IBAction func cancleclick(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}

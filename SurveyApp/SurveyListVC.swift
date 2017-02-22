   //navigationController?.navigationItem.title="Report"//
//  SurveyListVC.swift
//  SurveyApp
//
//  Created by Mac on 13/12/16.
//  Copyright © 2016 Realizer Tech. All rights reserved.
//

import UIKit
import Alamofire
class SurveyListVC: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet var mainview: UIView!
    @IBOutlet weak var menu: UIBarButtonItem!
    var spinner = UIActivityIndicatorView(activityIndicatorStyle: .WhiteLarge)
    var loadingView: UIView = UIView()
      var getbyid:String=NSUserDefaults.standardUserDefaults().valueForKey("getby") as! String
let backgroundImage = UIImage(named: "listgb.png")
   
    @IBOutlet weak var contentview: UIView!
    
    
 
    @IBOutlet weak var surveytableview: UITableView!
    var survey = [SurveyList]()
    override func viewDidLoad() {
        
        super.viewDidLoad()
            getbyid="2"
              let backgroundImage = UIImage(named: "listbg.png")
        let imageView = UIImageView(image: backgroundImage)
        self.surveytableview.backgroundView = imageView
        
        if(!survey.isEmpty)
        {
            survey.removeAll()
        }
        
        
        downloadSurveyList(){}
        
       
        
        
        
    }
   


    override func viewWillAppear(animated: Bool) {
        menu.target=self.revealViewController()
        menu.action=Selector(revealViewController().rightRevealToggleAnimated(true))
   
        mainview.addGestureRecognizer(revealViewController().panGestureRecognizer())
        
        navigationController?.navigationBarHidden=false
        self.navigationController?.navigationBar.barStyle=UIBarStyle.Default
     
               super.viewWillAppear(animated)
        let backgroundImage = UIImage(named: "listbg.png")
        let imageView = UIImageView(image: backgroundImage)
                          }


    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
      
        let t1 = survey[indexPath.row]
        
        
        NSUserDefaults.standardUserDefaults().setObject(t1.surveyname, forKey: "SurveyName")
        NSUserDefaults.standardUserDefaults().setObject(t1.surveydesc, forKey: "SurveyDesc")
     
        var ss=t1.surveystatus
               getbyid = NSUserDefaults.standardUserDefaults().valueForKey("getby") as! String
  
        if(ss=="Pending" ){
       
        if(getbyid == "2"){
            
        performSegueWithIdentifier("sguesurveydetail", sender: t1)
        }
        else if(getbyid == "1")
        {
            navigationItem.title="Report"
               navigationController?.navigationItem.title="Report"
            performSegueWithIdentifier("squereport", sender: t1)
           

        }
        }
        else if(ss=="Complete" && getbyid == "1")
        {
             navigationItem.title="Report"
           navigationController?.navigationItem.title="Report"
            performSegueWithIdentifier("squereport", sender: t1)
        

          
            
        }
        else if(ss=="Complete" && getbyid == "2")
        {
            let register = UIAlertController(title: "Survey", message: "You have already participated in this Survey !", preferredStyle: .Alert)
            let cancelAction = UIAlertAction(title: "Ok", style: .Cancel, handler:nil)
            
            
            
            register.addAction(cancelAction)
            
            self.presentViewController(register, animated: true, completion: {  })
            
            
        }
        else if(ss=="0" && getbyid == "1")
        {
        
             navigationItem.title="Report"
               navigationController?.navigationItem.title="Report"
                performSegueWithIdentifier("squereport", sender: t1)
            
        }
        else if(ss=="0" && getbyid == "2"){
            performSegueWithIdentifier("sguesurveydetail", sender: t1)

        }
       else
        {
            let register = UIAlertController(title: "Survey", message: "You have already participated in this Survey ! ", preferredStyle: .Alert)
            let cancelAction = UIAlertAction(title: "Ok", style: .Cancel, handler:nil)
            
            
            
            register.addAction(cancelAction)
            
            self.presentViewController(register, animated: true, completion: {  })
            

        }
        
        
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCellWithIdentifier("surveycell",forIndexPath: indexPath) as? surveycell{
            
            var surveydata = survey[indexPath.row]
            cell.updateUI(surveydata.surveyname, Desc: surveydata.surveydesc)
                      
            return cell
            
        }
        else
        {
            return UITableViewCell()
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return survey.count
    }
 

    func downloadSurveyList(completed: DownloadComplete){
        
        let uid = NSUserDefaults.standardUserDefaults().valueForKey("UserName")
        let userID=NSUserDefaults.standardUserDefaults().valueForKey("UserId")
        var UID:String=userID as! String
        let m = BASE_URL + "getServeyList/\(UID)"
        
        self.showActivityIndicator()
        let base_url = NSURL(string: m )!
    
        
        
        
        Alamofire.request(.GET,base_url).responseJSON{ response in
            
            let result = response.result
            
            
            
            if let dict = result.value  as?  [Dictionary<String,AnyObject>]
                
            {
                print("========\(dict)")
                for userdic in dict {
                    
                    var surveyName :String=""
                    
                    var surveryDesc: String=""
                    var surveyId:String=""
                    var SurveyStatus:String=""
                    
                    
                    if(!(userdic["surveyName"] as! String == ""))
                    {
                        
                        surveyName = userdic["surveyName"] as! String
                   
                    }
                    else{ }
                    
                    if(!(userdic["surveryDesc"] as! String == ""))
                    {
                        
                        surveryDesc = userdic["surveryDesc"] as! String
                        
                        
                    }
                    else{ }
                    
                    if(!(userdic["surveyId"] as! String == ""))
                    {
                        
                          surveyId  = userdic["surveyId"] as! String
                        
                        NSUserDefaults.standardUserDefaults().setValue(surveyId, forKey: "SurveyId")

                        
                        
                    }
                    else{ }
                    
                    
                    if(((userdic["SurveyStatus"] as? String )) != nil)
                    {
                        
                        SurveyStatus  = userdic["SurveyStatus"] as! String
                        NSUserDefaults.standardUserDefaults().setValue(SurveyStatus, forKey: "SurveyStatus")
                        
                        
                    }
                    else{
                        if(userdic["SurveyStatus"] is NSNull){
                       SurveyStatus="0" as String
                        }
                    }

                    let surveylist=SurveyList(surveyname: surveyName, surveydesc: surveryDesc,surveyid:surveyId,surveystatus:SurveyStatus)
                    
                    self.survey.append(surveylist)
                    

                   
                   
                }
                    
                    
                
                
            }
  
            
            self.surveytableview.reloadData()
            
            self.hideActivityIndicator()
            
            
        }
             surveytableview.dataSource=self
        surveytableview.delegate=self
        
        completed()
        
        
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
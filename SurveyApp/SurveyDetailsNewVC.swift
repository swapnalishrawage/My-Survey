//
//  SurveyDetailsNewVC.swift
//  SurveyApp
//
//  Created by Mac on 05/01/17.
//  Copyright © 2017 Realizer Tech. All rights reserved.
//

import UIKit
import Alamofire

class SurveyDetailsNewVC: UIViewController {
    
    @IBOutlet weak var txtfifthradio: UILabel!
    @IBOutlet weak var btnradiofifth: UIButton!
    @IBOutlet weak var txtforthoption: UILabel!
    @IBOutlet weak var btnforthradio: UIButton!
    @IBOutlet weak var btnthirdradio: UIButton!
    @IBOutlet weak var txtthirdradio: UILabel!
    @IBOutlet weak var radiosecondbtn: UIButton!
    @IBOutlet weak var txtsecondradio: UILabel!
    @IBOutlet weak var txtradiofirst: UILabel!
    @IBOutlet weak var radiofirst: UIButton!
    @IBOutlet weak var lblquesno: UILabel!
    @IBOutlet weak var lblquestiontext: UILabel!
    @IBOutlet weak var textoptionfirst: UILabel!
    @IBOutlet weak var txtoptionforth: UILabel!
    @IBOutlet weak var lblsurveyname: UILabel!
    @IBOutlet weak var txtoptionthird: UILabel!
    @IBOutlet weak var txtoptionfifth: UILabel!
    @IBOutlet weak var txtoptionsecond: UILabel!
    private var _answerOptionNo:String!
    @IBOutlet weak var btngotoreport: UIButton!
    let im1=UIImage(named: "check.png")
    let image = UIImage(named: "uncheck.png")
    var o=[Options]()
    var getsurdetail = [getsurveydetails]()
    var getoptionid:[String]=[]
        var optiontextlist:[String]=[]
    var counter=0
    var answerOptionNo: String{
        get {
            return _answerOptionNo
            
        }
        set
        {
            _answerOptionNo = newValue
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backbtn.enabled=false
        backbtn.alpha=0.5
       backbtn.titleLabel?.textColor=UIColor.darkGrayColor()
        self.btngotoreport.enabled=false
        self.btngotoreport.alpha=0.5
   lblsurveyname.text=NSUserDefaults.standardUserDefaults().valueForKey("SurveyName") as? String
      
        downloadsurveyDetails(){}
                
  
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
           }
    
    func setquestion(counter:Int)
    {
        lblquesno.text=getsurdetail[counter].queSerialNo
        lblquestiontext.text=getsurdetail[counter].questiontext
    }
    
    
    func submitsurveyDetails(completed: DownloadComplete){
        if(self.radiofirst.currentImage != self.im1 && self.radiosecondbtn.currentImage != self.im1 && self.btnthirdradio.currentImage != self.im1 && self.btnforthradio.currentImage != self.im1   && self.btnradiofifth.currentImage != self.im1){
            let last = UIAlertController(title: "Error", message: "Please select any one Option", preferredStyle: .Alert)
            let cancelAction = UIAlertAction(title: "Ok", style: .Cancel, handler:nil)
            
            
            
            last.addAction(cancelAction)
            
            self.presentViewController(last, animated: true, completion: {  })
            
            
            
        }
 else
        {
        backbtn.titleLabel?.textColor=UIColor
        .whiteColor()
        backbtn.enabled=true
        backbtn.alpha=1
        counter=counter+1
          print(counter)
        let uid = NSUserDefaults.standardUserDefaults().valueForKey("UserId") as! String
        let surid = NSUserDefaults.standardUserDefaults().valueForKey("SurveyId") as! String
    
        var qid:String!
                var isComplete:Bool!
        print("----------------submit servey API--------------")
        let qno1=lblquesno.text! as String
        let qno=Int(qno1)
        let ansdate=NSDate()
        print(ansdate)
        var optionno:String!
        let i=0
      
        if(self.radiofirst.currentImage==self.im1){
            
            optionno = getoptionid[i]
            
        }
        else if(self.radiosecondbtn.currentImage==self.im1){
         optionno=getoptionid[i+1]
            
        }
        else if(self.btnthirdradio.currentImage==self.im1){
            optionno = getoptionid[i+2]//self.getsurdetail[i].options[i+2].optionId
            
            
            
        }
        else if(self.btnforthradio.currentImage==self.im1){
            optionno=getoptionid[i+3]//self.getsurdetail[i].options[i+3].optionId
            
        }
        else if(self.btnradiofifth.currentImage==self.im1){
            optionno=getoptionid[i+4]//self.getsurdetail[i].options[i+4].optionId
            
        }
        else
  
        {
            let last = UIAlertController(title: "Error", message: "Please select any one Option", preferredStyle: .Alert)
            let cancelAction = UIAlertAction(title: "Ok", style: .Cancel, handler:nil)
            
            
            
            last.addAction(cancelAction)
            
            self.presentViewController(last, animated: true, completion: {  })
            

        }
      
       
        for(var i=0;i<getsurdetail.count;i++){
        if(qno1 == getsurdetail[i].queSerialNo){
        
         qid =  getsurdetail[i].questionId
           getsurdetail[i].answerOptionNo=optionno
            
        }
           
        }
        
        
        
       
              let m = BASE_URL + "subitSurveyAnswer"
        print(qid)
      
        let currentDate = NSDate()
        let dateFormatter = NSDateFormatter()
        
        dateFormatter.dateFormat = "MM/dd/yyyy "
        let convertedDate: String = dateFormatter.stringFromDate(ansdate)
               if(qno==getsurdetail.count)
        {
            isComplete=true
        NSUserDefaults.standardUserDefaults().setValue(isComplete, forKey: "IsComplete")
            print(isComplete)
        }
        else
        {
            isComplete=false
        }
        let parameters=["userId":uid,"surveyId":surid,"quetionId"
            :qid,"optionNo":optionno,"isComplete":isComplete,"answerDate":convertedDate]
        
        
        Alamofire.request(.POST,m,parameters:parameters as! [String : AnyObject]).responseString{response in
            
           
            let q:String=self.lblquesno.text as String!
          
            let r:Int = Int(q)!
            let c = self.getsurdetail.count
         
            
           if(self.radiofirst.currentImage != self.im1 && self.radiosecondbtn.currentImage != self.im1 && self.btnthirdradio.currentImage != self.im1 && self.btnforthradio.currentImage != self.im1   && self.btnradiofifth.currentImage != self.im1){
                let last = UIAlertController(title: "Error", message: "Please select any one Option", preferredStyle: .Alert)
                let cancelAction = UIAlertAction(title: "Ok", style: .Cancel, handler:nil)
                
                
                
                last.addAction(cancelAction)
                
                self.presentViewController(last, animated: true, completion: {  })
                
                
                
            }
            else
            {
               
                for(var i=0;i<c;i++){
                    
                    if(i == r)
                        
                {
                    
                    self.backbtn.enabled=true
                    self.backbtn.alpha=1.0
                    self.backbtn.titleLabel?.textColor=UIColor.whiteColor()
                    
                    self.setquestion(self.counter)
                    
                    self.selectdeselectradio(self.getsurdetail[self.counter].answerOptionNo)
                   
                    
                    }
                  else  if(r==c)
                    {
                        
                        
                        self.backbtn.enabled=false
                         self.backbtn.alpha=0.5
                         self.backbtn.titleLabel?.textColor=UIColor.whiteColor()
                 
                        self.btngotoreport.enabled=true
                        self.btngotoreport.alpha=1
                        self.nextbtn.enabled=false
                        self.nextbtn.alpha=0.5
                      let last = UIAlertController(title: "Message", message: "This is Last Question ", preferredStyle: .Alert)
                        let cancelAction = UIAlertAction(title: "Ok", style: .Default, handler:{action in                              self.nextbtn.titleLabel?.text="SUBMIT"
                            self.nextbtn.setTitle("SUBMIT", forState: UIControlState.Normal)
                            self.nextbtn.titleLabel?.textColor=UIColor.whiteColor()
                            
                            let last1 = UIAlertController(title: "Message", message: "Are you sure to submit survey ", preferredStyle: .Alert)
                            let okAction = UIAlertAction(title: "Ok", style: .Default, handler:nil)
                            let cancelAction1 = UIAlertAction(title: "Cancel", style: .Cancel, handler:nil)
                            
                            last1.addAction(okAction)
                            last1.addAction(cancelAction1)
                            
                            self.presentViewController(last1, animated: true, completion: {  })

                            
                            
                            
                        })
                    
                    
                    
                    last.addAction(cancelAction)
                    
                    self.presentViewController(last, animated: true, completion: {  })
                  
                        
                              
                   }
                    else {                    }
                
                }
                
               
            }
                    
            
            
       
            
        }
          completed()
        
        }
    }
    
    func selectdeselectradio(AnsweroptionNo:String)
    {
        
     
        self.txtradiofirst.hidden=true
        self.txtsecondradio.hidden=true
        self.txtthirdradio.hidden=true
        self.txtforthoption.hidden=true
        txtfifthradio.hidden=true
      
        self.radiofirst.hidden=true
        self.radiosecondbtn.hidden=true
        self.btnthirdradio.hidden=true
        self.btnforthradio.hidden=true
        self.btnradiofifth.hidden=true
        
        if(AnsweroptionNo != ""){
            
            print("-----------\(o.count)")
            print(getoptionid[0])
            print(getoptionid[1])
             print(getoptionid[2])
            print(getsurdetail[0].options.count)
     
            for  (var i = 0; i<getsurdetail[0].options.count; i++)//(0...optiontextlist.count){
                
            {
             
                if(AnsweroptionNo==self.getoptionid[0] && i==0){
                    if(i==0){
                    self.radiofirst.setImage(self.im1, forState: UIControlState.Normal)
                    
                    self.txtradiofirst.text=self.getsurdetail[0].options[i].optionText
                    }
                    
                    self.radiofirst.hidden=false
                    self.txtradiofirst.hidden=false
                    
                    
                }else if(AnsweroptionNo != self.getoptionid[0] && i==0){
                    self.radiofirst.setImage(self.image, forState: UIControlState.Normal)
                    if(i==0){
                        self.txtradiofirst.text=self.getsurdetail[0].options[i].optionText
                    }
                    self.radiofirst.hidden=false
                    self.txtradiofirst.hidden=false
                }
               else if(AnsweroptionNo==self.getoptionid[1] && i==1 ){
                    
                    self.radiosecondbtn.setImage(self.im1, forState: UIControlState.Normal)
                    if(i==1){
                    self.txtsecondradio.text=self.getsurdetail[0].options[i].optionText
                    }
                    self.radiosecondbtn.hidden=false
                    self.txtsecondradio.hidden=false
                    
                    
                    
                }
                    
                else if(AnsweroptionNo != self.getoptionid[1]  && i==1)
                {
                    
                    self.radiosecondbtn.setImage(self.image, forState: UIControlState.Normal)
                    if(i==1){
                        self.txtsecondradio.text=self.getsurdetail[0].options[i].optionText
                    }
                    self.radiosecondbtn.hidden=false
                    self.txtsecondradio.hidden=false
                    
                    
                    
                }
         else   if(AnsweroptionNo==self.getoptionid[2]  && i==2){
                    
                    self.btnthirdradio.setImage(self.im1, forState: UIControlState.Normal)
                    if(i==2)
                    {
                    self.txtthirdradio.text=self.getsurdetail[0].options[i].optionText
                    }
                    self.btnthirdradio.hidden=false
                    self.txtthirdradio.hidden=false
                    
                    
                    
                }
                    
                else if(AnsweroptionNo != self.getoptionid[2] && i==2)
                {
                    
                    self.radioforthclick.setImage(self.image, forState: UIControlState.Normal)
                    if(i==2)
                    {
                    self.txtforthoption.text=self.getsurdetail[0].options[i].optionText
                    }
                    self.btnforthradio.hidden=false
                    self.txtforthoption.hidden=false
                    
                    
                    
                }
              else  if(AnsweroptionNo == self.getoptionid[3]  &&  i==3){
                    
                    self.btnforthradio.setImage(self.im1, forState: UIControlState.Normal)
                    self.txtforthoption.text=self.getsurdetail[0].options[i].optionText
                    self.btnforthradio.hidden=false
                    self.txtforthoption.hidden=false
                    
                    
                    
                }
                    
                else if(AnsweroptionNo != self.getoptionid[3] &&  i==3)
                {
                    
                    self.btnforthradio.setImage(self.image, forState: UIControlState.Normal)
                    self.txtforthoption.text=self.getsurdetail[0].options[i].optionText
                    self.btnforthradio.hidden=false
                    self.txtforthoption.hidden=false
                    
                    
                    
                }
                    
             else  if(AnsweroptionNo == self.getoptionid[4]  &&  i==4){
                    
                    self.btnradiofifth.setImage(self.im1, forState: UIControlState.Normal)
                    self.txtoptionfifth.text=self.getsurdetail[0].options[i].optionText
                    self.btnradiofifth.hidden=false
                    self.txtoptionfifth.hidden=false
                    
                    
                    
                }
                    
                else if(AnsweroptionNo != self.getoptionid[i] &&  i==4)
                {
                    
                    self.btnradiofifth.setImage(self.image, forState: UIControlState.Normal)
                    self.txtoptionfifth.text=self.getsurdetail[0].options[i].optionText
                    self.btnradiofifth.hidden=false
                    self.txtoptionfifth.hidden=false
                    
                    
                    
                }
                
                
            }
            }
            
        
            
        else{
            
            let last = UIAlertController(title: "Error", message: "Please select any one Option", preferredStyle: .Alert)
            let cancelAction = UIAlertAction(title: "Ok", style: .Cancel, handler:nil)
            
            
            
            last.addAction(cancelAction)
            
            self.presentViewController(last, animated: true, completion: {  })
            
            
            
            
        }
        
        
        
                 }
    
    
    func downloadsurveyDetails(completed: DownloadComplete){
        
        let uid = NSUserDefaults.standardUserDefaults().valueForKey("UserId") as! String
        let surid = NSUserDefaults.standardUserDefaults().valueForKey("SurveyId") as! String
       
        let m = BASE_URL + "getServeyDetails/\(uid)/\(surid)"
      
        
       
        Alamofire.request(.GET,m).responseJSON{ response in
            let result = response.result
          
            
            if let dict = result.value  as?  [Dictionary<String,AnyObject>]
                
            {
               
                
                for userdic in dict {
                    
                    var surveyid:String=""
                    var questionId:String=""
                    var questionText:String=""
                    var queSerialNo:String=""
                    
                    var answerOptionNo1:String=""
                    var answerOptionNo:String=""
                    var options:String=""
                    var optionid:String=""
                    var optiontext:String=""
                    var serialno:String=""
                    var surveyId:String=""
                    var survey:String=""
                    var optiontextlist:[String]=[]
                    
                    if(!(userdic["questionId"] as! String == ""))
                    {
                        questionId=userdic["questionId"] as! String
                    }
                    else{ }
                    
                    if(!(userdic["surveyId"] as! String == ""))
                    {
                        surveyid=userdic["surveyId"] as! String
                        
                    }
                    else{ }
                    
                    
                    
                    if(!(userdic["questionText"] as! String == ""))
                    {
                        questionText=userdic["questionText"] as! String
                        
                        
                    }
                    else{ }
                    
                    
                    if((userdic["queSerialNo"]  != nil ))
                    {
                        queSerialNo = (userdic["queSerialNo"] as? String)!
                        
                    }
                    else{ }
                    
                    if let answerOptionNo=userdic["answerOptionNo"]  as? String
                    {
                        
                        self._answerOptionNo = userdic["answerOptionNo"] as!  String
                 
                        answerOptionNo1=self._answerOptionNo as String
                        
                                              }
                        
                    else if(userdic["answerOptionNo"] is NSNull){
                        answerOptionNo1="0" as String
                    }
                    
                    
                    
                    if let opt=(userdic["options"] as? [Dictionary<String,AnyObject>])
                    {
                        
                        var count=opt.count
                       
                        
                        for optionN in opt{
                            if  (!(optionN["optionId"] as! String=="")){
                                
                                optionid=optionN["optionId"] as! String
                                 self.getoptionid.append(optionid)
                                
                            }
                            else{}
                            
                            if (!(optionN["optionText"] as! String=="")){
                                optiontext=optionN["optionText"] as! String
                                
                                optiontextlist.append(optiontext)
                                print("--optionText---\(optiontext)")
                                
                            }
                            else{}
                            if (!(optionN["serialNo"] as! String=="")){
                                serialno=optionN["serialNo"] as! String
                              
                                
                            }
                                
                                
                            else{}
                            if (!(optionN["surveyId"] as! String=="")){
                                surveyId=optionN["surveyId"] as! String
                                
                                
                            }
                            else{}
                            
                            let  o1=Options(serialno: serialno, optionText: " "+optiontext,optionid:optionid,survey:survey )
                            self.o.append(o1)
                        }
                        
                    }
                                        let getsur=getsurveydetails(surveyId:surveyid,questionId: questionId, questionText:" "+questionText, queSerialNo:queSerialNo, answerOptionNo: answerOptionNo1, option:self.o)
                    
                    self.getsurdetail.append(getsur)
                    
                    self.o.removeAll()
                    
                }
                
                print(response)
                self.setquestion(self.counter)
               
             print(self.getsurdetail[0].answerOptionNo)
                self.selectdeselectradio(self.getsurdetail[0].answerOptionNo)
            self.backbtn.enabled=false
                self.backbtn.alpha=0.5
                self.backbtn.tintColor=UIColor.darkGrayColor()
                
           
            }
            
            
            completed()
            
            
        }
    }

    
    
   
    @IBAction func radiofirstclick(sender: AnyObject) {
        
        
        if(radiofirst.currentImage==im1){
            radiosecondbtn.setImage(image, forState: UIControlState.Normal)
            btnthirdradio.setImage(image, forState: UIControlState.Normal)
            btnforthradio.setImage(image,forState:UIControlState.Normal)
            
            btnradiofifth.setImage(image, forState:UIControlState.Normal)
        }
        else
        {
            
            radiofirst.setImage(im1, forState: UIControlState.Normal)
            if(radiofirst.currentImage==im1){
                radiosecondbtn.setImage(image, forState: UIControlState.Normal)
                btnthirdradio.setImage(image, forState: UIControlState.Normal)
                btnforthradio.setImage(image,forState:UIControlState.Normal)
                
                btnradiofifth.setImage(image, forState:UIControlState.Normal)
            }
        }
        
        
    }
    @IBAction func radiosecondclick(sender: AnyObject) {
        
        
        if(radiosecondbtn.currentImage==im1)
        {
            radiofirst.setImage(image, forState: UIControlState.Normal)

            radiosecondbtn.setImage(image,forState:UIControlState.Normal)
            
            btnthirdradio.setImage(image, forState:UIControlState.Normal)
                       btnforthradio.setImage(image,forState:UIControlState.Normal)
            
            btnradiofifth.setImage(image, forState:UIControlState.Normal)
            
        }
        else
        {
            radiosecondbtn.setImage(im1,forState:UIControlState.Normal)
            if(radiosecondbtn.currentImage==im1)
            {
                radiofirst.setImage(image, forState:UIControlState.Normal)
                btnthirdradio.setImage(image, forState: UIControlState.Normal)
                btnforthradio.setImage(image,forState:UIControlState.Normal)
                
                btnradiofifth.setImage(image, forState:UIControlState.Normal)
            }
            
        }

        
        
    }
    @IBAction func radiothirdclick(sender: AnyObject) {
        if(btnthirdradio.currentImage==im1)
        {
           btnthirdradio.setImage(image,forState:UIControlState.Normal)
            
            radiosecondbtn.setImage(image, forState:UIControlState.Normal)
            radiofirst.setImage(image, forState: UIControlState.Normal)
            btnforthradio.setImage(image,forState:UIControlState.Normal)
            
            btnradiofifth.setImage(image, forState:UIControlState.Normal)
            
            
        }
        else
        {
            btnthirdradio.setImage(im1,forState:UIControlState.Normal)
            if(btnthirdradio.currentImage==im1)
            {
                radiofirst.setImage(image, forState:UIControlState.Normal)
                radiosecondbtn.setImage(image, forState: UIControlState.Normal)
                btnforthradio.setImage(image,forState:UIControlState.Normal)
                
                btnradiofifth.setImage(image, forState:UIControlState.Normal)
            }
            
        }
        

        
        
    }
    @IBOutlet weak var backbtn: UIButton!
    @IBOutlet weak var nextbtn: UIButton!
    @IBOutlet weak var radioforthclick: UIButton!
    @IBOutlet weak var radiosecondClick: UIButton!
    @IBAction func radioforthclick(sender: AnyObject) {
        if(btnforthradio.currentImage==im1)
        {
            btnforthradio.setImage(image,forState:UIControlState.Normal)
            
            radiosecondbtn.setImage(image, forState:UIControlState.Normal)
            radiofirst.setImage(image, forState: UIControlState.Normal)
            btnforthradio.setImage(image, forState: UIControlState.Normal)
           btnradiofifth.setImage(image, forState: UIControlState.Normal)
            
        }
        else
        {
            btnforthradio.setImage(im1,forState:UIControlState.Normal)
            if(btnforthradio.currentImage==im1)
            {
               radiofirst.setImage(image, forState:UIControlState.Normal)
                radiosecondbtn.setImage(image, forState: UIControlState.Normal)
               btnthirdradio.setImage(image, forState: UIControlState.Normal)
               btnradiofifth.setImage(image, forState: UIControlState.Normal)
                
            }
            
        }

        
        
        
    }
    @IBAction func NextClick(sender: AnyObject) {
        
        submitsurveyDetails(){}
         }
    @IBAction func radiofifthclick(sender: AnyObject) {
        
        
        if(btnradiofifth.currentImage==im1)
        {
            btnforthradio.setImage(image,forState:UIControlState.Normal)
            
           radiosecondbtn.setImage(image, forState:UIControlState.Normal)
            radiofirst.setImage(image, forState: UIControlState.Normal)
            btnthirdradio.setImage(image, forState: UIControlState.Normal)
            btnradiofifth.setImage(image, forState: UIControlState.Normal)
            
        }
        else
        {
            btnradiofifth.setImage(im1,forState:UIControlState.Normal)
            if(btnradiofifth.currentImage==im1)
            {
                radiofirst.setImage(image, forState:UIControlState.Normal)
               radiosecondbtn.setImage(image, forState: UIControlState.Normal)
               btnthirdradio.setImage(image, forState: UIControlState.Normal)
               btnforthradio.setImage(image, forState: UIControlState.Normal)
                
            }
            
        }

        
    }
    @IBOutlet weak var radiofifthclick: UIButton!
    @IBAction func backclick(sender: AnyObject) {
        counter=counter-1
        btngotoreport.enabled=false
        btngotoreport.alpha=0.5
        var q:String=lblquesno.text as String!
        print(q)
        let r:Int = Int(q)!
      
        if(r==1)
        {
            
            
            let last = UIAlertController(title: "Message", message: "This is First Question", preferredStyle: .Alert)
            let cancelAction = UIAlertAction(title: "Ok", style: .Cancel, handler:nil)
            
            
            
            last.addAction(cancelAction)
            
            self.presentViewController(last, animated: true, completion: {  })
            backbtn.enabled=false
            backbtn.alpha=0.5
        
            
        }
       else
        {
        var answeroptionNo=getsurdetail[counter].answerOptionNo
        setquestion(counter)
            print(getsurdetail[counter].answerOptionNo)
            selectdeselectradio(getsurdetail[counter].answerOptionNo)
            nextbtn.enabled=true
            nextbtn.alpha=1
            nextbtn.titleLabel?.textColor=UIColor.whiteColor()
        }
    }
    
}

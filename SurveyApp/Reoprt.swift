//
//  Reoprt.swift
//  SurveyApp
//
//  Created by Mac on 06/01/17.
//  Copyright © 2017 Realizer Tech. All rights reserved.
//

import UIKit
import Charts
import Alamofire

class Reoprt: UIViewController {
     var months: [String]!
    var getoptionNo:[String]=[]
    var questionNo:[String]=[]
    var firstoptions:[String]=[]
    var numberofanswer:[String] = []
    var numberofAnswerValues:[[String]]=[]
    var entry:[BarChartDataEntry]=[]
    var totaloptions:[Int]!
    var optiontext:[String]=[]
    
    @IBOutlet weak var chart: BarChartView!
    
    @IBOutlet weak var closebtn: UIBarButtonItem!
    @IBAction func closebuttonclick(sender: AnyObject) {
        let iscomplete=true
        print("close")
        performSegueWithIdentifier("squereport", sender: iscomplete)
       // self.dismissViewControllerAnimated(true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
       self.navigationItem.hidesBackButton = true;
        downloadsurveyreport(){}
        
    }
    
    @IBAction func MenuClick(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    @IBAction func closeclick(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
        print("close")
    }
    func setChart(dataPoints: [String], values: [Double]) {
             // print(dataPoints)
        let c0=NSUserDefaults.standardUserDefaults().valueForKey("Count")
        var count1=c0 as! Int
        let c1=c0 as! Int
        print(count1)
        var j=0
        var i=j
        var m:[Double]=[]
        let doubles  = numberofanswer.map { (s : String) -> Double in
            if let d = Double(s){
                return d
            }
            return 0.0
        }
        var d:[Double]=doubles
        for(var k=0;k<questionNo.count;k++)
        {
                       for( i=j;i<count1;i++)
            {
                
                
                d[i]=doubles[i] as Double
                print(d[i])
            m.append(d[i])
               
                         }
             print(m)
            let entry1 = BarChartDataEntry(xIndex:k, values:m)
            m.removeAll()
            entry.append(entry1)
            j=i
            count1=count1+c1
            
        }
        print(entry)
             let count0=c1
        let dataSet = BarChartDataSet(yVals: entry)
        if(c1==2){
             dataSet.colors = [UIColor(red: 199/255, green: 167/255, blue: 103/255, alpha: 1), UIColor(red: 196/255, green: 66/255, blue: 145/255, alpha: 1)]
        }
        else if(c1==3){
        dataSet.colors = [UIColor(red: 199/255, green: 167/255, blue: 103/255, alpha: 1), UIColor(red: 196/255, green: 66/255, blue: 145/255, alpha: 1),UIColor(red: 68/255, green: 211/255, blue: 105/255, alpha: 1)]
        }
        else if(c1==4)
        {
              dataSet.colors = [UIColor(red: 199/255, green: 167/255, blue: 103/255, alpha: 1), UIColor(red: 196/255, green: 66/255, blue: 145/255, alpha: 1),UIColor(red: 68/255, green: 211/255, blue: 105/255, alpha: 1),UIColor(red: 143/255, green: 66/255, blue: 67/255, alpha: 1)]
        }
        else if(c1==5)
        {
            dataSet.colors = [UIColor(red: 199/255, green: 167/255, blue: 103/255, alpha: 1),UIColor(red: 196/255, green: 66/255, blue: 145/255, alpha: 1),UIColor(red: 68/255, green: 211/255, blue: 105/255, alpha: 1),UIColor(red: 143/255, green: 66/255, blue: 67/255, alpha: 1),UIColor(red: 156/255, green: 107/255, blue: 144/255, alpha: 1)]
        }
        let chartData = BarChartData(xVals:questionNo, dataSet:dataSet )
   
       

        dataSet.stackLabels[0]=optiontext[0]
        for(var i = 0;i<count0 ;i++)
        {
            
            dataSet.stackLabels.append(optiontext[i+1])

            
        }
     chart.data?.dataSets.dropLast(i)
              chart.animate(xAxisDuration: 2.0, yAxisDuration: 2.0, easingOption: .EaseInBounce)

       chart.xAxis.labelPosition = .Bottom
        
        chart.data = chartData
        chart.leftAxis.startAtZeroEnabled = false
                chart.leftAxis.customAxisMin = 0
              chart.rightAxis.enabled=false
        
        
    }
       func downloadsurveyreport(completed: DownloadComplete){
        
    
        let surid = NSUserDefaults.standardUserDefaults().valueForKey("SurveyId") as! String
        
        let m = BASE_URL + "GetSurveyReport/\(surid)"
        
        
        Alamofire.request(.GET,"http://45.35.4.250/Survey/api/Survey/GetSurveyReport/\(surid)").responseJSON{ response in
            let result = response.result
            
                      if let dict = result.value  as?  [Dictionary<String,AnyObject>]
                
            {
                
                              for userdic in dict {
                    
                    var surveyid:String=""
                    var UsrveyName:String=""
                    var questionNo:String=""
                    var queSerialNo:String=""
                    var questionText:String=""
                    
                    var options:String=""
                    var numberofAnswers:String=""
                    var optionNo:String=""
                    var optiontext:String=""
                   
                    
                    if(!(userdic["SurveyId"] as! String == ""))
                    {
                        surveyid=userdic["SurveyId"] as! String
                    }
                    else{ }
                    
                    if(!(userdic["UsrveyName"] as! String == ""))
                    {
                        UsrveyName=userdic["UsrveyName"] as! String
                        
                    }
                    else{ }
                    
                    
                    
                    if(!(userdic["questionNo"] as! String == ""))
                    {
                        questionNo=userdic["questionNo"] as! String
                    self.questionNo.append(questionNo)
                        
                        
                    }
                    else{ }
                    
                    
                    if((userdic["questionText "]  != nil ))
                    {
                        questionText  = (userdic["questionText "] as? String)!
                        
                    }
                    else{ }
                    
                    
                    
                    if let opt=(userdic["Option"] as? [Dictionary<String,AnyObject>])
                    {
                        
                        var count=opt.count
                     NSUserDefaults
                        .standardUserDefaults().setObject(count, forKey: "Count")
                       
                        for optionN in opt{
                            if  (!(optionN["numberofAnswers"] as! String=="")){
                                
                               numberofAnswers=optionN["numberofAnswers"] as! String
                                                               self.numberofanswer.append(numberofAnswers)
                                
                            }
                            else{}
                            
                            if (!(optionN["optionNo"] as! String=="")){
                               optionNo=optionN["optionNo"] as! String
                                
                               self.getoptionNo.append(optionNo)
                                
                            }
                            else{}
                            if (!(optionN["optionText"] as! String=="")){
                                optiontext=optionN["optionText"] as! String
                                
                             self.optiontext.append(optiontext)
                                
                            }
                            else{}

                        
                            
                        
                        }
                        
                        
                    }
       
                    
                    self.numberofAnswerValues.append(self.numberofanswer)
            
                                   }
                
              
              
      
              
           
                let unitsSold = []
               
                self.setChart(self.questionNo, values:unitsSold as! [Double])
                
            }
            
            completed()
            
            
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
            }


}

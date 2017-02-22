//
//  SurveyList.swift
//  SurveyApp
//
//  Created by Mac on 13/12/16.
//  Copyright © 2016 Realizer Tech. All rights reserved.
//

import Foundation
class SurveyList
{
    private var _surveyname: String!
    private var _surveydesc: String!
    private var _surveyid:String!
     private var _surveystatus:String!
   /* private var _numberofQuestions:String!
    private var _options:[String]
    private var _questions:[String]*/
    
    var surveyname : String{
       
            return  _surveyname
    
        }
        
    
    var surveydesc : String{
        
            return  _surveydesc
    }
    var  surveyid: String{
        return  _surveyid
}
  /*  var  numberofQuestions: String{
        get{return  _numberofQuestions}
        set{_numberofQuestions = newValue}
    }
    
    var  options: [String]{
        get{return  _options}
        set{_options = newValue}
    }
    var  questions: [String]{
        get{return  _questions}
        set{_questions = newValue}
    }*/
    var surveystatus : String{
        
        return  _surveystatus
        
    }


    init(surveyname:String,surveydesc:String,surveyid:String,surveystatus:String)
    {
    _surveyname=surveyname
        _surveydesc=surveydesc
        _surveyid = surveyid
        _surveystatus=surveystatus
     
    
    }

}

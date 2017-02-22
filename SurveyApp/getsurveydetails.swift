//
//  getsurveydetails.swift
//  SurveyApp
//
//  Created by Mac on 04/01/17.
//  Copyright © 2017 Realizer Tech. All rights reserved.
//

import Foundation
class getsurveydetails
{
    
    
    private var _surveyId:String!
    private var _questionId: String!
    private var _questionText: String!
    private var _queSerialNo:String!
    private var _answerOptionNo:String!
    private  var _options = [Options]()
    
   var  surveyId: String{
        get{return  _surveyId}
        set{_surveyId = newValue}
    }
    
    var  questionId: String{
        get{return  _questionId}
        set{_questionId = newValue}
    }
    
    var  questiontext: String{
        get{return  _questionText}
        set{_questionText = newValue}
    }
    
    var  queSerialNo: String{
        get{return  _queSerialNo}
        set{_queSerialNo = newValue}
    }

    var  answerOptionNo: String{
        get{return  _answerOptionNo}
        set{_answerOptionNo = newValue}
    }
    
    
    var  options: [Options]{
        get{return  _options}
        set{_options = newValue}
    }
  
    
    init(surveyId:String,questionId:String,questionText:String,queSerialNo:String,answerOptionNo:String,option:[Options])
    {
       _surveyId = surveyId
        _questionId = questionId
        _questionText=questionText
        
        _queSerialNo=queSerialNo
        _answerOptionNo=answerOptionNo
        _options = option
        
    }
  
    

}
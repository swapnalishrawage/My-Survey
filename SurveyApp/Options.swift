//
//  Options.swift
//  SurveyApp
//
//  Created by Mac on 15/12/16.
//  Copyright © 2016 Realizer Tech. All rights reserved.
//

import Foundation
class Options
{
    private var _serialno: String!
    private var _optionText: String!
    private var _optionId:String!
    private var _survey:String!
    
    
    
    var serialno : String{
        get{return  _serialno}
        set{_serialno=newValue}
        
           }
    var optionText : String{
        get{return _optionText }
        set{_optionText=newValue}
    
        
        
    }
    
    var optionId : String{
        get{return _optionId }
        set{_optionId=newValue}
          }

    var survey : String{
        get{return _survey }
        set{_survey=newValue}
    }
    
    init(serialno:String,optionText:String,optionid:String,survey:String)
    {
        _serialno = serialno
        _optionText = optionText
        _optionId=optionid
        _survey=survey
        
        
    }
    



}


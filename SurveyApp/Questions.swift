//
//  Questions.swift
//  SurveyApp
//
//  Created by Mac on 04/01/17.
//  Copyright © 2017 Realizer Tech. All rights reserved.
//

import Foundation
class Questions{
private var _questionno: String!
private var _questiontext: String!
private var _questionId:String!
private var _surveyId:String!
private  var _options:[String] = []

var  questionno: String{
get{return  _questionno}
set{_questionno = newValue}
    }
    
    var  questiontext: String{
    get{return  _questiontext}
        set{_questiontext = newValue}}

 }


//
//  constant.swift
//  SurveyApp
//
//  Created by Mac on 14/12/16.
//  Copyright © 2016 Realizer Tech. All rights reserved.
//

import Foundation

let BASE_URL = "http://45.35.4.250/Survey/api/Survey/"
let URL_Security="http://45.35.4.250/Survey/api/"
let Username = "s-farhan/"
let Password = "test/"
let Device_Id = "6534786383"

typealias DownloadComplete = () -> ()

let Current_Url = "\(BASE_URL)\(Username)\(Password)\(Device_Id)"

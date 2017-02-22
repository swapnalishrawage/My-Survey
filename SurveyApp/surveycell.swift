//
//  surveycell.swift
//  SurveyApp
//
//  Created by Mac on 13/12/16.
//  Copyright © 2016 Realizer Tech. All rights reserved.
//

import UIKit


class surveycell: UITableViewCell {
    
    @IBOutlet weak var lblsurveyname: UILabel!

    @IBOutlet weak var lblsurveydesc: UILabel!
    override func awakeFromNib() {
        return super.awakeFromNib()
    }
    
    
    func updateUI(SurveyName:String,Desc:String)
    {
        lblsurveyname.text=SurveyName
        lblsurveydesc.text=Desc
    }
    

}

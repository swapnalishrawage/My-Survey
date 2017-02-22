//
//  MenuTableCell.swift
//  SurveyApp
//
//  Created by Mac on 16/12/16.
//  Copyright © 2016 Realizer Tech. All rights reserved.
//



import UIKit

class MenuTableCell: UITableViewCell {
    @IBOutlet weak var menuimage: UIImageView!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var menu: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    func updateCell(menulabel:String,menuimage:UIImage)
    {
        menu.text = menulabel;
        img.image = menuimage ;
        //img = UIImageView(image: menuimage);
        
    }
    
    
}

//
//  radiotest.swift
//  SurveyApp
//
//  Created by Mac on 22/12/16.
//  Copyright © 2016 Realizer Tech. All rights reserved.
//

import UIKit
import DLRadioButton
class radiotest: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
            }
    
    // MARK: Helper
    
    private func createRadioButton(frame : CGRect, title : String, color : UIColor) -> DLRadioButton {
        let radioButton = DLRadioButton(frame: frame);
        radioButton.titleLabel!.font = UIFont.systemFontOfSize(14);
        radioButton.setTitle(title, forState: UIControlState.Normal);
        radioButton.setTitleColor(color, forState: UIControlState.Normal);
        radioButton.iconColor = color;
        radioButton.indicatorColor = color;
        radioButton.contentHorizontalAlignment = UIControlContentHorizontalAlignment.Left;
         //radioButton.addTarget(self, action:Selector.init(DemoViewController.logSelectedButton()), forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(radioButton)
        
        return radioButton;
    }

    

   @objc @IBAction func logSelectedButton(radioButton : DLRadioButton) {
        if (radioButton.multipleSelectionEnabled) {
            for button in radioButton.selectedButtons() {
                print(String(format: "%@ is selected.\n", button.titleLabel!.text!));
            }
        } else {
            print(String(format: "%@ is selected.\n", radioButton.selectedButton()!.titleLabel!.text!));
        }
        
        
    }
    
   }

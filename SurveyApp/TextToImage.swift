//
//  TextToImage.swift
//  ChatDemo
//
//  Created by sachin shinde on 09/12/16.
//  Copyright © 2016 Realizer. All rights reserved.
//

import Foundation

import  UIKit

class ImageToText{
    func textToImage(drawText: NSString, inImage: UIImage, atPoint:CGPoint)->UIImage{
        
        // Setup the font specific variables
        let textColor: UIColor = UIColor.whiteColor()
        var textFont: UIFont =  UIFont(name: "Avenir", size: 85)!
        //let textStyle = UIFontWeightHeavy
        let textStyle  = NSTextEffectLetterpressStyle
        
        //Setup the image context using the passed image.
        UIGraphicsBeginImageContext(inImage.size)
        
        let textFontAttributes = [
            NSFontAttributeName: textFont,
            NSForegroundColorAttributeName: textColor,
            NSTextEffectAttributeName : textStyle
            ] as [String : AnyObject]
        inImage.drawInRect( CGRect(x: 0, y: 0, width: inImage.size.width, height: inImage.size.height))
        
        let textSize = drawText.sizeWithAttributes(textFontAttributes) //drawText.size(attributes: textFontAttributes)
        let textRect = CGRect(x: inImage.size.width / 2 - textSize.width / 2, y: inImage.size.height / 2 - textSize.height / 2, width: inImage.size.width / 2 + textSize.width / 2, height: inImage.size.height - textSize.height)
        drawText.drawInRect(textRect, withAttributes: textFontAttributes)

        
        let newImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        
        UIGraphicsEndImageContext()
        return newImage
    }
}

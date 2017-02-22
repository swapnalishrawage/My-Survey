//
//  DownloadImage.swift
//  ChatDemo
//
//  Created by sachin shinde on 12/12/16.
//  Copyright © 2016 Realizer. All rights reserved.
//

import UIKit
import AlamofireImage
import Alamofire

class DownloadImage{
    
    
   func userImage(imageurlString: String) -> Image? {
        
        var userImg:Image? = nil
    
    
        if PhotosDataManager.sharedManager.cachedImage(imageurlString) != nil
        {
            userImg = PhotosDataManager.sharedManager.cachedImage(imageurlString)        }
            
        else
        {
            let urlString = imageurlString
            let request = PhotosDataManager.sharedManager.getNetworkImage(urlString, complted: {image in
                userImg = image
                
                 })
            
        }
        return userImg
    }
    
}

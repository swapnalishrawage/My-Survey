//
//  PhotosDataManager.swift
//  ChatDemo
//
//  Created by sachin shinde on 12/12/16.
//  Copyright © 2016 Realizer. All rights reserved.
//


import AlamofireImage
import Alamofire
class PhotosDataManager {
    
    static let sharedManager = PhotosDataManager()
    private var photos = [String]()
    
    let photoCache = AutoPurgingImageCache(
        memoryCapacity: 100 * 1024 * 1024,
        preferredMemoryUsageAfterPurge: 60 * 1024 * 1024
    )
    
    
    //MARK: - Read Data
    
    func allPhotos() -> [String] {
        if !photos.isEmpty { return photos }
        guard let data = NSArray(contentsOfFile: dataPath()) as? [NSDictionary] else { return photos }
        for photoInfo in data {
            // let name = photoInfo["name"] as! String
            let urlString = photoInfo["imageURL"] as! String
            //let glacierScenic = GlacierScenic(name: name, photoURLString: urlString)
            photos.append(urlString)
        }
        return photos
    }
    
    func dataPath() -> String {
        
        return  NSBundle.mainBundle().pathForResource("SurveyApp", ofType: "plist")!
        }
    
    func cacheImage(image: Image, urlString: String) {
        
        // PhotosDataManager.sharedManager.allPhotos()
        photoCache.addImage(image, withIdentifier: urlString)
       
    }
    
    func cachedImage(urlString: String) -> Image? {
        return photoCache.imageWithIdentifier(urlString)
    }
    
    func getNetworkImage(urlString: String, complted:(UIImage?) -> Void) -> (Request) {
        
        var image:Image? = nil
        
        return Alamofire.request(.GET,urlString).responseImage { response in
            
            if(response.result.value != nil)
            {
                let image1 = response.result.value
                
                image = image1!
                
                self.cacheImage(image!, urlString: urlString)
            }
            
            
            complted(image)
            
            //  self.cacheImage(image: image!, urlString: urlString)
        }
        
        //return image!
        
    }
    
    
}

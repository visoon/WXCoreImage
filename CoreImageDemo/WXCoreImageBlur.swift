//
//  WXCoreImageBlur.swift
//  CoreImageDemo
//
//  Created by vison on 16/8/16.
//  Copyright © 2016年 vison. All rights reserved.
//

import UIKit

/*
 let kCIGaussianBlur = "CIGaussianBlur"
 let kCIBoxBlur = "CIBoxBlur"
 let kCIDiscBlur = "CIDiscBlur"
 let kCIMaskedVariableBlur = "CIMaskedVariableBlur"
 let kCIMedianFilter = "CIMedianFilter"
 let kCIMotionBlur = "CIMotionBlur"
 let kCINoiseReduction = "CINoiseReduction"
 let kCIZoomBlur = "CIZoomBlur"
 */

class WXCoreImageBlur: WXCoreImageRoot {

    class func createGaussianImage(originalImage: UIImage, radius: NSNumber, output: outputBlock){
        let filter = self.createFilterWithImage(originalImage)
        filter.setValue(radius, forKey: kCIInputRadiusKey)
        dispatch_async(dispatch_get_global_queue(0, 0)) { 
            let cgImage = self.createCGImage(filter.outputImage!)
            dispatch_async(dispatch_get_main_queue(), { 
                output(image: UIImage.init(CGImage: cgImage))
            })
        }
    }
    
    class func createBoxBlurImage(originalImage: UIImage, radius: NSNumber, output: outputBlock) {
        let filter = self.createFilterWithImage(originalImage)
        filter.setValue(radius, forKey: kCIInputRadiusKey)
        
    }
}

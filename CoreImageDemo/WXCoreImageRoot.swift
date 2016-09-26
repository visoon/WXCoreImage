//
//  WXCoreImageRoot.swift
//  CoreImageDemo
//
//  Created by vison on 16/8/16.
//  Copyright © 2016年 vison. All rights reserved.
//

import UIKit

typealias outputBlock = (image: UIImage) ->Void

class WXCoreImageRoot: NSObject {
    /**
     create a filter with UIImage
     
     - parameter image: UIImage data
     
     - returns: CIFilter contains image data
     
     */
    internal class func createFilterWithImage(image: UIImage) ->CIFilter {
        let filter = CIFilter.init(name: kCIGaussianBlur)
        filter?.setValue(CIImage.init(image: image), forKey: kCIInputImageKey)
        filter?.setDefaults()
        return filter!
    }
    
    /**
     change image type from CIImage to CGImage
     
     - parameter ciImage: CIImage instance
     
     - returns: CGImage instance result
     */
    internal class func createCGImage(ciImage: CIImage) ->CGImage {
        let context = CIContext.init(options: nil)
        let result = context.createCGImage(ciImage, fromRect: ciImage.extent)
        return result;
    }

}

typealias DoneBlock = () ->()
typealias WorkBlock = (DoneBlock) ->()


class AsyncSerialWorker {
    private let serialQueue = dispatch_queue_create("vison.serialQueue", DISPATCH_QUEUE_SERIAL)
    func enqueueWork(work: WorkBlock) {
        dispatch_async(serialQueue) { 
            let semaphore = dispatch_semaphore_create(0)
            work({ 
                dispatch_semaphore_signal(semaphore)
            })
            dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER)
        }
    }
}

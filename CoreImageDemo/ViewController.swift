//
//  ViewController.swift
//  CoreImageDemo
//
//  Created by vison on 16/8/16.
//  Copyright © 2016年 vison. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let a = AsyncSerialWorker()
        for i in 1...5 {
            a.enqueueWork { doneBlock in dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
                    sleep(arc4random_uniform(4)+1)
                    print(i)
                    doneBlock()
                }
            }
        }
//        WXCoreImageBlur.createGaussianImage(UIImage.init(named: "test1")!, radius: 5) { (image) in
//            self.imageView.image = image
//        }
    }
}


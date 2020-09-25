//
//  ResetViewController.swift
//  kakeiboApp
//
//  Created by 川田 文香 on 2020/09/26.
//  Copyright © 2020 kwdaaa.com. All rights reserved.
//

import UIKit

class ResetViewController: UIViewController {
    
    
    // 画像の名前設定
    var img01 :UIImage = UIImage(named:"message_reset_01")!
    var img02 :UIImage = UIImage(named:"message_reset_02")!
    var img03 :UIImage = UIImage(named:"message_reset_03")!
    var img04 :UIImage = UIImage(named:"message_reset_04")!
    var img05 :UIImage = UIImage(named:"message_reset_05")!
    
    var imgArray:[UIImage] = []
    
    // 名言画像
    @IBOutlet var imageview: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imgArray = [img01,img02,img03,img04,img05]
        
        let random = Int(arc4random_uniform(3))
        
        imageview.image = imgArray[random]
    }
    
}

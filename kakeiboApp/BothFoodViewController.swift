//
//  BothFoodViewController.swift
//  kakeiboApp
//
//  Created by 川田 文香 on 2020/09/24.
//  Copyright © 2020 kwdaaa.com. All rights reserved.
//

import UIKit

class BothFoodViewController: UIViewController {
    
    //    彼氏の食費の合計を表示するラベル
    @IBOutlet var bothFoodBoy:UILabel!
    //    彼女の食費合計を表示するラベル
    @IBOutlet var bothFoodGirl:UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        //        それぞれの食費の合計を変数に入れた！
//        let boyFoodTotal = UserDefaults.standard.object(forKey: "BoyFoodTotal") as? Int
//        let girlFoodTotal = UserDefaults.standard.object(forKey: "GirlFoodTotal") as? Int
//
        
//構造体にアクセス
        let bothFood = testStruct()
        
        //        BothTotalSumで使うために足し算！
        let bothfoodTotal = bothFood.boyFoodTotal! + bothFood.girlFoodTotal!
        UserDefaults.standard.set(bothfoodTotal, forKey: "bothFoodTotal")
        
        //        型変換
        let boyFoodTotalSecond:String = String("\(bothFood.boyFoodTotal)")
        let girlFoodTotalSecond:String = String("\(bothFood.girlFoodTotal)")
        
        //        それぞれの食費をラベルに表示
        bothFoodBoy.text = boyFoodTotalSecond
        bothFoodGirl.text = girlFoodTotalSecond
    }
    
}

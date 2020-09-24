//
//  BothDailyViewController.swift
//  kakeiboApp
//
//  Created by 川田 文香 on 2020/09/24.
//  Copyright © 2020 kwdaaa.com. All rights reserved.
//

import UIKit

class BothDailyViewController: UIViewController {
    //    彼氏の日用品の合計を表示するラベル
    @IBOutlet var bothDailyBoy:UILabel!
    //    彼女の日用品合計を表示するラベル
    @IBOutlet var bothDailyGirl:UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        //       //        それぞれの日用品の合計を変数に入れた！
        //       let boyDailyTotal = UserDefaults.standard.object(forKey: "BoyDailyTotal") as? Int
        //       let girlDailyTotal = UserDefaults.standard.object(forKey: "GirlDailyTotal") as? Int
        //
        
        //    構造体にアクセス
        let bothDaily = testStruct()
        
        //        BothTotalSumで使うために足し算！
        let bothDailyTotal = bothDaily.boyDailyTotal! + bothDaily.girlDailyTotal!
        UserDefaults.standard.set(bothDailyTotal, forKey: "bothDailyTotal")
        //
        //        型変換
        let boyDailyTotalSecond:String = String("\(bothDaily.boyDailyTotal)")
        let girlDailyTotalSecond:String = String("\(bothDaily.girlDailyTotal)")
        
        //        それぞれの日用品をラベルに表示
        bothDailyBoy.text = boyDailyTotalSecond
        bothDailyGirl.text = girlDailyTotalSecond
    }
    
    
    
    
    
}

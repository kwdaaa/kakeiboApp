//
//  BothLeisureViewController.swift
//  kakeiboApp
//
//  Created by 川田 文香 on 2020/09/24.
//  Copyright © 2020 kwdaaa.com. All rights reserved.
//
import UIKit

class BothLeisureViewController: UIViewController {
    //    彼氏の娯楽費の合計を表示するラベル
    @IBOutlet var bothLeisureBoy:UILabel!
    //    彼女の娯楽費の合計を表示するラベル
    @IBOutlet var bothLeisureGirl:UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
   override func viewWillAppear(_ animated: Bool) {
       
//       //        それぞれの娯楽費の合計を変数に入れた！
//       let boyLeisureTotal = UserDefaults.standard.object(forKey: "BoyLeisureTotal") as? Int
//       let girlLeisureTotal = UserDefaults.standard.object(forKey: "GirlLeisureTotal") as? Int
    
//    構造体にアクセス
    let bothLeisure = testStruct()
    
       
       //        BothTotalSumで使うために足し算！
    let bothLeisureTotal = bothLeisure.boyLeisureTotal! + bothLeisure.girlLeisureTotal!
       UserDefaults.standard.set(bothLeisureTotal, forKey: "bothLeisureTotal")
//
       //        型変換
    let boyLeisureTotalSecond:String = String("\(bothLeisure.boyLeisureTotal)")
    let girlLeisureTotalSecond:String = String("\(bothLeisure.girlLeisureTotal)")
       
       //        それぞれの娯楽費をラベルに表示
       bothLeisureBoy.text = boyLeisureTotalSecond
       bothLeisureGirl.text = girlLeisureTotalSecond
   }
   
    
}

//
//  BothHousingViewController.swift
//  kakeiboApp
//
//  Created by 川田 文香 on 2020/09/24.
//  Copyright © 2020 kwdaaa.com. All rights reserved.
//

import UIKit

class BothHousingViewController: UIViewController {
    //    彼氏の固定費の合計を表示するラベル
      @IBOutlet var bothHousingBoy:UILabel!
      //    彼女の固定費の合計を表示するラベル
      @IBOutlet var bothHousingGirl:UILabel!
      
      override func viewDidLoad() {
          super.viewDidLoad()
      }
      
    
      
     override func viewWillAppear(_ animated: Bool) {
         
//         //        それぞれの固定費の合計を変数に入れた！
//         let boyHousingTotal = UserDefaults.standard.object(forKey: "BoyHousingTotal") as? Int
//         let girlHousingTotal = UserDefaults.standard.object(forKey: "GirlHousingTotal") as? Int
//
//        構造体にアクセス
        let bothHousing = testStruct()
    
        
         //        BothTotalSumで使うために足し算！
        let bothHousingTotal = bothHousing.boyHousingTotal! + bothHousing.girlHousingTotal!
        UserDefaults.standard.set(bothHousingTotal, forKey: "bothHousingTotal")
//
         //        型変換
        let boyHousingTotalSecond:String = String("\(bothHousing.boyHousingTotal)")
        let girlHousingTotalSecond:String = String("\(bothHousing.girlHousingTotal)")
         
         //        それぞれの娯楽費をラベルに表示
         bothHousingBoy.text = boyHousingTotalSecond
         bothHousingGirl.text = girlHousingTotalSecond
     }
}

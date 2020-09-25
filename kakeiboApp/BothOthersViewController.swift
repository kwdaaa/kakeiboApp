//
//  BothOthersViewController.swift
//  kakeiboApp
//
//  Created by 川田 文香 on 2020/09/24.
//  Copyright © 2020 kwdaaa.com. All rights reserved.
//

import UIKit

class BothOthersViewController: UIViewController {
    //    彼氏のその他の合計を表示するラベル
    @IBOutlet var bothOthersBoy:UILabel!
    //    彼女のその他の合計を表示するラベル
    @IBOutlet var bothOthersGirl:UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        //           //        それぞれのその他の合計を変数に入れた！
        //           let boyOthersTotal = UserDefaults.standard.object(forKey: "BoyOthersTotal") as! Int
        //           let girlOthersTotal = UserDefaults.standard.object(forKey: "GirlOthersTotal") as! Int
        
        //構造体にアクセス
        let bothOthers = testStruct()
        
        
        //                BothTotalSumで使うために足し算！
        let bothOthersTotal = bothOthers.boyOthersTotal! + bothOthers.girlOthersTotal!
        UserDefaults.standard.set(bothOthersTotal, forKey: "bothOthersTotal")
        
        //        型変換
        let boyOthersTotalSecond:String = String("\(bothOthers.boyOthersTotal)")
        let girlOthersTotalSecond:String = String("\(bothOthers.girlOthersTotal)")
        
        //        それぞれのその他をラベルに表示
        bothOthersBoy.text = boyOthersTotalSecond
        bothOthersGirl.text = girlOthersTotalSecond
    }
}

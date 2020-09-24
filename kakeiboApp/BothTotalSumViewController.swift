//
//  BothTotalSumViewController.swift
//  kakeiboApp
//
//  Created by 川田 文香 on 2020/09/24.
//  Copyright © 2020 kwdaaa.com. All rights reserved.
//

import UIKit

class BothTotalSumViewController: UIViewController {
    
    //    彼氏の合計を表示するラベル
    @IBOutlet var boyTotalSumLabel:UILabel!
    //    彼女の合計を表示するラベル
    @IBOutlet var girlTotalSumLabel:UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        let bothTotal = testStruct()
        
        //        彼氏分の合計を計算
        let boyTotalSum = bothTotal.boyFoodTotal! + bothTotal.boyDailyTotal! + bothTotal.boyLeisureTotal! + bothTotal.boyHousingTotal! + bothTotal.boyOthersTotal
        //       　彼氏の合計の型をIntからStringに変換
        let boyTotalSumSecond:String = String("\(boyTotalSum)")
        //        ラベルに表示
        boyTotalSumLabel.text = boyTotalSumSecond
        //        ユーザーデフォルトでセット　ホームに持っていく
        UserDefaults.standard.set(boyTotalSum, forKey: "boyTotalSumSecond")
        
        
        
        
        //        彼女の合計を計算
        let girlTotalSum = bothTotal.girlFoodTotal! + bothTotal.girlDailyTotal! + bothTotal.girlLeisureTotal! + bothTotal.girlLeisureTotal! + bothTotal.girlOthersTotal
        //        彼女の合計の型をIntからStringに変換
        let girlTotalSumSecond:String = String("\(girlTotalSum)")
        //        ラベルに表示
        girlTotalSumLabel.text = girlTotalSumSecond
        //        ユーザーデフォルトでセット　ホームに持っていく
        UserDefaults.standard.set(girlTotalSum, forKey: "girlTotalSumSecond")
        
    }
}

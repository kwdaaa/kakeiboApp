//
//  testFile.swift
//  kakeiboApp
//
//  Created by 川田 文香 on 2020/09/24.
//  Copyright © 2020 kwdaaa.com. All rights reserved.
//

import Foundation

struct testStruct {
    
    //    それぞれの食費の合計を変数に入れた
    let boyFoodTotal = UserDefaults.standard.object(forKey: "BoyFoodTotal") as? Int ?? 0
    let girlFoodTotal = UserDefaults.standard.object(forKey: "GirlFoodTotal") as? Int ?? 0
    
    //        それぞれの日用品の合計を変数に入れた！
    let boyDailyTotal = UserDefaults.standard.object(forKey: "BoyDailyTotal") as? Int ?? 0
    let girlDailyTotal = UserDefaults.standard.object(forKey: "GirlDailyTotal") as? Int ?? 0
    
    //        それぞれの娯楽費の合計を変数に入れた！
    let boyLeisureTotal = UserDefaults.standard.object(forKey: "BoyLeisureTotal") as? Int ?? 0
    let girlLeisureTotal = UserDefaults.standard.object(forKey: "GirlLeisureTotal") as? Int ?? 0
    
    //        それぞれの固定費の合計を変数に入れた！
    let boyHousingTotal = UserDefaults.standard.object(forKey: "BoyHousingTotal") as? Int ?? 0
    let girlHousingTotal = UserDefaults.standard.object(forKey: "GirlHousingTotal") as? Int ?? 0
    
    //        それぞれのその他の合計を変数に入れた！
    let boyOthersTotal = UserDefaults.standard.object(forKey: "BoyOthersTotal") as? Int ?? 0
    let girlOthersTotal = UserDefaults.standard.object(forKey: "GirlOthersTotal") as? Int ?? 0
    
    
    let boyTotalTotal = UserDefaults.standard.object(forKey: "BoyTotalSumSecond") as? Int ?? 0
    let girlTotalTotal = UserDefaults.standard.object(forKey: "GirlTotalSumSecond") as? Int ?? 0
    
    
}
struct categoryStruct {
    let categoryArray = ["食 費","日 用 品","娯 楽 費","固 定 費","そ の 他"]
}



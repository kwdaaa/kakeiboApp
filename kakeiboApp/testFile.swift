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
    let boyFoodTotal = UserDefaults.standard.object(forKey: "BoyFoodTotal") as? Int
    let girlFoodTotal = UserDefaults.standard.object(forKey: "GirlFoodTotal") as? Int
    
    //        それぞれの日用品の合計を変数に入れた！
    let boyDailyTotal = UserDefaults.standard.object(forKey: "BoyDailyTotal") as? Int
    let girlDailyTotal = UserDefaults.standard.object(forKey: "GirlDailyTotal") as? Int
    
    //        それぞれの娯楽費の合計を変数に入れた！
    let boyLeisureTotal = UserDefaults.standard.object(forKey: "BoyLeisureTotal") as? Int
    let girlLeisureTotal = UserDefaults.standard.object(forKey: "GirlLeisureTotal") as? Int
    
    //        それぞれの固定費の合計を変数に入れた！
    let boyHousingTotal = UserDefaults.standard.object(forKey: "BoyHousingTotal") as? Int
    let girlHousingTotal = UserDefaults.standard.object(forKey: "GirlHousingTotal") as? Int
    
    //        それぞれのその他の合計を変数に入れた！
    let boyOthersTotal = UserDefaults.standard.object(forKey: "BoyOthersTotal") as! Int
    let girlOthersTotal = UserDefaults.standard.object(forKey: "GirlOthersTotal") as! Int
    
    
}
struct categoryStruct {
    let categoryArray = ["食 費","日 用 品","娯 楽 費","固 定 費","そ の 他"]
}

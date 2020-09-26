//
//  ViewController.swift
//  kakeiboApp
//
//  Created by 川田 文香 on 2020/09/20.
//  Copyright © 2020 kwdaaa.com. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let boyTotalSum = UserDefaults.standard.object(forKey: "boyTotalSumSecond") as? Int
        let girlTotalSum = UserDefaults.standard.object(forKey: "girlTotalSecond") as? Int

        
        if UserDefaults.standard.object(forKey: "boyTotalSumSecond") == nil,UserDefaults.standard.object(forKey: "girlTotalSecond") == nil{
            
            UserDefaults.standard.set(0,forKey:"boyTotalSumSecond")
            UserDefaults.standard.set(0,forKey:"girlTotalSumSecond")
            
        }

    }
    
    //    食費のラベル
    @IBOutlet var bothFoodTotalLabel:UILabel!
    //    日用品のラベル
    @IBOutlet var bothDailyTotalLabel:UILabel!
    //    娯楽費のラベル
    @IBOutlet var bothLeisureTotalLabel:UILabel!
    //    固定費のラベル
    @IBOutlet var bothHousingTotalLabel:UILabel!
    //    その他のラベル
    @IBOutlet var bothOthersTotalLabel:UILabel!
    //    合計のラベル
    @IBOutlet var bothTotalSumLabel:UILabel!
    
    
    override func viewWillAppear(_ animated: Bool) {
        //     食費
        let bothFoodTotalSum =  UserDefaults.standard.object(forKey: "bothFoodTotal")
        //        日用品
        let bothDailyTotalSum = UserDefaults.standard.object(forKey: "bothDailyTotal")
        //        娯楽費
        let bothLeisureTotalSum = UserDefaults.standard.object(forKey: "bothLeisureTotal")
        //        固定費
        let bothHousingTotalSum = UserDefaults.standard.object(forKey: "bothHousingTotal")
        //        その他
         let bothOthersTotalSum = UserDefaults.standard.object(forKey: "bothOthersTotal")
        //        合計を持ってくる
        
        
        //        let bothtest = testStruct()
        
        let boyTotalSum = UserDefaults.standard.object(forKey: "boyTotalSumSecond") as! Int
        let girlTotalSum = UserDefaults.standard.object(forKey: "girlTotalSumSecond") as! Int
        
        //        足し算
        let bothTotalSum = boyTotalSum + girlTotalSum

//        型変換
        let bothTotalSumThird:String = String("\(bothTotalSum)")
        
        //       全てテキストに表示
        bothFoodTotalLabel.text = bothFoodTotalSum as? String
        bothDailyTotalLabel.text = bothDailyTotalSum as? String
        bothLeisureTotalLabel.text = bothLeisureTotalSum as? String
        bothHousingTotalLabel.text = bothHousingTotalSum as? String
        bothOthersTotalLabel.text = bothOthersTotalSum as? String
        bothTotalSumLabel.text = bothTotalSumThird
        
        
    }
    
    //設定画面に飛ぶボタン
    
    @IBAction func setTap(_sender:UITapGestureRecognizer){
        let SetViewController = self.storyboard?.instantiateViewController(withIdentifier: "SetView") as! SetViewController
        self.present(SetViewController,animated: true,completion: nil)
        
    }
    
    // 画面遷移
    
    // タブバーの画面遷移
    // 彼氏の家計（BoyFinanceViewController）
    @IBOutlet var tapBoyFinance: UIImageView!
    @IBAction func tapBoyFinance(_ sender: Any) {
    
    let BoyFinanceViewController = self.storyboard?.instantiateViewController(withIdentifier: "BoyFinance") as! BoyFinanceViewController
    self.present(BoyFinanceViewController, animated: true, completion: nil)
}
    
    
    
}





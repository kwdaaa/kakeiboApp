//
//  BoyFinanceViewController.swift
//  kakeiboApp
//
//  Created by 川田 文香 on 2020/09/24.
//  Copyright © 2020 kwdaaa.com. All rights reserved.
//

import UIKit

class BoyFinanceViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //    食費を表示するラベル
    @IBOutlet var boyFinanceFoodLabel:UILabel!
    //　　日用品を表示するラベル
    @IBOutlet var boyFinanceDailyLabel:UILabel!
    //　　娯楽費を表示するラベル
    @IBOutlet var boyFinanceLeisureLabel:UILabel!
    //   固定費を表示するラベル
    @IBOutlet var boyFinanceHousingLabel:UILabel!
    //   その他を表示するラベル
    @IBOutlet var boyFinanceOthersLabel:UILabel!
    //   合計を表示するラベル
    @IBOutlet var boyFinanceTotalLabel:UILabel!
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        let boyFinance = testStruct()
        //        食費をラベルに表示その前に型変換。持ってきてるのは、testFilelからだよ 以下同じ
        
        let boyFinanceFoodSecond:String = String("\(boyFinance.boyFoodTotal)")
        let boyFinanceDailySecond:String = String("\(boyFinance.boyDailyTotal)")
        let boyFinanceLeisureSecond:String = String("\(boyFinance.boyLeisureTotal)")
        let boyFinanceHousingSecond:String = String("\(boyFinance.boyHousingTotal)")
        let boyFinanceOthersSecond:String = String("\(boyFinance.boyOthersTotal)")
        let boyFinanceTotalSecond:String = String("\(boyFinance.boyTotalTotal)")
        
        
        boyFinanceFoodLabel.text = boyFinanceFoodSecond
        boyFinanceDailyLabel.text = boyFinanceDailySecond
        boyFinanceLeisureLabel.text = boyFinanceLeisureSecond
        boyFinanceHousingLabel.text = boyFinanceHousingSecond
        boyFinanceOthersLabel.text = boyFinanceOthersSecond
        boyFinanceTotalLabel.text = boyFinanceTotalSecond
    }
    
    //    ここからは、タップジェスチャーからの画面遷移
    //        食費に画面遷移
    @IBAction func boyFinanceTap(_sender:UITapGestureRecognizer){
        let BoyFoodViewController = self.storyboard?.instantiateViewController(withIdentifier: "BoyFood") as! BoyFoodViewController
        self.present(BoyFoodViewController, animated: true, completion: nil)
    }
    
    
    //    日用品に画面遷移
    @IBAction func boyDailyTap(_sender:UITapGestureRecognizer){
        //        日用品に画面遷移
        let BoyDailyViewController = self.storyboard?.instantiateViewController(identifier: "BoyDaily") as! BoyDailyViewController
        self.present(BoyDailyViewController,animated: true,completion: nil)
    }
    
    
    
    //        娯楽費に画面遷移
    @IBAction func boyLeisureTap(_sender:UITapGestureRecognizer ){
        let BoyLeisureViewController = self.storyboard?.instantiateViewController(identifier: "BoyLeisure") as! BoyLeisureViewController
        self.present(BoyLeisureViewController,animated: true, completion: nil)
    }
    
    //    固定費に画面遷移
    @IBAction func boyHousingTap(_sender:UITapGestureRecognizer){
        let BoyHousingViewController = self.storyboard?.instantiateViewController(withIdentifier: "BoyHousing")
            as! BoyHousingViewController
        self.present(BoyHousingViewController,animated: true,completion: nil)
    }
    
    //    その他に画面遷移
    @IBAction func boyOthersTap(_sender:UITapGestureRecognizer){
        let BoyOthersViewController = self.storyboard?.instantiateViewController(withIdentifier: "Boyothers") as! BoyOthersViewController
        self.present(BoyOthersViewController,animated: true,completion: nil)
    }
    
    
}

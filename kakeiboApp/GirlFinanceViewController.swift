//
//  GirlFinanceViewController.swift
//  kakeiboApp
//
//  Created by 川田 文香 on 2020/09/24.
//  Copyright © 2020 kwdaaa.com. All rights reserved.
//

import UIKit

class GirlFinanceViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //    食費を表示するラベル
    @IBOutlet var girlFinanceFoodLabel:UILabel!
    //　　日用品を表示するラベル
    @IBOutlet var girlFinanceDailyLabel:UILabel!
    //　　娯楽費を表示するラベル
    @IBOutlet var girlFinanceLeisureLabel:UILabel!
    //   固定費を表示するラベル
    @IBOutlet var girlFinanceHousingLabel:UILabel!
    //   その他を表示するラベル
    @IBOutlet var girlFinanceOthersLabel:UILabel!
    //   合計を表示するラベル
    @IBOutlet var girlFinanceTotalLabel:UILabel!
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        let girlFinance = testStruct()
        //        食費をラベルに表示その前に型変換。持ってきてるのは、testFilelからだよ 以下同じ
        
        let girlFinanceFoodSecond:String = String("\(girlFinance.girlFoodTotal)")
        let girlFinanceDailySecond:String = String("\(girlFinance.girlDailyTotal)")
        let girlFinanceLeisureSecond:String = String("\(girlFinance.girlLeisureTotal)")
        let girlFinanceHousingSecond:String = String("\(girlFinance.girlHousingTotal)")
        let girlFinanceOthersSecond:String = String("\(girlFinance.girlOthersTotal)")
        let girlFinanceTotalSecond:String = String("\(girlFinance.girlTotalTotal)")
        
        
        
        girlFinanceFoodLabel.text = girlFinanceFoodSecond
        girlFinanceDailyLabel.text = girlFinanceDailySecond
        girlFinanceLeisureLabel.text = girlFinanceLeisureSecond
        girlFinanceHousingLabel.text = girlFinanceHousingSecond
        girlFinanceOthersLabel.text = girlFinanceOthersSecond
        girlFinanceTotalLabel.text = girlFinanceTotalSecond
    }
    
    
    //    ここからは、タップジェスチャー？ボタンからの画面遷移 今は、タップジェスチャーにしてあるよ
    
    
    //        食費に画面遷移
    @IBAction func girlFinanceTap(_sender:UITapGestureRecognizer){
        let GirlFoodViewController = self.storyboard?.instantiateViewController(withIdentifier: "GirlFood") as! GirlFoodViewController
        self.present(GirlFoodViewController, animated: true, completion: nil)
    }
    
    
    //    日用品に画面遷移
    @IBAction func girlDailyTap(_sender:UITapGestureRecognizer){
        //        日用品に画面遷移
        let GirlDailyViewController = self.storyboard?.instantiateViewController(identifier: "GirlDaily") as! GirlDailyViewController
        self.present(GirlDailyViewController,animated: true,completion: nil)
    }
    
    
    
    //        娯楽費に画面遷移
    @IBAction func girlLeisureTap(_sender:UITapGestureRecognizer ){
        let GirlLeisureViewController = self.storyboard?.instantiateViewController(identifier: "GirlLeisure") as! GirlLeisureViewController
        self.present(GirlLeisureViewController,animated: true, completion: nil)
    }
    
    //    固定費に画面遷移
    @IBAction func girlHousingTap(_sender:UITapGestureRecognizer){
        let GirlHousingViewController = self.storyboard?.instantiateViewController(withIdentifier: "GirlHousing")
            as! GirlHousingViewController
        self.present(GirlHousingViewController,animated: true,completion: nil)
    }
    
    //    その他に画面遷移
    @IBAction func girlOthersTap(_sender:UITapGestureRecognizer){
        let GirlOthersViewController = self.storyboard?.instantiateViewController(withIdentifier: "Girlothers") as! GirlOthersViewController
        self.present(GirlOthersViewController,animated: true,completion: nil)
    }
    
}

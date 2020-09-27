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
    
    
    
    
    // // // // // // // // // // // // // // // // // // // //
    // 画面遷移
    // 01:タブバーの画面遷移
    // 01-1:ホーム（HomeViewController）
    @IBAction func tapHome(_ sender: Any) {
        let HomeVC = self.storyboard?.instantiateViewController(withIdentifier: "Home") as! HomeViewController
        HomeVC.modalPresentationStyle = .fullScreen
        self.present(HomeVC, animated: false, completion: nil)
    }
    
    // 01-2:彼氏の家計（BoyFinanceViewController）
    @IBAction func tapBoyFinance(_ sender: Any) {
        let BoyFinanceVC = self.storyboard?.instantiateViewController(withIdentifier: "BoyFinance") as! BoyFinanceViewController
        BoyFinanceVC.modalPresentationStyle = .fullScreen
        self.present(BoyFinanceVC, animated: false, completion: nil)
    }
    
    // 01-3:彼氏の登録（BoyRegisterViewController）
    @IBAction func tapBoyRegister(_ sender: Any) {
        let BoyRegisterVC = self.storyboard?.instantiateViewController(withIdentifier: "BoyRegister") as! BoyRegisterViewController
        BoyRegisterVC.modalPresentationStyle = .fullScreen
        self.present(BoyRegisterVC, animated: false, completion: nil)
    }
    
    // 01-4:彼女の家計（GirlFinanceViewController）
    @IBAction func tapGirlFinance(_ sender: Any) {
//        let GirlFinanceVC = self.storyboard?.instantiateViewController(withIdentifier: "GirlFinance") as! GirlFinanceViewController
//        GirlFinanceVC.modalPresentationStyle = .fullScreen
//        self.present(GirlFinanceVC, animated: false, completion: nil)
    }
    
    // 01-5:彼女の登録（GirlRegisterViewController）
    @IBAction func tapGirlRegister(_ sender: Any) {
        let GirlRegisterVC = self.storyboard?.instantiateViewController(withIdentifier: "GirlRegister") as! GirlRegisterViewController
        GirlRegisterVC.modalPresentationStyle = .fullScreen
        self.present(GirlRegisterVC, animated: false, completion: nil)
    }
    
    
    
    
    
    // 02:各カテゴリーの画面遷移
    // 02-1:食費（GirlFoodViewController）
    @IBAction func girlFinanceTap(_sender: Any){
        let GirlFoodVC = self.storyboard?.instantiateViewController(withIdentifier: "GirlFood") as! GirlFoodViewController
        GirlFoodVC.modalPresentationStyle = .fullScreen
        self.present(GirlFoodVC, animated: true, completion: nil)
    }
        
    // 02-2:日用品費（GirlDailyViewController）
    @IBAction func girlDailyTap(_sender: Any){
        //        日用品に画面遷移
        let GirlDailyVC = self.storyboard?.instantiateViewController(identifier: "GirlDaily") as! GirlDailyViewController
        GirlDailyVC.modalPresentationStyle = .fullScreen
        self.present(GirlDailyVC,animated: true,completion: nil)
    }
    
    // 02-3:娯楽費（GirlLeisureViewController）
    @IBAction func girlLeisureTap(_sender: Any){
        let GirlLeisureVC = self.storyboard?.instantiateViewController(identifier: "GirlLeisure") as! GirlLeisureViewController
        GirlLeisureVC.modalPresentationStyle = .fullScreen
        self.present(GirlLeisureVC,animated: true, completion: nil)
    }
    
    // 02-4:固定費（GirlHousingViewController）
    @IBAction func girlHousingTap(_sender: Any){
        let GirlHousingVC = self.storyboard?.instantiateViewController(withIdentifier: "GirlHousing")
            as! GirlHousingViewController
        GirlHousingVC.modalPresentationStyle = .fullScreen
        self.present(GirlHousingVC,animated: true,completion: nil)
    }
    
    // 02-5:その他（GirlOthersViewController）
    @IBAction func girlOthersTap(_sender: Any){
        let GirlOthersVC = self.storyboard?.instantiateViewController(withIdentifier: "Girlothers") as! GirlOthersViewController
        GirlOthersVC.modalPresentationStyle = .fullScreen
        self.present(GirlOthersVC,animated: true,completion: nil)
    }
    
}

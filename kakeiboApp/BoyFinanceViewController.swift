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
//        let BoyFinanceVC = self.storyboard?.instantiateViewController(withIdentifier: "BoyFinance") as! BoyFinanceViewController
//        BoyFinanceVC.modalPresentationStyle = .fullScreen
//        self.present(BoyFinanceVC, animated: false, completion: nil)
    }
    
    // 01-3:彼氏の登録（BoyRegisterViewController）
    @IBAction func tapBoyRegister(_ sender: Any) {
        let BoyRegisterVC = self.storyboard?.instantiateViewController(withIdentifier: "BoyRegister") as! BoyRegisterViewController
        BoyRegisterVC.modalPresentationStyle = .fullScreen
        self.present(BoyRegisterVC, animated: false, completion: nil)
    }
    
    // 01-4:彼女の家計（GirlFinanceViewController）
    @IBAction func tapGirlFinance(_ sender: Any) {
        let GirlFinanceVC = self.storyboard?.instantiateViewController(withIdentifier: "GirlFinance") as! GirlFinanceViewController
        GirlFinanceVC.modalPresentationStyle = .fullScreen
        self.present(GirlFinanceVC, animated: false, completion: nil)
    }
    
    // 01-5:彼女の登録（GirlRegisterViewController）
    @IBAction func tapGirlRegister(_ sender: Any) {
        let GirlRegisterVC = self.storyboard?.instantiateViewController(withIdentifier: "GirlRegister") as! GirlRegisterViewController
        GirlRegisterVC.modalPresentationStyle = .fullScreen
        self.present(GirlRegisterVC, animated: false, completion: nil)
    }
    
    
    
    
    // 02:各カテゴリーの画面遷移
    // 02-1:食費（BoyFoodViewController）
    @IBAction func tapBoyFood(_sender: Any){
        let BoyFoodVC = self.storyboard?.instantiateViewController(withIdentifier: "BoyFood") as! BoyFoodViewController
        BoyFoodVC.modalPresentationStyle = .fullScreen
        self.present(BoyFoodVC, animated: true, completion: nil)
    }
    
    // 02-2:日用品費（BoyDailyViewController）
    @IBAction func tapBoyDaily(_sender: Any){
        let BoyDailyVC = self.storyboard?.instantiateViewController(identifier: "BoyDaily") as! BoyDailyViewController
        BoyDailyVC.modalPresentationStyle = .fullScreen
        self.present(BoyDailyVC,animated: true,completion: nil)
    }
    
    // 02-3:娯楽費（BoyLeisureViewController）
    @IBAction func tapBoyLeisure(_sender: Any){
        let BoyLeisureVC = self.storyboard?.instantiateViewController(identifier: "BoyLeisure") as! BoyLeisureViewController
        BoyLeisureVC.modalPresentationStyle = .fullScreen
        self.present(BoyLeisureVC,animated: true, completion: nil)
    }
    
    // 02-4:固定費（BoyHousingViewController）
    @IBAction func tapBoyHousing(_sender: Any){
        let BoyHousingVC = self.storyboard?.instantiateViewController(withIdentifier: "BoyHousing")
            as! BoyHousingViewController
        BoyHousingVC.modalPresentationStyle = .fullScreen
        self.present(BoyHousingVC,animated: true,completion: nil)
    }
    
    // 02-5:その他（BoyOthersViewController）
    @IBAction func tapBoyOthers(_sender: Any){
        let BoyOthersVC = self.storyboard?.instantiateViewController(withIdentifier: "Boyothers") as! BoyOthersViewController
        BoyOthersVC.modalPresentationStyle = .fullScreen
        self.present(BoyOthersVC,animated: true,completion: nil)
    }
    
    
}

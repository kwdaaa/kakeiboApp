//
//  ViewController.swift
//  kakeiboApp
//
//  Created by 川田 文香 on 2020/09/20.
//  Copyright © 2020 kwdaaa.com. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController{
    
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
    
    
    
    
    // // // // // // // // // // // // // // // // // // // //
    
    // 画面遷移
    // 00:設計の画面遷移
    @IBAction func tapSet(_ sender: Any) {
        
        // セグエで紐付けています
        
    }
    
    
    // 01:タブバーの画面遷移
    // 01-1:ホーム（HomeViewController）
    @IBAction func tapHome(_ sender: Any) {
        //        let HomeVC = self.storyboard?.instantiateViewController(withIdentifier: "Home") as! HomeViewController
        //        HomeVC.modalPresentationStyle = .fullScreen
        //        self.present(HomeVC, animated: false, completion: nil)
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
    // 02-1:食費（BothFoodViewController）
    @IBAction func tapBothFood(_ sender: Any) {
    }
    
    
    // 02-2:日用品費（BothDailyViewController）
    @IBAction func tapBothDaily(_ sender: Any) {
    }
    
    
    // 02-3:娯楽費（BothLeisureViewController）
    @IBAction func tapBothLeisure(_ sender: Any) {
    }
    
    
    // 02-4:固定費（BothHousingViewController）
    @IBAction func tapBothHousing(_ sender: Any) {
    }
    
    
    // 02-5:その他（BothOthersViewController）
    @IBAction func tapBothOthers(_ sender: Any) {
    }
    
    // 02-6:合計（BothTotalSumViewController）
    @IBAction func tapBTotalSum(_ sender: Any) {
    }
    
    
}





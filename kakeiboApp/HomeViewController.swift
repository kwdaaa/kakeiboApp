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
        
        let boyTotalSum = UserDefaults.standard.object(forKey: "BoyTotalSumSecond") as? Int
        let girlTotalSum = UserDefaults.standard.object(forKey: "GirlTotalSumSecond") as? Int
        
        
        
        if UserDefaults.standard.object(forKey: "BoyTotalSumSecond") == nil,UserDefaults.standard.object(forKey: "GirlTotalSecond") == nil{
            
            UserDefaults.standard.set(0,forKey:"BoyTotalSumSecond")
            UserDefaults.standard.set(0,forKey:"GirlTotalSumSecond")
            
            
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
        let bothFoodTotalSum =  UserDefaults.standard.object(forKey: "BothFoodTotal")
        //        日用品
        let bothDailyTotalSum = UserDefaults.standard.object(forKey: "BothDailyTotal")
        //        娯楽費
        let bothLeisureTotalSum = UserDefaults.standard.object(forKey: "BothLeisureTotal")
        //        固定費
        let bothHousingTotalSum = UserDefaults.standard.object(forKey: "BothHousingTotal")
        //        その他
        let bothOthersTotalSum = UserDefaults.standard.object(forKey: "BothOthersTotal")
        //        合計を持ってくる
        
        
        //        let bothtest = testStruct()
        
        let boyTotalSum = UserDefaults.standard.object(forKey: "BoyTotalSumSecond") as! Int
        let girlTotalSum = UserDefaults.standard.object(forKey: "GirlTotalSumSecond") as! Int
        
        if UserDefaults.standard.object(forKey: "BoyTotalSumSecond") == nil{
            boyTotalSum == 0
            
        }
        if UserDefaults.standard.object(forKey: "GirlTotalSumSecond") == nil{
            girlTotalSum == 0
        }
        
        
        
        //        足し算
        let bothTotalSum = boyTotalSum + girlTotalSum
        
        UserDefaults.standard.set(bothTotalSum, forKey: "BothTotalSum")
        
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
   let SetVC = self.storyboard?.instantiateViewController(withIdentifier: "Set") as! SetViewController
        SetVC.modalPresentationStyle = .fullScreen
        self.present(SetVC, animated: true, completion: nil)
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
        let BothFoodVC = self.storyboard?.instantiateViewController(withIdentifier: "BothFood") as! BothFoodViewController
               BothFoodVC.modalPresentationStyle = .fullScreen
               self.present(BothFoodVC, animated: true, completion: nil)
    }
    
    
    // 02-2:日用品費（BothDailyViewController）
    @IBAction func tapBothDaily(_ sender: Any) {
        let BothDailyVC = self.storyboard?.instantiateViewController(withIdentifier: "BothDaily") as! BothDailyViewController
               BothDailyVC.modalPresentationStyle = .fullScreen
               self.present(BothDailyVC, animated: true, completion: nil)
    }
    
    
    // 02-3:娯楽費（BothLeisureViewController）
    @IBAction func tapBothLeisure(_ sender: Any) {
        let BothLeisureVC = self.storyboard?.instantiateViewController(withIdentifier: "BothLeisure") as! BothLeisureViewController
                      BothLeisureVC.modalPresentationStyle = .fullScreen
                      self.present(BothLeisureVC, animated: true, completion: nil)
    }
    
    
    // 02-4:固定費（BothHousingViewController）
    @IBAction func tapBothHousing(_ sender: Any) {
        let BothHousingVC = self.storyboard?.instantiateViewController(withIdentifier: "BothHousing") as! BothHousingViewController
        BothHousingVC.modalPresentationStyle = .fullScreen
        self.present(BothHousingVC, animated: true, completion: nil)
    }
    
    
    // 02-5:その他（BothOthersViewController）
    @IBAction func tapBothOthers(_ sender: Any) {
        let BothOthersVC = self.storyboard?.instantiateViewController(withIdentifier: "BothOthers") as! BothOthersViewController
        BothOthersVC.modalPresentationStyle = .fullScreen
        self.present(BothOthersVC, animated: true, completion: nil)
    }
    
    // 02-6:合計（BothTotalSumViewController）
    @IBAction func tapBothTotalSum(_ sender: Any) {
        let BothTotalSumVC = self.storyboard?.instantiateViewController(withIdentifier: "BothTotalSum") as! BothTotalSumViewController
        BothTotalSumVC.modalPresentationStyle = .fullScreen
        self.present(BothTotalSumVC, animated: true, completion: nil)
    }
    
    
}





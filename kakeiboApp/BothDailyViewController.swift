//
//  BothDailyViewController.swift
//  kakeiboApp
//
//  Created by 川田 文香 on 2020/09/24.
//  Copyright © 2020 kwdaaa.com. All rights reserved.
//

import UIKit

class BothDailyViewController: UIViewController {
    //    彼氏の日用品の合計を表示するラベル
    @IBOutlet var bothDailyBoy:UILabel!
    //    彼女の日用品合計を表示するラベル
    @IBOutlet var bothDailyGirl:UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let bothDaily = testStruct()
      
        if bothDaily.boyDailyTotal == nil{
            
            bothDaily.boyDailyTotal == 0
        }
        
        if bothDaily.girlDailyTotal == nil{
            
            bothDaily.girlDailyTotal == 0
        }
        
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        //       //        それぞれの日用品の合計を変数に入れた！
               let boyDailyTotal = UserDefaults.standard.object(forKey: "BoyDailyTotal") as? Int
               let girlDailyTotal = UserDefaults.standard.object(forKey: "GirlDailyTotal") as? Int
        
        
//        //    構造体にアクセス
//        let bothDaily = testStruct()
        
        viewDidLoad()
        
        //        BothTotalSumで使うために足し算！
        let bothDailyTotal = boyDailyTotal! + girlDailyTotal!
        UserDefaults.standard.set(bothDailyTotal, forKey: "BothDailyTotal")
        //
        //        型変換
        let boyDailyTotalSecond:String = String("\(boyDailyTotal)")
        let girlDailyTotalSecond:String = String("\(girlDailyTotal)")
        
        //        それぞれの日用品をラベルに表示
        bothDailyBoy.text = boyDailyTotalSecond
        bothDailyGirl.text = girlDailyTotalSecond
    }
    
    
    
    
    
    
    
    
    // // // // // // // // // // // // // // // // // // // //
    // 画面遷移
    // 00:戻る（ホームへ）の画面遷移
    @IBAction func tapBack(_ sender: Any) {
        let HomeVC = self.storyboard?.instantiateViewController(withIdentifier: "Home") as! HomeViewController
        HomeVC.modalPresentationStyle = .fullScreen
        self.present(HomeVC, animated: false, completion: nil)
    }
    
    
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
}

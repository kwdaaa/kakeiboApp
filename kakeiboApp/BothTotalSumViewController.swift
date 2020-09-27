//
//  BothTotalSumViewController.swift
//  kakeiboApp
//
//  Created by 川田 文香 on 2020/09/24.
//  Copyright © 2020 kwdaaa.com. All rights reserved.
//

import UIKit

class BothTotalSumViewController: UIViewController {
    
    //    彼氏の合計を表示するラベル
    @IBOutlet var boyTotalSumLabel:UILabel!
    //    彼女の合計を表示するラベル
    @IBOutlet var girlTotalSumLabel:UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let bothTotal = testStruct()
        
        if bothTotal.boyFoodTotal == 0{
            
            bothTotal.boyFoodTotal == 0
        }
        
        if bothTotal.boyDailyTotal == nil{
            
            bothTotal.boyDailyTotal == 0
            
        }
        
        if bothTotal.boyLeisureTotal == nil{
            
            bothTotal.boyLeisureTotal == 0
            
        }
        if bothTotal.boyHousingTotal == nil{
            
            bothTotal.boyHousingTotal == 0
            
        }
        if bothTotal.boyOthersTotal == nil{
            
            bothTotal.boyOthersTotal == 0
            
        }
        
        
        //        ここここ
        if bothTotal.girlFoodTotal == nil{
            
            bothTotal.girlFoodTotal == 0
            
        }
        
        if bothTotal.girlDailyTotal == nil{
            
            bothTotal.girlDailyTotal == 0
            
        }
        
        if bothTotal.girlLeisureTotal == nil{
            
            bothTotal.girlLeisureTotal == 0
            
        }
        
        
        if bothTotal.girlHousingTotal == nil{
            
            bothTotal.girlHousingTotal == 0
            
        }
        
        if bothTotal.girlOthersTotal == nil{
            
            bothTotal.girlOthersTotal == 0
            
        }
        
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        
//                let bothTotal = testStruct()

        viewDidLoad()
        
        
        let boyFoodTotal = UserDefaults.standard.object(forKey: "BoyFoodTotal") as! Int ?? 0
        let boyDailyTotal = UserDefaults.standard.object(forKey: "BoyDailyTotal") as! Int ?? 0
        let boyLeisureTotal = UserDefaults.standard.object(forKey: "BoyLeisureTotal") as! Int ?? 0
        let boyHousingTotal = UserDefaults.standard.object(forKey: "BoyHousingTotal")as! Int ?? 0
        let boyOthersTotal = UserDefaults.standard.object(forKey: "BoyOthersTotal")as! Int ?? 0
        
        
        
        //        彼氏分の合計を計算
        let boyTotalSum = boyFoodTotal + boyDailyTotal + boyLeisureTotal + boyHousingTotal + boyOthersTotal
        
        print(boyTotalSum)
        
        //       　彼氏の合計の型をIntからStringに変換
        let boyTotalSumSecond:String = String("\(boyTotalSum)")
        //        ラベルに表示
        boyTotalSumLabel.text = boyTotalSumSecond
        //        ユーザーデフォルトでセット　ホームに持って
        UserDefaults.standard.set(boyTotalSum, forKey: "BoyTotalSumSecond")
        
        
        
        
        let girlFoodTotal = UserDefaults.standard.object(forKey: "GirlFoodTotal") as! Int
        let girlDailyTotal = UserDefaults.standard.object(forKey: "GirlDailyTotal") as! Int
        let girlLeisureTotal = UserDefaults.standard.object(forKey: "GirlLeisureTotal") as! Int
        let girlHousingTotal = UserDefaults.standard.object(forKey: "GirlHousingTotal")as! Int
        let girlOthersTotal = UserDefaults.standard.object(forKey: "GirlOthersTotal")as! Int
        
        
        //               彼女の合計を計算
        let girlTotalSum = girlFoodTotal + girlDailyTotal + girlLeisureTotal + girlHousingTotal + girlOthersTotal
        
        
        //        彼女の合計の型をIntからStringに変換
        let girlTotalSumSecond:String = String("\(girlTotalSum)")
        //        ラベルに表示
        girlTotalSumLabel.text = girlTotalSumSecond
        //        ユーザーデフォルトでセット　ホームに持っていく
        UserDefaults.standard.set(girlTotalSum, forKey: "girlTotalSumSecond")

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

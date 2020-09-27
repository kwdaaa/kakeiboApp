//
//  BothLeisureViewController.swift
//  kakeiboApp
//
//  Created by 川田 文香 on 2020/09/24.
//  Copyright © 2020 kwdaaa.com. All rights reserved.
//
import UIKit

class BothLeisureViewController: UIViewController {
    //    彼氏の娯楽費の合計を表示するラベル
    @IBOutlet var bothLeisureBoy:UILabel!
    //    彼女の娯楽費の合計を表示するラベル
    @IBOutlet var bothLeisureGirl:UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        let bothLeisure = testStruct()
        
        if bothLeisure.boyLeisureTotal == nil{
            
            bothLeisure.boyLeisureTotal == 0
        }
        
        if bothLeisure.girlLeisureTotal == nil{
            
            bothLeisure.girlLeisureTotal == 0
        }
        
        
            
        }
    
    
    override func viewWillAppear(_ animated: Bool) {
        
//       //        それぞれの娯楽費の合計を変数に入れた！
       let boyLeisureTotal = UserDefaults.standard.object(forKey: "BoyLeisureTotal") as? Int ?? 0
       let girlLeisureTotal = UserDefaults.standard.object(forKey: "GirlLeisureTotal") as? Int ?? 0
    
////    構造体にアクセス
//    let bothLeisure = testStruct()
    
       viewDidLoad()
       //        BothTotalSumで使うために足し算！
    let bothLeisureTotal = boyLeisureTotal + girlLeisureTotal
       UserDefaults.standard.set(bothLeisureTotal, forKey: "BothLeisureTotal")
//
       //        型変換
    let boyLeisureTotalSecond:String = String("\(boyLeisureTotal)")
    let girlLeisureTotalSecond:String = String("\(girlLeisureTotal)")
       
       //        それぞれの娯楽費をラベルに表示
       bothLeisureBoy.text = boyLeisureTotalSecond
       bothLeisureGirl.text = girlLeisureTotalSecond
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

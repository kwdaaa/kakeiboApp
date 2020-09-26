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
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        let bothTotal = testStruct()
        
        //        彼氏分の合計を計算
        let boyTotalSum = bothTotal.boyFoodTotal! + bothTotal.boyDailyTotal! + bothTotal.boyLeisureTotal! + bothTotal.boyHousingTotal! + bothTotal.boyOthersTotal!
        //       　彼氏の合計の型をIntからStringに変換
        let boyTotalSumSecond:String = String("\(boyTotalSum)")
        //        ラベルに表示
        boyTotalSumLabel.text = boyTotalSumSecond
        //        ユーザーデフォルトでセット　ホームに持って
        UserDefaults.standard.set(boyTotalSum, forKey: "boyTotalSumSecond")
        
        
        
        
        //        彼女の合計を計算
        let girlTotalSum = bothTotal.girlFoodTotal! + bothTotal.girlDailyTotal! + bothTotal.girlLeisureTotal! + bothTotal.girlLeisureTotal! + bothTotal.girlOthersTotal!
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
        self.dismiss(animated: true, completion: nil)
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

//
//  TestAlertViewController.swift
//  kakeiboApp
//
//  Created by 川田 文香 on 2020/09/27.
//  Copyright © 2020 kwdaaa.com. All rights reserved.
//

import UIKit

class TestAlertViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    
    // リセットのアラート
       func resetShowAlert(){
           // アラートダイアログを生成
           let alertController = UIAlertController(title: "本当にリセットしますか",
                                                   message: "\n全ての家計記録を削除します。",
                                                   preferredStyle: UIAlertController.Style.alert)
           // いいえボタンがタップされた時の処理
           let nonresetAction = UIAlertAction(title: "いいえ",
                                              style: UIAlertAction.Style.cancel, handler: { action in})
           //いいえボタンを追加
           alertController.addAction(nonresetAction)
           
           // はいボタンがタップされた時の処理
           let resetAction = UIAlertAction(title: "はい", style: UIAlertAction.Style.default, handler:{(action: UIAlertAction!) in
               
               UserDefaults.standard.removeObject(forKey: "BothTotalSum")
               
               UserDefaults.standard.removeObject(forKey: "BoyTotalSumSecond")
               UserDefaults.standard.removeObject(forKey: "GirlTotalSumSecond")
               
               UserDefaults.standard.removeObject(forKey: "BoyFoodTotal")
               UserDefaults.standard.removeObject(forKey: "BoyDailyTotal")
               UserDefaults.standard.removeObject(forKey: "BoyLeisureTotal")
               UserDefaults.standard.removeObject(forKey: "BoyHousingTotal")
               UserDefaults.standard.removeObject(forKey: "BoyOthersTotal")
               
               UserDefaults.standard.removeObject(forKey: "GirlFoodTotal")
               UserDefaults.standard.removeObject(forKey: "GirlDailyTotal")
               UserDefaults.standard.removeObject(forKey: "GirlLeisureTotal")
               UserDefaults.standard.removeObject(forKey: "GirlHousingTotal")
               UserDefaults.standard.removeObject(forKey: "GirlOthersTotal")
               
               UserDefaults.standard.removeObject(forKey: "BoyFood")
               UserDefaults.standard.removeObject(forKey: "BoyDaily")
               UserDefaults.standard.removeObject(forKey: "BoyLeisure")
               UserDefaults.standard.removeObject(forKey: "BoyHousing")
               UserDefaults.standard.removeObject(forKey: "Boyothers")
               
               UserDefaults.standard.removeObject(forKey: "GirlFood")
               UserDefaults.standard.removeObject(forKey: "GirlDaily")
               UserDefaults.standard.removeObject(forKey: "GirlLeisure")
               UserDefaults.standard.removeObject(forKey: "GirlHousing")
               UserDefaults.standard.removeObject(forKey: "Girlothers")
               
               UserDefaults.standard.removeObject(forKey: "BothFoodTotal")
               UserDefaults.standard.removeObject(forKey: "BothDailyTotal")
               UserDefaults.standard.removeObject(forKey: "BothLeisureTotal")
               UserDefaults.standard.removeObject(forKey: "BothHousingTotal")
               UserDefaults.standard.removeObject(forKey: "BothOthersTotal")
               
               
               let storyboard: UIStoryboard = self.storyboard!
               let resetView = storyboard.instantiateViewController(withIdentifier: "reset")as! ResetViewController
               resetView.modalPresentationStyle = .fullScreen
               self.present(resetView, animated: true, completion: nil)
               
           })
           // はいボタンを追加
           alertController.addAction(resetAction)
           
           
           // アラートダイアログを表示
           present(alertController, animated: true, completion: nil)
           
           
       }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

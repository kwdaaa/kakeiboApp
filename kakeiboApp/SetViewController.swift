//
//  SetViewController.swift
//  kakeiboApp
//
//  Created by 川田 文香 on 2020/09/24.
//  Copyright © 2020 kwdaaa.com. All rights reserved.
//

import UIKit

class SetViewController: UIViewController{
//    UIGestureRecognizerDelegate
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

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
    
    
    
    // 破局のアラート
    func breakShowAlert(){
        
        // アラートダイアログを生成
        let alertController = UIAlertController(title: "本当にお別れしますか",
                                                message: "\n全ての家計記録を削除し、\nお付き合い前の関係性に戻ります。",
                                                preferredStyle: UIAlertController.Style.alert)
        
        // 別れたくないボタンがタップされた時の処理
        let nonbreakAction = UIAlertAction(title: "別れたくない",
                                           style: UIAlertAction.Style.cancel, handler: { action in})
        // 別れたくないボタンを追加
        alertController.addAction(nonbreakAction)
        
        
        // 別れるボタンがタップされた時の処理
        let breakAction = UIAlertAction(title: "別れる", style: UIAlertAction.Style.default, handler:{(action: UIAlertAction!) in
            let storyboard: UIStoryboard = self.storyboard!
            let breakView = storyboard.instantiateViewController(withIdentifier: "break")as! BreakViewController
            breakView.modalPresentationStyle = .fullScreen
            self.present(breakView, animated: true, completion: nil)

        })
        
        // 別れるボタンを追加
        alertController.addAction(breakAction)
        
        
        // アラートダイアログを表示
        present(alertController, animated: true, completion: nil)
        
    }
    
    
    
    
    
 // UITapGestureRecognizer
    // シェアのタップジェスチャー
    @IBAction func tapShare(_ sender: Any) {
        // 共有する項目
        let shareText = "ふたりの家計"
        
        let activityItems = [shareText] as [Any]

        let activityVC = UIActivityViewController(activityItems: activityItems, applicationActivities: nil)


         // 使用しないアクティビティタイプ
         let excludedActivityTypes = [
         UIActivity.ActivityType.postToFacebook,
         UIActivity.ActivityType.postToTwitter,
         UIActivity.ActivityType.message,
         UIActivity.ActivityType.saveToCameraRoll,
         UIActivity.ActivityType.print
         ]

         activityVC.excludedActivityTypes = excludedActivityTypes

        // UIActivityViewControllerを表示
        self.present(activityVC, animated: true, completion: nil)
    }
    
        // リセットのタップジェスチャー
    @IBAction func tapReset(_ sender: Any) {
        // アラートを出す
        resetShowAlert()
    }
        
    // 破局のタップジェスチャー
   @IBAction func tapBreak(_ sender: Any) {
        // アラートを出す
        breakShowAlert()
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

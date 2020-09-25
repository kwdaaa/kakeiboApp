//
//  SetViewController.swift
//  kakeiboApp
//
//  Created by 川田 文香 on 2020/09/24.
//  Copyright © 2020 kwdaaa.com. All rights reserved.
//

import UIKit

class SetViewController: UIViewController,UIGestureRecognizerDelegate {
    

    
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
            self.present(breakView, animated: true, completion: nil)

        })
        
        // 別れるボタンを追加
        alertController.addAction(breakAction)
        
        
        // アラートダイアログを表示
        present(alertController, animated: true, completion: nil)
        
    }
    
    
    
    
    
    // シェアの画像
    @IBOutlet var tapShare: UIImageView!
    
    
    // リセットの画像
    @IBOutlet var tapReset: UIImageView!
    
    
    // 破局の画像
    @IBOutlet var tapBreak: UIImageView!
    
    
    
    
    
    // シェアのタップジェスチャー
    @IBAction func tapShare(_ sender: UITapGestureRecognizer) {
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
    @IBAction func tapReset(_ sender: UITapGestureRecognizer) {
        // アラートを出す
        resetShowAlert()
    }
    
    
    // 破局のタップジェスチャー
    @IBAction func tapBreak(_ sender: UITapGestureRecognizer) {
        // アラートを出す
        breakShowAlert()
    }
    
    
}

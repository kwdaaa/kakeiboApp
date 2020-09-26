//
//  ResetViewController.swift
//  kakeiboApp
//
//  Created by 川田 文香 on 2020/09/26.
//  Copyright © 2020 kwdaaa.com. All rights reserved.
//

import UIKit

class ResetViewController: UIViewController {
    
    
    // 画像の名前設定
    var img01 :UIImage = UIImage(named:"message_reset_01")!
    var img02 :UIImage = UIImage(named:"message_reset_02")!
    var img03 :UIImage = UIImage(named:"message_reset_03")!
    var img04 :UIImage = UIImage(named:"message_reset_04")!
    var img05 :UIImage = UIImage(named:"message_reset_05")!
    
    var imgArray:[UIImage] = []
    
    // 名言画像
    @IBOutlet var imageview: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imgArray = [img01,img02,img03,img04,img05]
        
        let random = Int(arc4random_uniform(3))
        
        imageview.image = imgArray[random]
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

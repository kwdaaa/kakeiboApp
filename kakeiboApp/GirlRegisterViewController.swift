//
//  GirlRegisterViewController.swift
//  kakeiboApp
//
//  Created by 川田 文香 on 2020/09/24.
//  Copyright © 2020 kwdaaa.com. All rights reserved.
//

import UIKit

class GirlRegisterViewController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        初めは、金額のとこ0 が表示されている。
        girlRegisterLabel.text = "0"
        //        初めは、カテゴリーのラベルのところは、何も表示しない
        girlCategoryLabel.text = "カテゴリーを選択してください。"
        
        girlCategoryPicker.delegate = self
        girlCategoryPicker.dataSource = self
    }
    
    //金額が表示されるラベル
    @IBOutlet var girlRegisterLabel:UILabel!
    //    カテゴリーを選択するピッカー
    @IBOutlet var girlCategoryPicker:UIPickerView!
    //    ピッカーの値を反映させるラベル
    @IBOutlet var girlCategoryLabel:UILabel!
    //カテゴリー選択時に使うボタン
    @IBAction func girlCategoryButton(_sender:UIButton!){
        //        ここを押したらピッカーが出てくる
    }
    
    //ピッカーの配列を持ってくる　testFileから
    let girlArray = categoryStruct()
    //        let categoryArray = ["食 費","日 用 品","娯 楽 費","固 定 費","そ の 他"]
    
    //    ピッカーの列数
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    //    ピッカーの中身の数
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return girlArray.categoryArray.count
    }
    //    ピッカーのタイトルを取得
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return girlArray.categoryArray[row]
        
    }
    //    選択されたピッカーの値を取得
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        var girlSelected = girlArray.categoryArray[row]
        
        //        ラベルにピッカーの値を表示する　　doneを押してから！！！！これ違う
        girlCategoryLabel.text = girlSelected
        
        //       メソッド外の変数に渡す
        girlSelected = girlSelectedCategory
        
    }
    
    //  選択されたピッカーの値を取得する変数
    var girlSelectedCategory: String = ""
    
    
    //    数字のボタンが押されたら、boyRegisterLabelに表示する
    //    ここには、ボタンの0から９とACを紐付ける。追加ボタンは別
    
    @IBAction func girlNumTap01(_ sender: Any) {
          girlRegisterLabel.text = String(1)
      }
      
      @IBAction func girlNumTap02(_ sender: Any) {
          girlRegisterLabel.text = String(2)
      }
      
      @IBAction func girlNumTap03(_ sender: Any) {
           girlRegisterLabel.text = String(3)
      }
      
      @IBAction func girlNumTap04(_ sender: Any) {
           girlRegisterLabel.text = String(4)
      }
    
      @IBAction func girlTap05(_ sender: Any) {
           girlRegisterLabel.text = String(5)
      }
      
      @IBAction func girlNumTap06(_ sender: Any) {
           girlRegisterLabel.text = String(6)
      }
      
      @IBAction func girlNumTap07(_ sender: Any) {
           girlRegisterLabel.text = String(7)
      }
      
      @IBAction func girlNumTap08(_ sender: Any) {
           girlRegisterLabel.text = String(8)
      }
      
      @IBAction func girlNumTap09(_ sender: Any) {
           girlRegisterLabel.text = String(9)
      }
      
      @IBAction func girlNumTap00(_ sender: Any) {
           girlRegisterLabel.text = String(0)
      }
      
      @IBAction func girlNumTapAC(_ sender: Any) {
           girlRegisterLabel.text = ""
      }
    
    
    
    
//    @IBAction func girlNumButton(_ sender:
//        UIButton) {
//        switch sender.titleLabel?.text  {
//        case "0":
//            girlRegisterLabel.text = String(0)
//        case "1":
//            girlRegisterLabel.text = String(1)
//        case "2":
//            girlRegisterLabel.text = String(2)
//        case "3":
//            girlRegisterLabel.text = String(3)
//        case "4":
//            girlRegisterLabel.text = String(4)
//        case "5":
//            girlRegisterLabel.text = String(5)
//        case "6":
//            girlRegisterLabel.text = String(6)
//        case "7":
//            girlRegisterLabel.text = String(7)
//        case "8":
//            girlRegisterLabel.text = String(8)
//        case "9":
//            girlRegisterLabel.text = String(9)
//        default:
//            girlRegisterLabel.text  = String("")
//        }
//    }
    
    //    追加ボタン
    @IBAction func girlAddButton(_sender:UITapGestureRecognizer!){
        if girlRegisterLabel.text != nil{
            girlRegisterLabel.text = "金額を入力してください。"
        }else{
            
            switch girlSelectedCategory {
                //           pickerで取得した値で条件分岐
                //            金額と日付を保存
            //            画面遷移
            case "食 費":
                
                UserDefaults.standard.set(girlRegisterLabel.text, forKey: "girlFood")
                //        画面遷移
                let GirlFoodViewController = self.storyboard?.instantiateViewController(withIdentifier: "GirlFood") as! GirlFoodViewController
                self.present(GirlFoodViewController, animated: true, completion: nil)
                
                
            case "日 用 品":
                
                UserDefaults.standard.set(girlRegisterLabel.text, forKey: "girlDaily")
                //                画面遷移
                let GirlDailyViewController = self.storyboard?.instantiateViewController(identifier: "GirlDaily") as! GirlDailyViewController
                self.present(GirlDailyViewController,animated: true,completion: nil)
                
                
            case "娯 楽 費":
                UserDefaults.standard.set(girlRegisterLabel.text, forKey: "girlLeisure")
                //                画面遷移
                let GirlLeisureViewController = self.storyboard?.instantiateViewController(identifier: "BoyLeisure") as! GirlLeisureViewController
                self.present(GirlLeisureViewController,animated: true, completion: nil)
                
                
            case "固 定 費":
                UserDefaults.standard.set(girlRegisterLabel.text, forKey: "girlHousing")
                //                画面遷移
                let GirlHousingViewController = self.storyboard?.instantiateViewController(withIdentifier: "GirlHousing")
                    as! GirlHousingViewController
                self.present(GirlHousingViewController,animated: true,completion: nil)
                
                
            default:
                UserDefaults.standard.set(girlRegisterLabel.text, forKey: "girlothers")
                //                画面遷移
                
                let GirlOthersViewController = self.storyboard?.instantiateViewController(withIdentifier: "GirlOthers") as! GirlOthersViewController
                self.present(GirlOthersViewController,animated: true,completion: nil)
                
            }
        }
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
//        let GirlRegisterVC = self.storyboard?.instantiateViewController(withIdentifier: "GirlRegister") as! GirlRegisterViewController
//        GirlRegisterVC.modalPresentationStyle = .fullScreen
//        self.present(GirlRegisterVC, animated: false, completion: nil)
    }
}

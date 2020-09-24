//
//  BoyRegisterViewController.swift
//  kakeiboApp
//
//  Created by 川田 文香 on 2020/09/24.
//  Copyright © 2020 kwdaaa.com. All rights reserved.
//

import UIKit

class BoyRegisterViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        boyCategoryPicker.delegate = self
        boyCategoryPicker.dataSource = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //        初めは、金額のとこ0 が表示されている。
        boyRegisterLabel.text = "0"
        //        初めは、カテゴリーのラベルのところは、何も表示しない
        boyCategoryLabel.text = "カテゴリーを選択してください。"
        
    }
    
    
    //金額が表示されるラベル
    @IBOutlet var boyRegisterLabel:UILabel!
    //    カテゴリーを選択するピッカー
    @IBOutlet var boyCategoryPicker:UIPickerView!
    //    ピッカーの値を反映させるラベル
    @IBOutlet var boyCategoryLabel:UILabel!
    //カテゴリー選択時に使うボタン
    @IBAction func boyCategoryTap(_sender:UIButton!){
        //        ここを押したらピッカーが出てくる
    }
    
    
    //ピッカーの配列を持ってくる　testFileから
    let boyArray = categoryStruct()
    
    //    let categoryArray = ["食費","日用品","娯楽費","固定費","その他"]
    
    //    ピッカーの列数
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    //    ピッカーの中身の数
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return boyArray.categoryArray.count
    }
    //    ピッカーのタイトルを取得
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return boyArray.categoryArray[row]
        
    }
    //    選択されたピッカーの値を取得
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        var boySelected = boyArray.categoryArray[row]
        
        //        ラベルにピッカーの値を表示する　　doneを押してから！！！！これ違う
        boyCategoryLabel.text = boySelected
        
        //       メソッド外の変数に渡す
        boySelected = boySelectedCategory
        
    }
    
    //  選択されたピッカーの値を取得する変数
    var boySelectedCategory: String = ""
    
    //    数字のボタンが押されたら、boyRegisterLabelに表示する
    //    ここには、ボタンの0から９とACを紐付ける。追加ボタンは別 タップジェスチャー
    
    
    @IBAction func boyNumTap01(_ sender: Any) {
        boyRegisterLabel.text = String(1)
    }
    
    @IBAction func boyNumTap02(_ sender: Any) {
        boyRegisterLabel.text = String(2)
    }
    
    @IBAction func boyNumTap03(_ sender: Any) {
         boyRegisterLabel.text = String(3)
    }
    
    @IBAction func boyNumTap04(_ sender: Any) {
         boyRegisterLabel.text = String(4)
    }
  
    @IBAction func boyTap05(_ sender: Any) {
         boyRegisterLabel.text = String(5)
    }
    
    @IBAction func boyNumTap06(_ sender: Any) {
         boyRegisterLabel.text = String(6)
    }
    
    @IBAction func boyNumTap07(_ sender: Any) {
         boyRegisterLabel.text = String(7)
    }
    
    @IBAction func boyNumTap08(_ sender: Any) {
         boyRegisterLabel.text = String(8)
    }
    
    @IBAction func boyNumTap09(_ sender: Any) {
         boyRegisterLabel.text = String(9)
    }
    
    @IBAction func boyNumTap00(_ sender: Any) {
         boyRegisterLabel.text = String(0)
    }
    
    @IBAction func boyNumTapAC(_ sender: Any) {
         boyRegisterLabel.text = ""
    }
    
    
    
    //         @IBAction func boyNumTap(_ sender:
//        UITapGestureRecognizer) {
//        switch sender.titleLabel?.text  {
//        case "0":
//            boyRegisterLabel.text = String(0)
//        case "1":
//            boyRegisterLabel.text = String(1)
//        case "2":
//            boyRegisterLabel.text = String(2)
//        case "3":
//            boyRegisterLabel.text = String(3)
//        case "4":
//            boyRegisterLabel.text = String(4)
//        case "5":
//            boyRegisterLabel.text = String(5)
//        case "6":
//            boyRegisterLabel.text = String(6)
//        case "7":
//            boyRegisterLabel.text = String(7)
//        case "8":
//            boyRegisterLabel.text = String(8)
//        case "9":
//            boyRegisterLabel.text = String(9)
//        default:
//            boyRegisterLabel.text  = String("")
//        }
//    }
    
    //    登録ボタン
    @IBAction func boyAddTap(_sender:UITapGestureRecognizer!){
        if boyRegisterLabel.text != nil{
            boyRegisterLabel.text = "金額を入力してください。"
        }else{
            
            switch boySelectedCategory {
                //           pickerで取得した値で条件分岐
                //            金額と日付を保存
            //            画面遷移
            case "食 費":
                
                UserDefaults.standard.set(boyRegisterLabel.text, forKey: "boyFood")
                //        画面遷移
                let BoyFoodViewController = self.storyboard?.instantiateViewController(withIdentifier: "BoyFood") as! BoyFoodViewController
                self.present(BoyFoodViewController, animated: true, completion: nil)
                
                
            case "日 用 品":
                
                UserDefaults.standard.set(boyRegisterLabel.text, forKey: "boyDaily")
                //                画面遷移
                let BoyDailyViewController = self.storyboard?.instantiateViewController(identifier: "BoyDaily") as! BoyDailyViewController
                self.present(BoyDailyViewController,animated: true,completion: nil)
                
                
            case "娯 楽 費":
                UserDefaults.standard.set(boyRegisterLabel.text, forKey: "boyLeisure")
                //                画面遷移
                let BoyLeisureViewController = self.storyboard?.instantiateViewController(identifier: "BoyLeisure") as! BoyLeisureViewController
                self.present(BoyLeisureViewController,animated: true, completion: nil)
                
                
            case "固 定 費":
                UserDefaults.standard.set(boyRegisterLabel.text, forKey: "boyHousing")
                //                画面遷移
                let BoyHousingViewController = self.storyboard?.instantiateViewController(withIdentifier: "BoyHousing")
                    as! BoyHousingViewController
                self.present(BoyHousingViewController,animated: true,completion: nil)
                
                
            default:
                UserDefaults.standard.set(boyRegisterLabel.text, forKey: "boyothers")
                //                画面遷移
                
                let BoyOthersViewController = self.storyboard?.instantiateViewController(withIdentifier: "Boyothers") as! BoyOthersViewController
                self.present(BoyOthersViewController,animated: true,completion: nil)
                
            }
        }
    }
}

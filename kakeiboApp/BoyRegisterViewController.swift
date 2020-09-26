//
//  BoyRegisterViewController.swift
//  kakeiboApp
//
//  Created by 川田 文香 on 2020/09/24.
//  Copyright © 2020 kwdaaa.com. All rights reserved.
//

import UIKit

class BoyRegisterViewController: UIViewController,UIPickerViewDelegate, UIPickerViewDataSource {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.delegate = self
        pickerView.dataSource = self
        
        super.viewDidLoad()
               pickerView = UIPickerView()
               pickerView.delegate = self
               pickerView.dataSource = self
               
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //        初めは、金額のとこ0 が表示されている。
        boyRegisterLabel.text = "0"
        //        初めは、カテゴリーのラベルのところは、何も表示しない
        textLabel.text = "カテゴリーを選択してください。"
        
    }
    
    
    //金額が表示されるラベル
    @IBOutlet var boyRegisterLabel:UILabel!
      
    
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
    

    
    //    登録ボタン
    @IBAction func boyAddTap(_sender:UITapGestureRecognizer!){
        if boyRegisterLabel.text != nil{
            boyRegisterLabel.text = "金額を入力してください。"
        }else{
            
            switch selectedCategory {
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
                
                
            case "そ の 他":
                UserDefaults.standard.set(boyRegisterLabel.text, forKey: "boyothers")
                //                画面遷移
                
                let BoyOthersViewController = self.storyboard?.instantiateViewController(withIdentifier: "Boyothers") as! BoyOthersViewController
                self.present(BoyOthersViewController,animated: true,completion: nil)
            
            default:
                textLabel.text = "選択してください。"
            }
        }
    }
    
    @IBOutlet var textLabel:UILabel!
    
    var pickerView: UIPickerView!
    
    var selectedRow = 0
    
    var selectedCategory:String = "選択してください。"
    

    
    let categoryArray = ["食  費","日 用 品","娯 楽 費","固 定 費","そ の 他"]
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return categoryArray.count
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return categoryArray[row]
    }
    
    
    


    //    選んだ値を取得
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        selectedRow = row
        
    }
    
    
    
    
    
    func didCancel(sender: BoyPickerViewKeyboard) {
        
        print("cancel")
    }
    
    func didDone(sender: BoyPickerViewKeyboard, selectedData: String) {
        textLabel.text = selectedData
        
        selectedCategory = selectedData
        
        
        print(selectedData)
    }
    
    
    
    @IBOutlet weak var pickerKeyboardButton: BoyPickerViewKeyboard!
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        pickerView = UIPickerView()
//        pickerView.delegate = self
//        pickerView.dataSource = self
//
//    }
    
    
    override var inputView: UIView? {
        
        pickerView = UIPickerView()
        pickerView.delegate = self
        pickerView.selectRow(selectedRow, inComponent: 0, animated: true)
        
        return pickerView
    }
    
    
    override var inputAccessoryView: UIView? {
        let toolbar = UIToolbar()
        toolbar.frame = CGRect(x: 0, y: 0, width: pickerView.frame.width, height: 44)
        
        let space = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: self, action: nil)
        space.width = 12
        let cancelItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(self.cancelPicker))
        let flexSpaceItem = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let doneButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(self.donePicker))
        
        let toolbarItems = [space, cancelItem, flexSpaceItem, doneButtonItem, space]
        
        toolbar.setItems(toolbarItems, animated: true)
        
        return toolbar
    }
    
    @objc func cancelPicker() {
        pickerKeyboardButton.resignFirstResponder()

    }
    
    @objc func donePicker() {
        pickerKeyboardButton.resignFirstResponder()
        textLabel.text = categoryArray[selectedRow]
    }
    
    
    @IBAction func pushButton(_ sender: BoyPickerViewKeyboard) {
        
        sender.becomeFirstResponder()
        
    }
    
    
}



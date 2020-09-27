//
//  BoyRegisterViewController.swift
//  kakeiboApp
//
//  Created by 川田 文香 on 2020/09/24.
//  Copyright © 2020 kwdaaa.com. All rights reserved.
//

import UIKit

class BoyRegisterViewController: UIViewController,UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    //金額が表示されるラベル
    @IBOutlet var boyRegisterLabel:UILabel!
    
    
    
    //    引数の復讐する！！！！
    func cal(count:String){
        // ここよ！ここよ！
        if boyRegisterLabel.text == "0"{
            boyRegisterLabel.text = ""
        }
        
        var resultNum:String
        
        resultNum = boyRegisterLabel.text! + count
        
        boyRegisterLabel.text = resultNum
    }
    
    
    
    @IBAction func boyNumTap01(_ sender: Any) {
        cal(count: "1")
    }
    
    @IBAction func boyNumTap02(_ sender: Any) {
        cal(count: "2")
    }
    
    @IBAction func boyNumTap03(_ sender: Any) {
        cal(count: "3")
    }
    
    @IBAction func boyNumTap04(_ sender: Any) {
        cal(count: "4")
    }
    
    @IBAction func boyTap05(_ sender: Any) {
        cal(count: "5")
    }
    
    @IBAction func boyNumTap06(_ sender: Any) {
        cal(count: "6")
    }
    
    @IBAction func boyNumTap07(_ sender: Any) {
        cal(count: "7")
    }
    
    @IBAction func boyNumTap08(_ sender: Any) {
        cal(count: "8")
    }
    
    @IBAction func boyNumTap09(_ sender: Any) {
        cal(count: "9")
    }
    
    @IBAction func boyNumTap00(_ sender: Any) {
        cal(count: "0")
    }
    
    @IBAction func boyNumTapAC(_ sender: Any) {
        // ここよ！ここよ！
        boyRegisterLabel.text = "0"
    }
    
    
    
    //    登録ボタン
    @IBAction func boyAddTap(_sender:UITapGestureRecognizer!){
        
       
        //            ここ！！！！！！！！
        switch textLabel.text {
            
        case "食  費" :
            UserDefaults.standard.set(boyRegisterLabel!.text!, forKey: "BoyFood")
            
            
            //        画面遷移
            let BoyFoodViewController = self.storyboard?.instantiateViewController(withIdentifier: "BoyFood") as! BoyFoodViewController
            BoyFoodViewController.modalPresentationStyle = .fullScreen
            self.present(BoyFoodViewController, animated: true, completion: nil)
            
            
        case "日 用 品" :
            
            UserDefaults.standard.set(boyRegisterLabel!.text!, forKey: "BoyDaily")
            //                画面遷移
            let BoyDailyViewController = self.storyboard?.instantiateViewController(identifier: "BoyDaily") as! BoyDailyViewController
            BoyDailyViewController.modalPresentationStyle = .fullScreen
            self.present(BoyDailyViewController,animated: true,completion: nil)
            
            
        case "娯 楽 費" :
            UserDefaults.standard.set(boyRegisterLabel!.text!, forKey: "BoyLeisure")
            //                画面遷移
            let BoyLeisureViewController = self.storyboard?.instantiateViewController(identifier: "BoyLeisure") as! BoyLeisureViewController
            BoyLeisureViewController.modalPresentationStyle = .fullScreen
            self.present(BoyLeisureViewController,animated: true, completion: nil)
            
            
        case "固 定 費" :
            UserDefaults.standard.set(boyRegisterLabel!.text!, forKey: "BoyHousing")
            //                画面遷移
            let BoyHousingViewController = self.storyboard?.instantiateViewController(withIdentifier: "BoyHousing")
                as! BoyHousingViewController
            BoyHousingViewController.modalPresentationStyle = .fullScreen
            self.present(BoyHousingViewController,animated: true,completion: nil)
            
            
        case "そ の 他" :
            UserDefaults.standard.set(boyRegisterLabel!.text!, forKey: "BoyOthers")
            //                画面遷移
            
            let BoyOthersViewController = self.storyboard?.instantiateViewController(withIdentifier: "BoyOthers") as! BoyOthersViewController
            BoyOthersViewController.modalPresentationStyle = .fullScreen
            self.present(BoyOthersViewController,animated: true,completion: nil)
            
        default:
            textLabel.text = "選択してください。"
        }
        
    }
    
    @IBOutlet var textLabel:UILabel!
    
    
    
    @IBOutlet var dateButton: BoyPickerViewKeyboard!
    
    var pickerView: UIPickerView!
    
    var selectedRow = 0
    
    let DatePickerView = UIDatePicker()
    let dateFormatter = DateFormatter()
    
    
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
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        pickerView = UIPickerView()
        pickerView.delegate = self
        pickerView.dataSource = self
        
        DatePickerView.preferredDatePickerStyle = .wheels
        DatePickerView.datePickerMode = .date
        DatePickerView.locale = Locale(identifier: "ja_JP")
        
        dateFormatter.locale = Locale(identifier: "ja_JP")
        dateFormatter.dateStyle = .medium
        // ここよ！ここよ！
        boyRegisterLabel.text = "0"
        
        
    }
    
    
    override var inputView: UIView? {
        
        var setView:UIView!
        
        if dateButton.isFirstResponder{
            setView = DatePickerView
        }
        return setView ?? pickerView
        
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
        
        if dateButton.isFirstResponder{
            dateButton.resignFirstResponder()
        }else{
            pickerKeyboardButton.resignFirstResponder()
        }
        
    }
    
    
    
    //    紐付け！！！！！！！！！！！！！
    @IBOutlet var dateTextLabel:UILabel!
    
    
    @objc func donePicker() {
        
        if dateButton.isFirstResponder{
            dateButton.resignFirstResponder()
            dateTextLabel.text = dateFormatter.string(from: DatePickerView.date)
        } else{
            
            pickerKeyboardButton.resignFirstResponder()
            textLabel.text = categoryArray[selectedRow]
        }
        
        
        
    }
    
    
    @IBAction func pushButton(_ sender: BoyPickerViewKeyboard) {
        
        sender.becomeFirstResponder()
        
    }
    
    
    
    
    
    //    紐付け！！！！！
    @IBAction func DateButton(_ sender: BoyPickerViewKeyboard){
        
        sender.becomeFirstResponder()
        
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
        //        let BoyRegisterVC = self.storyboard?.instantiateViewController(withIdentifier: "BoyRegister") as! BoyRegisterViewController
        //        BoyRegisterVC.modalPresentationStyle = .fullScreen
        //        self.present(BoyRegisterVC, animated: false, completion: nil)
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



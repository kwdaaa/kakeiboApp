//
//  GirlRegisterViewController.swift
//  kakeiboApp
//
//  Created by 川田 文香 on 2020/09/24.
//  Copyright © 2020 kwdaaa.com. All rights reserved.
//

import UIKit

class GirlRegisterViewController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate {
    
    
    //金額が表示されるラベル
    @IBOutlet var girlRegisterLabel:UILabel!
    
    
    //    引数の復讐する！！！！
    func girlcal(count:String){
        // ここよ！ここよ！
        if girlRegisterLabel.text == "0"{
            girlRegisterLabel.text = ""
        }
        
        var resultNum:String
        
        resultNum = girlRegisterLabel.text! + count
        
        girlRegisterLabel.text = resultNum
    }
    
    
    @IBAction func girlNumTap01(_ sender: Any) {
        girlcal(count: "1")
    }
    
    @IBAction func girlNumTap02(_ sender: Any) {
        girlcal(count: "2")
    }
    
    @IBAction func girlNumTap03(_ sender: Any) {
        girlcal(count: "3")
    }
    
    @IBAction func girlNumTap04(_ sender: Any) {
        girlcal(count: "4")
    }
    
    @IBAction func girlNumTap05(_ sender: Any) {
        girlcal(count: "5")
    }
    
    @IBAction func girlNumTap06(_ sender: Any) {
        girlcal(count: "6")
    }
    
    @IBAction func girlNumTap07(_ sender: Any) {
        girlcal(count: "7")
    }
    
    @IBAction func girlNumTap08(_ sender: Any) {
        girlcal(count: "8")
    }
    
    @IBAction func girlNumTap09(_ sender: Any) {
        girlcal(count: "9")
    }
    
    @IBAction func girlNumTap00(_ sender: Any) {
        girlcal(count: "0")
    }
    
    @IBAction func girlNumTapAC(_ sender: Any) {
        // ここよ！ここよ！
        girlRegisterLabel.text = "0"
    }
    
    
    
    //    登録ボタン
    @IBAction func girlAddButton(_sender:UITapGestureRecognizer!){
        
        switch categoryLabel.text {
                
            case "食  費":
                
                UserDefaults.standard.set(girlRegisterLabel!.text!, forKey: "GirlFood")
                //        画面遷移
                let GirlFoodViewController = self.storyboard?.instantiateViewController(withIdentifier: "GirlFood") as! GirlFoodViewController
                GirlFoodViewController.modalPresentationStyle = .fullScreen
                self.present(GirlFoodViewController, animated: true, completion: nil)
                
                
            case "日 用 品":
                
                UserDefaults.standard.set(girlRegisterLabel!.text!, forKey: "GirlDaily")
                //                画面遷移
                let GirlDailyViewController = self.storyboard?.instantiateViewController(identifier: "GirlDaily") as! GirlDailyViewController
                GirlDailyViewController.modalPresentationStyle = .fullScreen
                self.present(GirlDailyViewController,animated: true,completion: nil)
                
                
            case "娯 楽 費":
                UserDefaults.standard.set(girlRegisterLabel!.text!, forKey: "GirlLeisure")
                //                画面遷移
                let GirlLeisureViewController = self.storyboard?.instantiateViewController(identifier: "BoyLeisure") as! GirlLeisureViewController
                GirlLeisureViewController.modalPresentationStyle = .fullScreen
                self.present(GirlLeisureViewController,animated: true, completion: nil)
                
                
            case "固 定 費":
                UserDefaults.standard.set(girlRegisterLabel!.text!, forKey: "GirlHousing")
                //                画面遷移
                let GirlHousingViewController = self.storyboard?.instantiateViewController(withIdentifier: "GirlHousing")
                    as! GirlHousingViewController
                GirlHousingViewController.modalPresentationStyle = .fullScreen
                self.present(GirlHousingViewController,animated: true,completion: nil)
                
                
            case "そ の 他":
                UserDefaults.standard.set(girlRegisterLabel!.text!, forKey: "GirlOthers")
                //                画面遷移
                
                let GirlOthersViewController = self.storyboard?.instantiateViewController(withIdentifier: "GirlOthers") as! GirlOthersViewController
                GirlOthersViewController.modalPresentationStyle = .fullScreen
                self.present(GirlOthersViewController,animated: true,completion: nil)
                
            default:
                categoryLabel.text = ""
            }
        }
    
    //    紐付け！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！
    @IBOutlet var categoryLabel:UILabel!
    
    
    //    紐付け！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！
    @IBOutlet var dateButton: BoyPickerViewKeyboard!
    
    
    var pickerView: UIPickerView!
    
    var selectedRow = 0
    
    let DatePickerView = UIDatePicker()
    let dateFormatter = DateFormatter()
    
    
    var girlSelectedCategory:String = ""
    
    let categoryArray = ["食  費","日 用 品","娯 楽 費","固 定 費","そ の 他"]
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    //    ピッカーの中身の数
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return categoryArray.count
    }
    //    ピッカーのタイトルを取得
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return categoryArray[row]
        
    }
    //    選択されたピッカーの値を取得
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        selectedRow = row
        
    }
    
    
    func didCancel(sender: BoyPickerViewKeyboard) {
        
        print("cancel")
    }
    
    func didDone(sender: BoyPickerViewKeyboard, selectedData: String) {
        
        categoryLabel.text = selectedData
        
        girlSelectedCategory = selectedData
        
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
        girlRegisterLabel.text = "0"
        
        
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
    
    
    @IBOutlet var dateTextLabel:UILabel!
    
    
    @objc func donePicker() {
        
        if dateButton.isFirstResponder{
            dateButton.resignFirstResponder()
            dateTextLabel.text = dateFormatter.string(from: DatePickerView.date)
        } else{
            
            pickerKeyboardButton.resignFirstResponder()
            categoryLabel.text = categoryArray[selectedRow]
        }
        
        
        
    }
    
    
    @IBAction func pushButton(_ sender: BoyPickerViewKeyboard) {
        
        sender.becomeFirstResponder()
        
    }
    
    
    
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

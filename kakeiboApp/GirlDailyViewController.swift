//
//  GirlDailyViewController.swift
//  kakeiboApp
//
//  Created by 川田 文香 on 2020/09/24.
//  Copyright © 2020 kwdaaa.com. All rights reserved.
//

import UIKit

class GirlDailyViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    
    //    テーブルビューの紐付け
    @IBOutlet var girlDailyTableView: UITableView!
    
    //    彼女の日用品を入れる配列を宣言
    var girlDailyArray:[Int] = []
    //    彼女の日用品の合計を格納する変数を宣言
    var girlDailyTotal = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if UserDefaults.standard.object(forKey: "GirlDaily") == nil{
                         
                        print("登録されていません。")
                         
                     }
    }
    override func viewWillAppear(_ animated: Bool) {
        //        登録画面での日用品の値を持ってくる　ちゃんとStringからIntに変換されてる？
        let girlDailyValue:Int =  UserDefaults.standard.object(forKey: "GirlDaily") as! Int
        //        持ってきた値を配列に格納
        girlDailyArray.append(girlDailyValue)
        
        //        彼女の食費の配列の合計を計算
        girlDailyTotal = girlDailyArray.reduce(0){
            
            ( num1:Int, num2:Int ) -> Int in
            return num1 + num2
            
        }
        //        彼女の食費の合計を保存
        UserDefaults.standard.set(girlDailyTotal, forKey: "GirlDailyTotal")
        
        girlDailyTableView.dataSource = self
        girlDailyTableView.delegate = self
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return girlDailyArray.count
    }
    
    //    日付も後から保存する
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let girlDailyCell = tableView.dequeueReusableCell(withIdentifier: "GirlDailyCell", for: indexPath)
        girlDailyCell.textLabel?.text = "\(girlDailyArray[indexPath.row])"
        return girlDailyCell
    }
    
    
    //    テーブルビューのdelete機能
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            //boyDailyArray内のindexPathのrow番目
            girlDailyArray.remove(at: indexPath.row)
            
            //            再び配列内に削除した配列を保存
            UserDefaults.standard.set(girlDailyArray, forKey: "GirlDaily")
            //            TableViewを
            tableView.reloadData()
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
        let GirlRegisterVC = self.storyboard?.instantiateViewController(withIdentifier: "GirlRegister") as! GirlRegisterViewController
        GirlRegisterVC.modalPresentationStyle = .fullScreen
        self.present(GirlRegisterVC, animated: false, completion: nil)
    }
}

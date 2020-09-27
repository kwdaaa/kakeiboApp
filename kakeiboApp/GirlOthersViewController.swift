//
//  GirlOthersViewController.swift
//  kakeiboApp
//
//  Created by 川田 文香 on 2020/09/24.
//  Copyright © 2020 kwdaaa.com. All rights reserved.
//

import UIKit

class GirlOthersViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    //    テーブルビューの紐付け
    @IBOutlet var girlOthersTableView: UITableView!
    
    
    //    彼女のその他を入れる配列を宣言
    var girlOthersArray:[Int] = []
    //    彼女のその他の合計を格納する変数を宣言
    var girlOthersTotal = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if UserDefaults.standard.object(forKey: "GirlOthers") == nil{
                         
                        print("登録されていません。")
                         
                     }
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        var girlOthersValue:Int = 0
        let girlOthersStr = UserDefaults.standard.string(forKey: "GirlOthers")
        
        girlOthersValue = Int(girlOthersStr!)!
        
        if UserDefaults.standard.object(forKey: "GirlOthersArray") != nil{
                    
                    self.girlOthersArray = UserDefaults.standard.object(forKey: "GirlOthersArray") as! [Int]
                    self.girlOthersArray.append(girlOthersValue)
                    
                }
               //        彼氏のその他の配列の合計を計算
               girlOthersTotal = girlOthersArray.reduce(0){
                   
                   ( num1:Int, num2:Int ) -> Int in
                   return num1 + num2
                   
               }
               
                UserDefaults.standard.set(girlOthersArray, forKey: "GirlOthersArray")
            
        
        //        彼女のその他の合計を保存
        UserDefaults.standard.set(girlOthersTotal, forKey: "GirlOthersTotal")
        
        girlOthersTableView.dataSource = self
        girlOthersTableView.delegate = self
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return girlOthersArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let girlOthersCell = tableView.dequeueReusableCell(withIdentifier: "GirlOthersCell", for: indexPath)
        girlOthersCell.textLabel?.text = "\(girlOthersArray[indexPath.row])"
        return girlOthersCell
    }
    
    //    テーブルビューのdelete機能
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            //girlOthersArray内のindexPathのrow番目
            girlOthersArray.remove(at: indexPath.row)
            
            //            再び配列内に削除した配列を保存
            UserDefaults.standard.set(girlOthersArray, forKey: "GirlOthers")
            //            TableViewを更新
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

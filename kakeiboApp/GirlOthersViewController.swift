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
        //        登録画面でのその他の値を持ってくる　ちゃんとStringからIntに変換されてる？
        let girlOthersValue:Int =  UserDefaults.standard.object(forKey: "GirlOthers") as! Int
        //        持ってきた値を配列に格納
        girlOthersArray.append(girlOthersValue)
        
        //        彼氏のその他の配列の合計を計算
        girlOthersTotal = girlOthersArray.reduce(0){
            
            ( num1:Int, num2:Int ) -> Int in
            return num1 + num2
        }
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
}

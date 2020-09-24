//
//  BoyOthersViewController.swift
//  kakeiboApp
//
//  Created by 川田 文香 on 2020/09/24.
//  Copyright © 2020 kwdaaa.com. All rights reserved.
//

import UIKit

class BoyOthersViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    //    テーブルビューの紐付け
    @IBOutlet var boyOthersTableView: UITableView!
    
    
    //    彼氏のその他を入れる配列を宣言
    var boyOthersArray:[Int] = []
    //    彼氏のその他の合計を格納する変数を宣言
    var boyOthersTotal = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        //        登録画面でのその他の値を持ってくる　ちゃんとStringからIntに変換されてる？
        let boyOthersValue:Int =  UserDefaults.standard.object(forKey: "BoyOthers") as! Int
        //        持ってきた値を配列に格納
        boyOthersArray.append(boyOthersValue)
        
        //        彼氏のその他の配列の合計を計算
        boyOthersTotal = boyOthersArray.reduce(0){
            
            ( num1:Int, num2:Int ) -> Int in
            return num1 + num2
            
        }
        
        //        彼氏のその他の合計を保存
        UserDefaults.standard.set(boyOthersTotal, forKey: "BoyOthersTotal")
        
        boyOthersTableView.dataSource = self
        boyOthersTableView.delegate = self
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return boyOthersArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let boyOthersCell = tableView.dequeueReusableCell(withIdentifier: "BoyOthersCell", for: indexPath)
        boyOthersCell.textLabel?.text = "\(boyOthersArray[indexPath.row])"
        return boyOthersCell
    }
    
    //    テーブルビューのdelete機能
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            //boyOthersArray内のindexPathのrow番目
            boyOthersArray.remove(at: indexPath.row)
            
            //            再び配列内に削除した配列を保存
            UserDefaults.standard.set(boyOthersArray, forKey: "BoyOthers")
            //            TableViewを
            tableView.reloadData()
        }
    }
    
    
    
    
}

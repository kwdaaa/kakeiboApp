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
}

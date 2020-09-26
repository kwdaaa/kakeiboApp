//
//  BoyDailyViewController.swift
//  kakeiboApp
//
//  Created by 川田 文香 on 2020/09/24.
//  Copyright © 2020 kwdaaa.com. All rights reserved.
//

import UIKit

class BoyDailyViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    //    テーブルビューの紐付け
    @IBOutlet var boyDailyTableView: UITableView!
    
    //    彼氏の日用品を入れる配列を宣言
    var boyDailyArray:[Int] = []
    //    彼氏の日用品の合計を格納する変数を宣言
    var boyDailyTotal = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        if UserDefaults.standard.object(forKey: "BoyDaily") == nil{
                   
                  print("登録されていません。")
                   
               }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        //        登録画面での日用品の値を持ってくる　ちゃんとStringからIntに変換されてる？
        let boyDailyValue:Int =  UserDefaults.standard.object(forKey: "BoyDaily") as! Int
        //        持ってきた値を配列に格納
        boyDailyArray.append(boyDailyValue)
        
        //        彼氏の食費の配列の合計を計算
        boyDailyTotal = boyDailyArray.reduce(0){
            
            ( num1:Int, num2:Int ) -> Int in
            return num1 + num2
            
        }
        //        彼氏の食費の合計を保存
        UserDefaults.standard.set(boyDailyTotal, forKey: "BoyDailyTotal")
        
        boyDailyTableView.dataSource = self
        boyDailyTableView.delegate = self
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return boyDailyArray.count
    }
    
    //    日付も後から保存する
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let boyDailyCell = tableView.dequeueReusableCell(withIdentifier: "BoyDailyCell", for: indexPath)
        boyDailyCell.textLabel?.text = "\(boyDailyArray[indexPath.row])"
        return boyDailyCell
    }
    
    
    //    テーブルビューのdelete機能
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            //boyDailyArray内のindexPathのrow番目
            boyDailyArray.remove(at: indexPath.row)
            
            //            再び配列内に削除した配列を保存
            UserDefaults.standard.set(boyDailyArray, forKey: "BoyDaily")
            //            TableViewを
            tableView.reloadData()
        }
        
    }
}

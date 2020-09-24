//
//  BoyLeisureViewController.swift
//  kakeiboApp
//
//  Created by 川田 文香 on 2020/09/24.
//  Copyright © 2020 kwdaaa.com. All rights reserved.
//

import UIKit

class BoyLeisureViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    //    テーブルビューの紐付け
    @IBOutlet var boyLeisureTableView: UITableView!
    
    //    彼氏の娯楽費を入れる配列を宣言
    var boyLeisureArray:[Int] = []
    //    彼氏の娯楽費の合計を格納する変数を宣言
    var boyLeisureTotal = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //        登録画面での娯楽費の値を持ってくる　ちゃんとStringからIntに変換されてる？
        let boyLeisureValue:Int =  UserDefaults.standard.object(forKey: "BoyLeisure") as! Int
        //        持ってきた値を配列に格納
        boyLeisureArray.append(boyLeisureValue)
        
        //        彼氏の娯楽費の配列の合計を計算
        boyLeisureTotal = boyLeisureArray.reduce(0){
            
            ( num1:Int, num2:Int ) -> Int in
            return num1 + num2
        }
        
        //        彼氏の娯楽費の合計を保存
        UserDefaults.standard.set(boyLeisureTotal, forKey: "BoyLeisureTotal")
        
        boyLeisureTableView.dataSource = self
        boyLeisureTableView.delegate = self
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return boyLeisureArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let boyLeisureCell = tableView.dequeueReusableCell(withIdentifier: "BoyLeisureCell", for: indexPath)
        boyLeisureCell.textLabel?.text = "\(boyLeisureArray[indexPath.row])"
        return boyLeisureCell
    }
    //    テーブルビューのdelete機能
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            //boyLeisureArray内のindexPathのrow番目
            boyLeisureArray.remove(at: indexPath.row)
            
            //            再び配列内に削除した配列を保存
            UserDefaults.standard.set(boyLeisureArray, forKey: "BoyLeisure")
            //            TableViewを
            tableView.reloadData()
        }
    }
    
}

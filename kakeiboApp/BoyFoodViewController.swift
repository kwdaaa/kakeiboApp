//
//  BoyFoodViewController.swift
//  kakeiboApp
//
//  Created by 川田 文香 on 2020/09/24.
//  Copyright © 2020 kwdaaa.com. All rights reserved.
//

import UIKit

class BoyFoodViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    //    テーブルビューの紐付け
    @IBOutlet var boyFoodTableView: UITableView!
    
    
    //    彼氏の食費を入れる配列を宣言
    var boyFoodArray:[Int] = []
    //    彼氏の食費の合計を格納する変数を宣言
    var boyFoodTotal = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        //        登録画面での食費の値を持ってくる　ちゃんとStringからIntに変換されてる？
        let boyFoodValue:Int =  UserDefaults.standard.object(forKey: "BoyFood") as! Int
        //        持ってきた値を配列に格納
        boyFoodArray.append(boyFoodValue)
        
        //        彼氏の食費の配列の合計を計算
        boyFoodTotal = boyFoodArray.reduce(0){
            
            ( num1:Int, num2:Int ) -> Int in
            return num1 + num2
            
        }
        
        //        彼氏の食費の合計を保存
        UserDefaults.standard.set(boyFoodTotal, forKey: "BoyFoodTotal")
        
        boyFoodTableView.dataSource = self
        boyFoodTableView.delegate = self
        
    }
    
    
    
    //    彼氏の食費の配列分のセルを作る
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return boyFoodArray.count
    }
    
    //    セルの中身はなんでしょう 配列の値と日付 今は、配列しか入ってない
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let boyFoodCell = tableView.dequeueReusableCell(withIdentifier: "BoyFoodCell", for: indexPath)
        boyFoodCell.textLabel?.text = "\(boyFoodArray[indexPath.row])"
        return boyFoodCell
        
    }
    
    
    //    テーブルビューのdelete機能
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            //boyFoodArray内のindexPathのrow番目
            boyFoodArray.remove(at: indexPath.row)
            
            //            再び配列内に削除した配列を保存
            UserDefaults.standard.set(boyFoodArray, forKey: "BoyFood")
            //            TableViewを
            tableView.reloadData()
        }
    }
}

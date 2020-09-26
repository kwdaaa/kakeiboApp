//
//  GirlFoodViewController.swift
//  kakeiboApp
//
//  Created by 川田 文香 on 2020/09/24.
//  Copyright © 2020 kwdaaa.com. All rights reserved.
//

import UIKit

class GirlFoodViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    
    //    テーブルビューの紐付け
    @IBOutlet var girlFoodTableView: UITableView!
    
    //    彼女の食費を入れる配列を宣言
    var girlFoodArray:[Int] = []
    //    彼女の食費の合計を格納する変数を宣言
    var girlFoodTotal = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if UserDefaults.standard.object(forKey: "GirlFood") == nil{
                   
                  print("登録されていません。")
                   
               }
    }
    override func viewWillAppear(_ animated: Bool) {
        //        登録画面での食費の値を持ってくる　ちゃんとStringからIntに変換されてる？
        let girlFoodValue:Int =  UserDefaults.standard.object(forKey: "girlFood") as! Int
        //        持ってきた値を配列に格納
        girlFoodArray.append(girlFoodValue)
        
        //        彼女の食費の配列の合計を計算
        girlFoodTotal = girlFoodArray.reduce(0){
            
            ( num1:Int, num2:Int ) -> Int in
            return num1 + num2
        }
        
        //        彼女の食費の合計を保存
        UserDefaults.standard.set(girlFoodTotal, forKey: "GirlFoodTotal")
        
        girlFoodTableView.dataSource = self
        girlFoodTableView.delegate = self
    }
    
    //    彼氏の食費の配列分のセルを作る
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return girlFoodArray.count
    }
    
    //    セルの中身はなんでしょう 配列の値と日付です 今は、配列しか入ってない
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let girlFoodCell = tableView.dequeueReusableCell(withIdentifier: "GirlFoodCell", for: indexPath)
        girlFoodCell.textLabel?.text = "\(girlFoodArray[indexPath.row])"
        return girlFoodCell
    }
    
    
    //    テーブルビューのdelete機能
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            //girlFoodArray内のindexPathのrow番目
            girlFoodArray.remove(at: indexPath.row)
            
            //            再び配列内に削除した配列を保存
            UserDefaults.standard.set(girlFoodArray, forKey: "GirlFood")
            //            TableViewを更新
            tableView.reloadData()
        }
    }
}

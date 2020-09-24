//
//  GirlLeisureViewController.swift
//  kakeiboApp
//
//  Created by 川田 文香 on 2020/09/24.
//  Copyright © 2020 kwdaaa.com. All rights reserved.
//

import UIKit

class GirlLeisureViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    //    テーブルビューの紐付け
    @IBOutlet var girlLeisureTableView: UITableView!
    
    //    彼女の娯楽費を入れる配列を宣言
    var girlLeisureArray:[Int] = []
    //    彼女の娯楽費の合計を格納する変数を宣言
    var girlLeisureTotal = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        //        登録画面での娯楽費の値を持ってくる　ちゃんとStringからIntに変換されてる？
        let girlLeisureValue:Int =  UserDefaults.standard.object(forKey: "GirlLeisure") as! Int
        //        持ってきた値を配列に格納
        girlLeisureArray.append(girlLeisureValue)
        
        //        彼女の娯楽費の配列の合計を計算
        girlLeisureTotal = girlLeisureArray.reduce(0){
            
            ( num1:Int, num2:Int ) -> Int in
            return num1 + num2
        }
        
        //        彼氏の娯楽費の合計を保存
        UserDefaults.standard.set(girlLeisureTotal, forKey: "GirlLeisureTotal")
        
        girlLeisureTableView.dataSource = self
        girlLeisureTableView.delegate = self
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return girlLeisureArray.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let girlLeisureCell = tableView.dequeueReusableCell(withIdentifier: "GirlLeisureCell", for: indexPath)
        girlLeisureCell.textLabel?.text = "\(girlLeisureArray[indexPath.row])"
        return girlLeisureCell
    }
    
    
    //    テーブルビューのdelete機能
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            //girlLeisureArray内のindexPathのrow番目
            girlLeisureArray.remove(at: indexPath.row)
            
            //            再び配列内に削除した配列を保存
            UserDefaults.standard.set(girlLeisureArray, forKey: "GirlLeisure")
            //            TableViewを更新
            tableView.reloadData()
        }
    }
}

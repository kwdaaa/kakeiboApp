//
//  BoyHousingViewController.swift
//  kakeiboApp
//
//  Created by 川田 文香 on 2020/09/24.
//  Copyright © 2020 kwdaaa.com. All rights reserved.
//

import UIKit

class BoyHousingViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    
    //    テーブルビューの紐付け
    @IBOutlet var boyHousingTableView: UITableView!
    
    
    //    彼氏の固定費を入れる配列を宣言
    var boyHousingArray:[Int] = []
    //    彼氏の固定費の合計を格納する変数を宣言
    var boyHousingTotal = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if UserDefaults.standard.object(forKey: "BoyHousing") == nil{
                   
                  print("登録されていません。")
                   
               }
        
    }
    override func viewWillAppear(_ animated: Bool) {
        //        登録画面での固定費の値を持ってくる　ちゃんとStringからIntに変換されてる？
        let boyHousingValue:Int =  UserDefaults.standard.object(forKey: "BoyHousing") as! Int
        //        持ってきた値を配列に格納
        boyHousingArray.append(boyHousingValue)
        
        //        彼氏の固定費の配列の合計を計算
        boyHousingTotal = boyHousingArray.reduce(0){
            
            ( num1:Int, num2:Int ) -> Int in
            return num1 + num2
            
        }//        彼氏の固定費の合計を保存
        UserDefaults.standard.set(boyHousingTotal, forKey: "BoyHousingTotal")
        
        boyHousingTableView.dataSource = self
        boyHousingTableView.delegate = self
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return boyHousingArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let boyHousingCell = tableView.dequeueReusableCell(withIdentifier: "BoyHousingCell", for: indexPath)
        boyHousingCell.textLabel?.text = "\(boyHousingArray[indexPath.row])"
        return boyHousingCell
    }
    
    //    テーブルビューのdelete機能
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            //boyHousingArray内のindexPathのrow番目
            boyHousingArray.remove(at: indexPath.row)
            
            //            再び配列内に削除した配列を保存
            UserDefaults.standard.set(boyHousingArray, forKey: "BoyHousing")
            //            TableViewを
            tableView.reloadData()
        }
    }
}

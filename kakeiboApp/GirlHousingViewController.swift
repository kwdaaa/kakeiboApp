//
//  GirlHousingViewController.swift
//  kakeiboApp
//
//  Created by 川田 文香 on 2020/09/24.
//  Copyright © 2020 kwdaaa.com. All rights reserved.
//

import UIKit

class GirlHousingViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    //    テーブルビューの紐付け
    @IBOutlet var girlHousingTableView: UITableView!
    
    
    //    彼女の固定費を入れる配列を宣言
    var girlHousingArray:[Int] = []
    //    彼女の固定費の合計を格納する変数を宣言
    var girlHousingTotal = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
         //        登録画面での固定費の値を持ってくる　ちゃんとStringからIntに変換されてる？
            let girlHousingValue:Int =  UserDefaults.standard.object(forKey: "girlHousing") as! Int
            //        持ってきた値を配列に格納
            girlHousingArray.append(girlHousingValue)
            
            //        彼女の固定費の配列の合計を計算
            girlHousingTotal = girlHousingArray.reduce(0){
                
                ( num1:Int, num2:Int ) -> Int in
                return num1 + num2
                
            }//        彼女の固定費の合計を保存
            UserDefaults.standard.set(girlHousingTotal, forKey: "GirlHousingTotal")
            
            girlHousingTableView.dataSource = self
            girlHousingTableView.delegate = self
        }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return girlHousingArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let girlHousingCell = tableView.dequeueReusableCell(withIdentifier: "GirlHousingCell", for: indexPath)
        girlHousingCell.textLabel?.text = "\(girlHousingArray[indexPath.row])"
        return girlHousingCell
    }
    
    //    テーブルビューのdelete機能
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            //girlHousingArray内のindexPathのrow番目
            girlHousingArray.remove(at: indexPath.row)
            
            //            再び配列内に削除した配列を保存
            UserDefaults.standard.set(girlHousingArray, forKey: "GirlHousing")
            //            TableViewを更新
            tableView.reloadData()
        }
    }

}

//
//  BoyPickerViewKeyboardDelegate.swift
//  kakeiboApp
//
//  Created by 川田 文香 on 2020/09/26.
//  Copyright © 2020 kwdaaa.com. All rights reserved.
//

import Foundation

protocol BoyPickerViewKeyboardDelegate {
    func titlesOfPickerViewKeyboard(sender: BoyPickerViewKeyboard) -> Array<String>
    func initSelectedRow(sender: BoyPickerViewKeyboard) -> Int
    func didCancel(sender: BoyPickerViewKeyboard)
    func didDone(sender: BoyPickerViewKeyboard, selectedData: String)
}


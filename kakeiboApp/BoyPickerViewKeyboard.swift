//
//  BoyPickerViewKeyboard.swift
//  kakeiboApp
//
//  Created by 川田 文香 on 2020/09/26.
//  Copyright © 2020 kwdaaa.com. All rights reserved.
//

import UIKit

class BoyPickerViewKeyboard: UIButton,UIKeyInput {


    
    override var canBecomeFirstResponder: Bool{
        return true
    }
    
    
    var  hasText:Bool = true
    func insertText(_ text: String) {}
    func deleteBackward() {}
    var keyboardType: UIKeyboardType = .numberPad
}

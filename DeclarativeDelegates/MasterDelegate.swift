//
//  MasterDelegate.swift
//  DeclarativeDelegates
//
//  Created by Nirav Bhatt on 28/08/2018.
//  Copyright © 2018 Nirav Bhatt. All rights reserved.
//

import UIKit

typealias TF_DIDBEGINEDITING_BLOCK = (_ textField: UITextField) -> Void
typealias TF_DIDENDEDITING_BLOCK = (_ textField: UITextField) -> Void

typealias TF_SHOULDCLEAR_BLOCK = (_ textField: UITextField) -> Bool
typealias TF_SHOULDBEGINEDITING_BLOCK = (_ textField: UITextField) -> Bool

typealias TF_SHOULDRETURN_BLOCK = (_ textField: UITextField) -> Bool
typealias TF_DIDENDEDITINGWITHREASON_BLOCK = (_ textField: UITextField, _ reason: UITextFieldDidEndEditingReason) -> Void

typealias TF_SHOULDCHANGE_BLOCK = (_ textField: UITextField, _ range: NSRange, _ string: String) -> Bool

class MasterDelegate: NSObject, UITextFieldDelegate
{
    var tfDidBeginEditingBlock : TF_DIDBEGINEDITING_BLOCK?
    var tfDidEndEditingBlock : TF_DIDENDEDITING_BLOCK?
    var tfShouldChangeBlock : TF_SHOULDCHANGE_BLOCK?
    
    init(didBeginBlock : @escaping TF_DIDBEGINEDITING_BLOCK, didEndBlock: @escaping TF_DIDENDEDITING_BLOCK,
          shouldChangeBlock : @escaping TF_SHOULDCHANGE_BLOCK)
    {
        self.tfDidBeginEditingBlock = didBeginBlock
        self.tfDidEndEditingBlock = didEndBlock
        self.tfShouldChangeBlock = shouldChangeBlock
    }
  
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.tfDidBeginEditingBlock?(textField)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.tfDidEndEditingBlock?(textField)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool
    {
        return (self.tfShouldChangeBlock?(textField, range, string))!
    }
    

}

//
//  ViewController.swift
//  DeclarativeDelegates
//
//  Created by Nirav Bhatt on 28/08/2018.
//  Copyright © 2018 Nirav Bhatt. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tfFirstName: UITextField!
    
    @IBOutlet weak var tfLastName: UITextField!
    //this var is REQUIRED to remain in memory during life of tfFirstName and all other textFields this is made delegate of
    var textFieldDelegate : MasterDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textFieldDelegate = MasterDelegate(didBeginBlock:
        { [weak self]
            (_ tf) in
            print("Begin editing: \(String(describing: tf.text))")
        }, didEndBlock: {
          [weak self]
            (_ tf) in
            print("end editing: \(String(describing: tf.text))")
        }, shouldChangeBlock: {
           [weak self]
            (_ tf, range, str) -> Bool in
            print("change: \(String(describing: str))")
            return true
        })
        
        tfFirstName.delegate = textFieldDelegate
        
        tfLastName.delegate = textFieldDelegate
    }



}


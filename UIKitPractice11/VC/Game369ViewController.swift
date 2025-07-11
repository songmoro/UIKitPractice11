//
//  Game369ViewController.swift
//  UIKitPractice11
//
//  Created by 송재훈 on 7/11/25.
//

import UIKit

class Game369ViewController: ViewController {
    @IBOutlet var inputTextField: UITextField!
    @IBOutlet var clapLabel: UILabel!
    @IBOutlet var countLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func inputTextFieldEditingDidEnd(_ sender: UITextField) {
        print(#function)
    }
}

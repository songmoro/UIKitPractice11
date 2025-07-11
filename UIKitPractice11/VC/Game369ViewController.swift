//
//  Game369ViewController.swift
//  UIKitPractice11
//
//  Created by 송재훈 on 7/11/25.
//

import UIKit

class Game369ViewController: ViewController {
    @IBOutlet var inputTextField: UITextField!
    @IBOutlet var numberLabel: UILabel!
    @IBOutlet var countLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func inputTextFieldDidEndOnExit(_ sender: UITextField) {
        print(#function)
    }
    
    @IBAction func returnKeyboard(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    @IBAction func inputTextFieldEditingDidEnd(_ sender: UITextField) {
        print(#function)
        print(calculate(sender.text))
    }
    
    func calculate(_ text: String?) -> (Int?, [String]) {
        guard let text = text else { return (nil, []) }
        guard let number = Int(text) else { return (nil, []) }
        
        return (1...number).reduce(into: (0, [String]())) { partialResult, i in
            var str = String(i)
            
            if str.contains(where: { "369".contains($0) }) {
                str = str.map {
                    if "369".contains($0) {
                        partialResult.0 += 1
                        return "👏"
                    }
                    return "\($0)"
                }
                .joined()
            }
            
            partialResult.1.append(str)
        }
    }
}

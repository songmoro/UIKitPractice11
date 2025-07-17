//
//  GameViewController.swift
//  UIKitPractice11
//
//  Created by 송재훈 on 7/11/25.
//

import UIKit

class GameViewController: UIViewController {
    @IBOutlet var inputTextField: UITextField!
    @IBOutlet var numberLabel: UILabel!
    @IBOutlet var countLabel: UILabel!
    
    override func viewDidLoad() {
        print(#function, #fileID)
        super.viewDidLoad()
    }
    
    @IBAction func inputTextFieldDidEndOnExit(_ sender: UITextField) {
        print(#function, #fileID)
    }
    
    @IBAction func returnKeyboard(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    @IBAction func inputTextFieldEditingDidEnd(_ sender: UITextField) {
        print(#function, #fileID)
        let text = sender.text!
        let (clap, labelText) = calculate(text)
        
        if let clap {
            countLabel.text = "숫자 \(text)까지 총 박수는 \(clap)번 입니다."
            numberLabel.text = labelText.joined(separator: ", ")
        }
        else {
            countLabel.text = "입력한 값이 올바르지 않습니다."
            numberLabel.text = ""
        }
    }
    
    // TODO: 중복 계산 감소 시키기
    func calculate(_ text: String) -> (Int?, [String]) {
        guard let number = Int(text) else { return (nil, []) }
        guard number >= 1 else { return (nil, []) }
        
        return (1...number).reduce(into: (0, [String]())) { partialResult, i in
            var str = String(i)
            
            if str.contains(where: \.is369) {
                str = str.map {
                    if $0.is369 {
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

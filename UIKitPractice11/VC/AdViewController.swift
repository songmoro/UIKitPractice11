//
//  AdViewController.swift
//  UIKitPractice11
//
//  Created by 송재훈 on 7/15/25.
//

import UIKit

extension AdViewController {
    typealias Input = Travel
    typealias Model = String
    
    func put(_ input: Travel) {
        model = input.title
    }
}

class AdViewController: UIViewController, HasIdentifier, HasModel {
    @IBOutlet var adLabel: UILabel!
    
    var model: Model? {
        didSet {
            if isViewLoaded {
                updateLabels()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateLabels()
    }
    
    func updateLabels() {
        guard let model else { return }
        adLabel.text = model
    }
    
    @IBAction func dismissTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
}

//
//  CityDetailViewController.swift
//  UIKitPractice11
//
//  Created by 송재훈 on 7/16/25.
//

import UIKit

extension CityDetailViewController {
    typealias Input = City
    typealias Model = City
    
    func put(_ input: City) {
        model = input
    }
}

class CityDetailViewController: UIViewController, HasModel, HasIdentifier {
    @IBOutlet var cityLabel: UILabel!
    
    var model: Model? {
        didSet {
            updateLabels()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        updateLabels()
    }
    
    func updateLabels() {
        guard isViewLoaded, let model else { return }
        cityLabel.text = String(describing: model)
    }
}

//
//  AdCell.swift
//  UIKitPractice11
//
//  Created by 송재훈 on 7/11/25.
//

import UIKit

extension AdCell {
    typealias Input = Travel
    
    struct Model {
        let adText: String
    }
    
    func put(_ input: Input) {
        model = Model(adText: input.title)
    }
}

class AdCell: CustomCell {
    static let identifier = "adCell"
    
    // TODO: 인풋 프로토콜 prepareForReuse
    // TODO: prepareForReuse 초기 상태 누락 방지 방안
    
    @IBOutlet var backgroundShape: UIView!
    @IBOutlet var adLabelBackground: UIView!
    @IBOutlet var adTextLabel: UILabel!
    
    var model: Model? {
        didSet {
            updateLabels()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        backgroundShape.layer.cornerRadius = 12
        adLabelBackground.layer.cornerRadius = 8
    }
    
    override func prepareForReuse() {
        model = nil
    }
    
    func initial() {
        adTextLabel.text = ""
    }
    
    func updateLabels() {
        guard let model else {
            initial()
            return
        }
        updateAd(model.adText)
    }
    
    func updateAd(_ text: String) {
        adTextLabel.text = text
    }
}

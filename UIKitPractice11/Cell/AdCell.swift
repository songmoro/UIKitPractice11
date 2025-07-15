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
    // TODO: 인풋 프로토콜 prepareForReuse
    // TODO: prepareForReuse 초기 상태 누락 방지 방안
    // TODO: 옵션 셋 UIView 모디파이어
    
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
        backgroundShape.setCornerRadius(to: 12)
        adLabelBackground.setCornerRadius(to: 8)
    }
    
    override func prepareForReuse() {
        model = nil
    }
    
    func initial() {
        resetLabels(adTextLabel)
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

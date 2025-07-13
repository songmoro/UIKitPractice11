//
//  AdCell.swift
//  UIKitPractice11
//
//  Created by 송재훈 on 7/11/25.
//

import UIKit

class AdCell: UITableViewCell, HasIdentifier {
    static let identifier = "adCell"
    
    // TODO: 인풋 프로토콜 선언
    // TODO: 인풋 프로토콜 prepareForReuse
    // TODO: 인풋 프로토콜 updateLabels()
    // TODO: prepareForReuse 초기 상태 누락 방지 방안
    
    @IBOutlet var backgroundShape: UIView!
    @IBOutlet var adLabelBackground: UIView!
    @IBOutlet var adTextLabel: UILabel!
    var input: Input? {
        didSet {
            updateLabels()
        }
    }
    
    struct Input {
        let adText: String
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        backgroundShape.layer.cornerRadius = 12
        adLabelBackground.layer.cornerRadius = 8
    }
    
    func updateLabels() {
        guard let input else { return }
        adTextLabel.text = input.adText
    }
}

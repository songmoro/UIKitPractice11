//
//  AdCell.swift
//  UIKitPractice11
//
//  Created by 송재훈 on 7/11/25.
//

import UIKit

class AdCell: UITableViewCell, HasIdentifier {
    static let identifier = "adCell"
    
    @IBOutlet var backgroundShape: UIView!
    @IBOutlet var adLabelBackground: UIView!
    @IBOutlet var adTextLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        backgroundShape.layer.cornerRadius = 12
        adLabelBackground.layer.cornerRadius = 8
    }
}

//
//  MagazineInfoTableViewCell.swift
//  UIKitPractice11
//
//  Created by 송재훈 on 7/11/25.
//

import UIKit

class MagazineInfoTableViewCell: UITableViewCell {
    static let identifier = "magazineInfoTableViewCell"
    
    @IBOutlet var photo_image: UIImageView!
    @IBOutlet var title: UILabel!
    @IBOutlet var subtitle: UILabel!
    @IBOutlet var date: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        photo_image.layer.cornerRadius = 12
    }
}

//
//  MagazineInfoTableViewCell.swift
//  UIKitPractice11
//
//  Created by 송재훈 on 7/11/25.
//

import UIKit

class MagazineInfoTableViewCell: UITableViewCell, HasIdentifier {
    static let identifier = "magazineInfoTableViewCell"
    
    struct Input {
        let titleText: String
        let subtitleText: String
        let dateText: String
    }
    
    @IBOutlet var photo_image: UIImageView!
    @IBOutlet var title: UILabel!
    @IBOutlet var subtitle: UILabel!
    @IBOutlet var date: UILabel!
    var input: Input? {
        didSet {
            updateLabels()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        photo_image.layer.cornerRadius = 12
    }
    
    func updateLabels() {
        guard let input else { return }
        title.text = input.titleText
        subtitle.text = input.subtitleText
        date.text = input.dateText
    }
}

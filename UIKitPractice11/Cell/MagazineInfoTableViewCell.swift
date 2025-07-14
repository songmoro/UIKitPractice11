//
//  MagazineInfoTableViewCell.swift
//  UIKitPractice11
//
//  Created by 송재훈 on 7/11/25.
//

import UIKit
import Kingfisher

class MagazineInfoTableViewCell: CustomCell {
    static let identifier = "magazineInfoTableViewCell"
    
    struct Input {
        let imageURL: String
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
    
    override func prepareForReuse() {
        input = nil
    }
    
    func updateLabels() {
        guard let input else {
            photo_image.image = nil
            title.text = ""
            subtitle.text = ""
            date.text = ""
            return
        }
        
        if let url = URL(string: input.imageURL) {
            photo_image.kf.setImage(
                with: url,
                placeholder: UIImage(systemName: "arrow.circlepath")
            )
        }
        title.text = input.titleText
        subtitle.text = input.subtitleText
        date.text = input.dateText
    }
}

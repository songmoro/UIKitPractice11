//
//  MagazineInfoTableViewCell.swift
//  UIKitPractice11
//
//  Created by 송재훈 on 7/11/25.
//

import UIKit
import Kingfisher

extension MagazineInfoTableViewCell {
    typealias Input = Magazine
    
    func put(_ input: Input) {
        model = Model(
            imageURL: input.photo_image,
            titleText: input.title,
            subtitleText: input.subtitle,
            dateText: modelDateToCellDate(input.date) ?? ""
        )
    }
    
    struct Model {
        let imageURL: String
        let titleText: String
        let subtitleText: String
        let dateText: String
    }
}

class MagazineInfoTableViewCell: CustomCell {
    static let identifier = "magazineInfoTableViewCell"
    
    @IBOutlet var photo_image: UIImageView!
    @IBOutlet var title: UILabel!
    @IBOutlet var subtitle: UILabel!
    @IBOutlet var date: UILabel!
    
    var model: Model? {
        didSet {
            updateLabels()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        photo_image.layer.cornerRadius = 12
    }
    
    override func prepareForReuse() {
        model = nil
    }
    
    // MARK: Function
    func initial() {
        photo_image.image = nil
        title.text = ""
        subtitle.text = ""
        date.text = ""
    }
    
    func updateLabels() {
        guard let model else {
            initial()
            return
        }
        
        if let url = URL(string: model.imageURL) {
            photo_image.kf.setImage(
                with: url,
                placeholder: UIImage(systemName: "arrow.circlepath")
            )
        }
        title.text = model.titleText
        subtitle.text = model.subtitleText
        date.text = model.dateText
    }
    
    func modelDateToCellDate(_ text: String) -> String? {
        let formattedDate = DateFormatManager.shared.dateToStringFomatter.date(from: text)
        guard let formattedDate else { return nil }
            
        return DateFormatManager.shared.stringToDateFomatter.string(from: formattedDate)
    }
}

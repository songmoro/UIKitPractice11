//
//  MagazineInfoCell.swift
//  UIKitPractice11
//
//  Created by 송재훈 on 7/11/25.
//

import UIKit
import Kingfisher

extension MagazineInfoCell {
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

class MagazineInfoCell: CustomCell {
    static let dateFormatter = DateFormatManager()
    
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
        resetImages(photo_image)
        resetLabels(title, subtitle, date)
    }
    
    func updateLabels() {
        guard let model else {
            initial()
            return
        }
        
        updateImage(model.imageURL)
        updateTitle(model.titleText)
        updateSubtitle(model.subtitleText)
        updateDate(model.dateText)
    }
    
    func updateImage(_ url: String) {
        guard let url = URL(string: url) else { return }
        photo_image.kf.setImage(with: url, placeholder: UIImage(systemName: "arrow.circlepath"))
    }
    
    func updateTitle(_ text: String) {
        title.text = text
    }
    
    func updateSubtitle(_ text: String) {
        subtitle.text = text
    }
    
    func updateDate(_ text: String) {
        date.text = text
    }
    
    func modelDateToCellDate(_ text: String) -> String? {
        let formattedDate = Self.dateFormatter.getStringFrom.date(from: text)
        guard let formattedDate else { return nil }
            
        return Self.dateFormatter.getDateFrom.string(from: formattedDate)
    }
}

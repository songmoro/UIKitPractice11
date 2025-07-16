//
//  CityInfoCell.swift
//  UIKitPractice11
//
//  Created by 송재훈 on 7/16/25.
//

import UIKit
import Kingfisher

extension CityInfoCell {
    typealias Input = City
    
    struct Model {
        let name: String
        let englishName: String
        let imageURL: String
        let explain: String
    }
    
    func put(_ input: Input) {
        model = Model(
            name: input.city_name,
            englishName: input.city_english_name,
            imageURL: input.city_image,
            explain: input.city_explain
        )
    }
}

class CityInfoCell: CustomCell {
//    let city_name: String
//    let city_english_name: String
//    let city_explain: String
//    let city_image: String
//    let domestic_travel: Bool
    
    @IBOutlet var containerView: UIView!
    @IBOutlet var cityImage: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var explainLabel: UILabel!
    
    var model: Model? {
        didSet {
            updateLabels()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        containerView.layer.cornerRadius = 16
        containerView.clipsToBounds = true
        containerView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMinYCorner]
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        model = nil
    }
    
    func initial() {
        resetLabels(titleLabel, explainLabel)
        resetImages(cityImage)
    }
    
    func updateLabels() {
        guard let model else { return }
        updateTitle(model.name, model.englishName)
        updateImage(model.imageURL)
        updateExplain(model.explain)
    }
    
    func updateTitle(_ name: String, _ englishName: String) {
        titleLabel.text = "\(name) | \(englishName)"
    }
    
    func updateImage(_ url: String) {
        guard let url = URL(string: url) else { return }
        cityImage.kf.setImage(with: url, placeholder: UIImage(systemName: "arrow.circlepath"))
    }
    
    func updateExplain(_ text: String) {
        explainLabel.text = text
    }
}

//
//  CityInfoCollectionCell.swift
//  UIKitPractice11
//
//  Created by 송재훈 on 7/17/25.
//

import UIKit
import Kingfisher

extension CityInfoCollectionCell {
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
            explain: input.city_explain,
        )
    }
}

// TODO: Table Cell과 병합
class CityInfoCollectionCell: UICollectionViewCell, HasModel, HasIdentifier {
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
        cityImage.layer.masksToBounds = true
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

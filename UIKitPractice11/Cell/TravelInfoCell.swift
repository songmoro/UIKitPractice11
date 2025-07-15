//
//  TravelInfoCell.swift
//  UIKitPractice11
//
//  Created by 송재훈 on 7/11/25.
//

import UIKit
import Kingfisher

extension TravelInfoCell {
    typealias Input = Travel
    
    struct Model {
        let imageURL: String?
        let titleText: String
        let descriptionText: String?
        var grade: CGFloat?
        var save: Int?
        var like: Bool?
    }
    
    func put(_ input: Input) {
        model = Model(
            imageURL: input.travel_image,
            titleText: input.title,
            descriptionText: input.description,
            grade: input.grade,
            save: input.save,
            like: input.like
        )
    }
}

class TravelInfoCell: CustomCell {
    static let identifier = String(describing: TravelInfoCell.self)

    @IBOutlet var title: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var stars: [UIImageView]!
    @IBOutlet var gradeAndSaveLabel: UILabel!
    @IBOutlet var travel_image: UIImageView!
    @IBOutlet var likeButton: UIButton!
    @IBOutlet var likeButtonBackground: UIButton!
    
    var model: Model? {
        didSet {
            updateLabels()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        travel_image.layer.cornerRadius = 12
    }
    
    override func prepareForReuse() {
        model = nil
    }
    
    @IBAction func likeButtonTapped(_ sender: UIButton) {
        guard model != nil else { return }
        model!.like?.toggle()
    }
    
    // MARK: Function
    func initial() {
        travel_image.image = nil
        title.text = ""
        descriptionLabel.text = ""
        gradeAndSaveLabel.text = ""
        updateStars(to: 0)
        updateLike(to: false)
    }
    
    func updateLabels() {
        guard let model else {
            initial()
            return
        }
        
        updateImage(model.imageURL)
        updateTitle(model.titleText)
        updateDescription(model.descriptionText)
        updateGradeAndSave(grade: model.grade, like: model.like, save: model.save)
    }
    
    func updateImage(_ imageURL: String?) {
        guard let imageURL, let url = URL(string: imageURL) else { return }
        
        travel_image.kf.setImage(with: url, placeholder: UIImage(systemName: "arrow.circlepath"))
    }
    
    func updateTitle(_ text: String) {
        title.text = text
    }
    
    func updateDescription(_ text: String?) {
        guard let descriptionText = text else { return }
        descriptionLabel.text = descriptionText
    }
    
    func updateGradeAndSave(grade: CGFloat?, like: Bool?, save: Int?) {
        guard let grade, let like, let save else { return }
        updateStars(to: Int(grade))
        updateLike(to: like)
        
        let gradeAndSaveText = "(\(grade))∙저장 \((save + (like ? 1 : 0)).formatted(.number))"
        
        gradeAndSaveLabel.text = gradeAndSaveText
    }
    
    func updateStars(to: Int) {
        for i in 0...(stars.count - 1) {
            stars[i].tintColor = i < to ? .systemYellow : .systemGray
        }
    }
    
    func updateLike(to status: Bool) {
        if status {
            likeButtonBackground.alpha = 1
            likeButtonBackground.tintColor = .systemPink
        }
        else {
            likeButtonBackground.alpha = 0.3
            likeButtonBackground.tintColor = .label
        }
    }
}

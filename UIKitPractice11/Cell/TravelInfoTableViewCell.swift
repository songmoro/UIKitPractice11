//
//  TravelInfoTableViewCell.swift
//  UIKitPractice11
//
//  Created by 송재훈 on 7/11/25.
//

import UIKit

class TravelInfoTableViewCell: UITableViewCell {
    static let identifier = "travelInfoTableViewCell"
    
    struct Input {
        let titleText: String
        let descriptionText: String?
        var grade: CGFloat?
        var save: Int?
        var like: Bool?
    }
    
    @IBOutlet var title: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var stars: [UIImageView]!
    @IBOutlet var gradeAndSaveLabel: UILabel!
    @IBOutlet var travel_image: UIImageView!
    @IBOutlet var likeButton: UIButton!
    var travel: Input? {
        didSet {
            updateLabels()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        travel_image.layer.cornerRadius = 12
    }
    
    override func prepareForReuse() {
        travel = nil
    }
    
    func updateLabels() {
        guard let travel else { return }
        title.text = travel.titleText
        if let descriptionText = travel.descriptionText {
            descriptionLabel.text = descriptionText
        }
        
        guard let grade = travel.grade else { return }
        var gradeAndSaveText = "(\(grade))"
        updateStars(to: Int(grade))
        
        if let save = travel.save {
            gradeAndSaveText.append("∙저장 \(save.formatted(.number))")
        }
        
        gradeAndSaveLabel.text = gradeAndSaveText
    }
    
    func updateStars(to: Int) {
        for i in 0...(stars.count - 1) {
            stars[i].tintColor = i < to ? .systemYellow : .systemGray
        }
    }
}

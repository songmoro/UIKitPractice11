//
//  TravelDetailViewController.swift
//  UIKitPractice11
//
//  Created by 송재훈 on 7/15/25.
//

import UIKit
import Kingfisher

extension TravelDetailViewController {
    typealias Input = Travel
    
    struct Model {
        let imageURL: String
        let title: String
        let description: String
    }
    
    func put(_ input: Travel) {
        model = Model(
            imageURL: input.travel_image ?? "",
            title: input.title,
            description: input.description ?? ""
        )
    }
}

class TravelDetailViewController: UIViewController, HasIdentifier, HasModel {
    @IBOutlet var travelImage: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var dismissButton: UIButton!
    
    var model: Model? {
        didSet {
            if isViewLoaded {
                updateLabels()
            }
        }
    }
    
    // TODO: 모델 init throw
    // TODO: 이미지 재사용
    // TODO: IBOutlet -> Tag
    override func viewDidLoad() {
        super.viewDidLoad()
        
        travelImage.setCornerRadius(to: 12)
        
        dismissButton.layer.masksToBounds = true
        dismissButton.setCornerRadius(to: 18)
        updateLabels()
    }
    
    @IBAction func dismissButtonTapped(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    func updateLabels() {
        guard let model else { return }
        updateImage(model.imageURL)
        updateTitle(model.title)
        updateDescription(model.description)
    }
    
    func updateImage(_ url: String) {
        guard let url = URL(string: url) else { return }
        
        travelImage.kf.setImage(
            with: url,
            placeholder: UIImage(systemName: "arrow.circlepath")
        )
    }
    
    func updateTitle(_ text: String) {
        titleLabel.text = text
    }
    
    func updateDescription(_ text: String) {
        descriptionLabel.text = text
    }
}

//
//  UICollectionViewCell.swift
//  UIKitPractice11
//
//  Created by 송재훈 on 7/17/25.
//

import UIKit

// TODO: 통합
extension UICollectionViewCell {
    func resetTextFields(_ textFields: UITextField...) {
        textFields.forEach {
            $0.text = ""
        }
    }
    
    func resetLabels(_ labels: UILabel...) {
        labels.forEach {
            $0.text = ""
        }
    }
    
    func resetImages(_ images: UIImageView...) {
        images.forEach {
            $0.image = nil
        }
    }
}

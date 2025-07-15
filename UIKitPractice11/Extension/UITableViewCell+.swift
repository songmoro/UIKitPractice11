//
//  UITableViewCell+.swift
//  UIKitPractice11
//
//  Created by 송재훈 on 7/15/25.
//

import UIKit

extension UITableViewCell {
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

//
//  UICollectionView.swift
//  UIKitPractice11
//
//  Created by 송재훈 on 7/17/25.
//

import UIKit

extension UICollectionView {
    func register<T: UICollectionViewCell & HasIdentifier>(of type: T.Type) {
        register(
            UINib(nibName: type.identifier, bundle: nil),
            forCellWithReuseIdentifier: type.identifier
        )
    }
    
    func dequeueCustomCell<T: UICollectionViewCell & HasIdentifier>(of type: T.Type, for indexPath: IndexPath) -> T? {
        dequeueReusableCell(
            withReuseIdentifier: T.identifier,
            for: indexPath
        ) as? T
    }
}

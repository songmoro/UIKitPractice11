//
//  UITableView+.swift
//  UIKitPractice11
//
//  Created by 송재훈 on 7/13/25.
//

import UIKit

extension UITableView {
    func register<T: UITableViewCell & HasIdentifier>(of type: T.Type) {
        register(
            UINib(nibName: type.identifier, bundle: nil),
            forCellReuseIdentifier: type.identifier
        )
    }
    
    func dequeueCustomCell<T: UITableViewCell & HasIdentifier>(of type: T.Type, for indexPath: IndexPath) -> T? {
        dequeueReusableCell(
            withIdentifier: T.identifier,
            for: indexPath
        ) as? T
    }
}

//
//  UITableViewController+.swift
//  UIKitPractice11
//
//  Created by 송재훈 on 7/16/25.
//

import UIKit

extension UITableViewController {
    func willChangeData(_ closure: () -> (Void)) {
        closure()
        tableView.reloadData()
    }
}

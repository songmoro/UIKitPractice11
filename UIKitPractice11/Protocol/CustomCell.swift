//
//  CustomCell.swift
//  UIKitPractice11
//
//  Created by 송재훈 on 7/14/25.
//

import UIKit

typealias CustomCell = UITableViewCell & HasIdentifier & HasModel

protocol HasIdentifier: AnyObject {
    static var identifier: String { get }
}

protocol HasModel: AnyObject {
    associatedtype Input
    associatedtype Model
    
    func put(_ input: Input)
}

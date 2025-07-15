//
//  HasIdentifier.swift
//  UIKitPractice11
//
//  Created by 송재훈 on 7/15/25.
//

protocol HasIdentifier where Self: AnyObject {
    static var identifier: String { get }
}

extension HasIdentifier {
    static var identifier: String {
        String(describing: Self.self)
    }
}

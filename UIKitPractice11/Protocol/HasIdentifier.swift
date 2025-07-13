//
//  HasIdentifier.swift
//  UIKitPractice11
//
//  Created by 송재훈 on 7/13/25.
//

protocol HasIdentifier: AnyObject {
    static var identifier: String { get }
}

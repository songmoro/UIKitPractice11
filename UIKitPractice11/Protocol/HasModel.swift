//
//  HasModel.swift
//  UIKitPractice11
//
//  Created by 송재훈 on 7/15/25.
//

protocol HasModel {
    associatedtype Input
    associatedtype Model
    
    func put(_ input: Input)
}

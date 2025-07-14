//
//  Travel+.swift
//  UIKitPractice11
//
//  Created by 송재훈 on 7/14/25.
//

extension Travel {
    var cell: any CustomCell.Type {
        if ad != nil, ad! {
            AdCell.self
        }
        else {
            TravelInfoCell.self
        }
    }
}

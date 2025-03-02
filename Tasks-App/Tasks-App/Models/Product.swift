//
//  Product.swift
//  Tasks-App
//
//  Created by Taras Veremchuk on 02.03.2025.
//

import Foundation

struct Product: Identifiable {
    let id = UUID().uuidString
    let imageTitle: String
    let title: String
    let price: Int
    let category: ProductCategory
    var count: Int = 1
    var cost: Int {
        price * count
    }
}

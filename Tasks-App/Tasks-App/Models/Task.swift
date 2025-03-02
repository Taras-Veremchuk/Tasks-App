//
//  ProductSection.swift
//  Tasks-App
//
//  Created by Taras Veremchuk on 02.03.2025.
//

import Foundation

struct Task: Identifiable {
    let id: String = UUID().uuidString
    let title: String
    let detail: String
    var category: String
    var priorityImportant: Bool
    var priorityExpress: Bool
}

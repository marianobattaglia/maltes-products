//
//  CategoriesModel.swift
//  TablePractice
//
//  Created by Mariano Martin Battaglia on 28/07/2022.
//

import Foundation

struct Categories {
    let category_name: Category
}

final class LocalCategories {
    static let shared = LocalCategories()
    
    private init() {}
    
    func returnCategories() -> [Categories] {
        return [
            Categories(category_name: Category.anillos),
            Categories(category_name: Category.argollitas),
            Categories(category_name: Category.aros),
            Categories(category_name: Category.cadenas),
            Categories(category_name: Category.cuff),
            Categories(category_name: Category.midi),
            Categories(category_name: Category.pulseras),
            Categories(category_name: Category.tobilleras),
            Categories(category_name: Category.conjuntos),
            Categories(category_name: Category.todo)
        ]
    }
}

enum Category: String {
    case anillos = "Anillos"
    case argollitas = "Argollitas"
    case aros = "Aros"
    case cadenas = "Cadenas"
    case cuff = "Cuff"
    case midi = "Midi"
    case pulseras = "Pulseras"
    case tobilleras = "Tobilleras"
    case conjuntos = "Conjuntos"
    case todo = "Ver todo"
}

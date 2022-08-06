//
//  ProductListModel.swift
//  TablePractice
//
//  Created by Mariano Martin Battaglia on 28/07/2022.
//

import UIKit

//Subscribe this protocol for Update Firestore item
protocol Identifiable {
    var id: String? { get set }
}

struct Product: Codable, Identifiable {
    var id: String?
    let category_name: String
    let description: String
    let image: String
    let product_name: String
    let price: Int
    let stock: Int
    
    init(category_name: String, description: String, image: String, product_name: String, price: Int, stock: Int) {
        self.category_name = category_name
        self.description = description
        self.image = image
        self.product_name = product_name
        self.price = price
        self.stock = stock
    }
}

// MARK: - Mocks
final class LocalProducts {
    static let shared = LocalProducts()
    
    private init() {}
    
//    func returnProducts() -> [Product] {
//        return [
//            Product(id: "AR001", category_name: Category.aros, description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus in ante convallis, scelerisque eros eget, sagittis elit. Aliquam ac imperdiet leo. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Aenean porttitor rutrum sagittis. Aliquam lacinia est ut cursus fermentum. Cras lobortis fringilla libero. Nulla mattis molestie imperdiet. Integer gravida ipsum ut consequat sollicitudin. Quisque sagittis.", image: UIImage(named: "producto-1")!, product_name: "Producto 1: Aro", price: 100, stock: 1),
//            Product(id: "AN001", category_name: Category.anillos, description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus in ante convallis, scelerisque eros eget, sagittis elit. Aliquam ac imperdiet leo. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Aenean porttitor rutrum sagittis. Aliquam lacinia est ut cursus fermentum. Cras lobortis fringilla libero. Nulla mattis molestie imperdiet. Integer gravida ipsum ut consequat sollicitudin. Quisque sagittis.", image: UIImage(named: "producto-1")!, product_name: "Producto 2: Anillo", price: 199, stock: 12),
//            Product(id: "CA001", category_name: Category.cadenas, description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus in ante convallis, scelerisque eros eget, sagittis elit. Aliquam ac imperdiet leo. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Aenean porttitor rutrum sagittis. Aliquam lacinia est ut cursus fermentum. Cras lobortis fringilla libero. Nulla mattis molestie imperdiet. Integer gravida ipsum ut consequat sollicitudin. Quisque sagittis.", image: UIImage(named: "producto-1")!, product_name: "Producto 3: Cadena", price: 299, stock: 5),
//        ]
//    }
}

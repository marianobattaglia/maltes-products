//
//  DetailViewController.swift
//  TablePractice
//
//  Created by Mariano Martin Battaglia on 31/07/2022.
//

import UIKit
import FirebaseStorage

class DetailViewController: UIViewController {

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var stockLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    
    var product: Product?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }

    func setupUI() {
        self.title = "Detalle del producto"
        if let product = product {
            nameLabel.text = product.product_name
            if let safePrice = product.id {
                idLabel.text = "Código: \(safePrice)"
            }
            categoryLabel.text = "Categoría: \(product.category_name)".capitalizingFirstLetter()
            
            let stockUnits = product.stock
            switch stockUnits {
            case ...0:
                stockLabel.text = "Sin stock"
                stockLabel.textColor = UIColor(ciColor: .red)
            case 1:
                stockLabel.text = "Stock: \(product.stock) unidad en stock"
            default:
                stockLabel.text = "Stock: \(product.stock) unidades en stock"
            }
            priceLabel.text = "$ \(product.price)"
            detailLabel.text = product.description
        }
        
        //Fetch images from Storage
        let storage = Storage.storage()
        showSpinner()
        if let safeImage = product?.image {
            let gsReference = storage.reference(forURL: safeImage)
            gsReference.getData(maxSize: 1 * 1024 * 1024) { data, error in
                if let error = error {
                    print("Error: \(error)")
                    self.removeSpinner()
                } else {
                    let imageFromStorage = UIImage(data: data!)
                    self.image.image = imageFromStorage
                    self.image.reloadInputViews()
                    self.removeSpinner()
                }
            }

        }
    }
    
}

//
//  ProductListViewController.swift
//  TablePractice
//
//  Created by Mariano Martin Battaglia on 28/07/2022.
//

import UIKit
import FirebaseFirestore
import FirebaseStorage

class ProductListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var products: [Product]?
    var category: Category?
    
        
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "ProductTableViewCell", bundle: nil), forCellReuseIdentifier: "ProductTableViewCell")
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        setupUI()
    }

    func setupUI() {
        navigationController?.navigationBar.isHidden = false
        if let safeCategory = category {
            self.title = "Productos: \(safeCategory.rawValue)"
        }
    }
}

// MARK: - Extensions

extension ProductListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let vc = DetailViewController()
        vc.product = products?[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension ProductListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if products?.count ?? Int() > 0 {
            return products?.count ?? Int()
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if products?.count ?? Int() > 0 {
            tableView.allowsSelection = true
            let cell = self.tableView.dequeueReusableCell(withIdentifier: "ProductTableViewCell", for: indexPath) as! ProductTableViewCell
            cell.productNameCell.text = products?[indexPath.row].product_name
            cell.categoryNameCell.text = products?[indexPath.row].category_name.capitalizingFirstLetter()
            cell.idCell.text = products?[indexPath.row].id
            if let stockUnits = products?[indexPath.row].stock {
                switch stockUnits {
                case ...0:
                    cell.stockUnitsCell.text = "Sin stock"
                    cell.stockUnitsCell.textColor = UIColor(ciColor: .red)
                case 1:
                    cell.stockUnitsCell.text = "\(stockUnits) unidad en stock"
                default:
                    cell.stockUnitsCell.text = "\(stockUnits) unidades en stock"
                }
            }
            
            // MARK: - Storage images
            ///To place images from Firebase, read documentation: https://firebase.google.com/docs/storage/ios/download-files?hl=es
            //Storage initialization
            let storage = Storage.storage()
            //Start fetching images on FirebaseStorage
            cell.startSpinner()
            if let safeImage = products?[indexPath.row].image {
                let gsReference = storage.reference(forURL: safeImage)
                DispatchQueue.main.async {
                    gsReference.getData(maxSize: 1 * 1024 * 1024) { data, error in
                        if let error = error {
                            print("Error: \(error)")
                            cell.stopSpinner()
                        } else {
                            print("entro")
                            if let image = UIImage(data: data!) {
                                cell.imageCell.image = image
                                cell.imageCell.reloadInputViews()
                                print("Entro y ya reloadeo")
                                cell.stopSpinner()
                            }
                        }
                    }
                }
            }
            return cell
        } else {
            tableView.allowsSelection = false
            let cell = self.tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            cell.textLabel?.text = "No hay ningún producto para esta categoría"
            return cell
        }
    }
    
}

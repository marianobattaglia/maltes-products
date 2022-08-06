//
//  CategoriesViewController.swift
//  TablePractice
//
//  Created by Mariano Martin Battaglia on 28/07/2022.
//

import UIKit

class CategoriesViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private let categories = LocalCategories.shared.returnCategories()
    var products = [Product]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        setupUI()
        
        FIRFirestoreService.shared.read(from: .productos, returning: Product.self) { (products) in
            self.products = products
            self.tableView.reloadData()
        }
    }
    
    func setupUI() {
        //Navigation Bar
        navigationController?.navigationBar.isHidden = false
        navigationController?.title = "Categorías"
        
        //Back item
        let logoutItem = UIBarButtonItem(title: "Salir", style: .plain, target: self, action: #selector(self.popViewController(_:)))
        navigationItem.leftBarButtonItem = logoutItem
    }
    
    func pushProductList(category: Category) {
        let vc = ExampleViewController()
        vc.category = category
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        self.navigationController?.pushViewController(vc, animated: true)
    }

    @objc func popViewController(_ sender: Any) {
        self.navigationController?.dismiss(animated: true)
    }
}

// MARK: - Extensions
extension CategoriesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let categorySelected = categories[indexPath.row].category_name
        
        // MARK: - Repositories:
        // LOCAL:
        //let productList = LocalProducts.shared.returnProducts()
        
        // FIRESTORE:
        if categorySelected == Category.todo {
            let vc = ProductListViewController()
            vc.products = products
            vc.category = categorySelected
            self.navigationController?.setNavigationBarHidden(false, animated: false)
            self.navigationController?.pushViewController(vc, animated: true)
            print("Seleccionaste \(categories[indexPath.row].category_name)")
        } else {
            let productListFiltered = products.filter({$0.category_name == categorySelected.rawValue.lowercased()})
            let vc = ProductListViewController()
            vc.products = productListFiltered
            vc.category = categorySelected
            print(productListFiltered)
            self.navigationController?.setNavigationBarHidden(false, animated: false)
            self.navigationController?.pushViewController(vc, animated: true)
            print("Seleccionaste \(categories[indexPath.row].category_name)")
        }
    }
}

extension CategoriesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let categoriesName = categories[indexPath.row].category_name.rawValue
        cell.textLabel?.text = categoriesName
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }
    
}

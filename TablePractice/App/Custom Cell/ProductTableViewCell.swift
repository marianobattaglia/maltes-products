//
//  CategoriesTableViewCell.swift
//  TablePractice
//
//  Created by Mariano Martin Battaglia on 28/07/2022.
//

import UIKit

class ProductTableViewCell: UITableViewCell {

    @IBOutlet weak var imageCell: UIImageView!
    @IBOutlet weak var productNameCell: UILabel!
    @IBOutlet weak var categoryNameCell: UILabel!
    @IBOutlet weak var idCell: UILabel!
    @IBOutlet weak var stockUnitsCell: UILabel!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func startSpinner() {
        spinner.isHidden = false
        spinner.startAnimating()
    }
    
    func stopSpinner() {
        spinner.isHidden = true
        spinner.stopAnimating()
    }
    
}

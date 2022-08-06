//
//  String+Extensions.swift
//  TablePractice
//
//  Created by Mariano Martin Battaglia on 02/08/2022.
//

import UIKit

/*
 * Extension for capitalize the first letter of a String
 */
extension String {
    func capitalizingFirstLetter() -> String  {
        return prefix(1).uppercased() + self.lowercased().dropFirst()
    }
    
    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}

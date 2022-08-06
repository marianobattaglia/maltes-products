//
//  ViewController+Extensions.swift
//  TablePractice
//
//  Created by Mariano Martin Battaglia on 31/07/2022.
//

import UIKit

//MARK: - Spinner View
fileprivate var aView: UIView?

extension UIViewController {
    
    func showSpinner() {
        aView = UIView(frame: self.view.bounds)
//        Next line is for put background to the spinner:
        aView?.backgroundColor = UIColor.white
        
        let ai = UIActivityIndicatorView(style: .large)
//        ai.color = UIColor(red: 0.255, green: 0.561, blue: 0.886, alpha: 1.0)
        ai.color = UIColor(ciColor: .black)
        ai.center = aView!.center
        ai.startAnimating()
        aView?.addSubview(ai)
        self.view.addSubview(aView!)
    }
    
    func removeSpinner() {
        aView?.removeFromSuperview()
        aView = nil
    }
}

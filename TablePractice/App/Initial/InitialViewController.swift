//
//  InitialViewController.swift
//  TablePractice
//
//  Created by Mariano Martin Battaglia on 29/07/2022.
//

import UIKit

class InitialViewController: UIViewController {

    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var iniciarButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        nameTextField.delegate = self
        
        //solo para develop
        presentTabBarController()
    }

    @IBAction func onTapIniciar(_ sender: Any) {
        if let userName = nameTextField.text, !userName.isEmpty {
            welcomeAlert()
        } else {
            errorAlert()
        }
    }
    
    func welcomeAlert() {
        let alert = UIAlertController(title: "Hola, \(nameTextField.text ?? "bienvenido")!", message: "", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: { [self] _ in
            presentTabBarController()
        }))
        self.present(alert, animated: true)
    }
    
    func errorAlert() {
        let alert = UIAlertController(title: "Error", message: "Por favor ingrese un nombre", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .destructive))
        self.present(alert, animated: true)
    }
    
    func presentTabBarController() {
        let tabBar = TabBarController()
        tabBar.modalPresentationStyle = .overFullScreen
        self.present(tabBar, animated: true)
    }
    
}

extension InitialViewController: UITextFieldDelegate {
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
}

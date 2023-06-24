//
//  ViewController.swift
//  NiyazTask3V22
//
//  Created by Нияз Шайдуллин on 24.06.2023.
//

import UIKit

/// Экран детальной информации о пользователе
final class AssignmentViewController: UIViewController {
    // MARK: - Constants
    
    private enum Constants {
        static let uniText = "university"
        static let cityText = "city"
        static let emptyString = ""
        static let doneButtonText = "Done"
        static let cancelButtonText = "Cancel"
    }
    
    // MARK: - IBOutlets
    
    @IBOutlet private var textField: UITextField!
    @IBOutlet private var uniLabel: UILabel!
    @IBOutlet private var cityLabel: UILabel!
    
    
    // MARK: - Private Methods
    
    @IBAction private func uniButton(_ sender: Any) {
        showAlert(currentState: true, titleName: Constants.uniText)
    }
    
    @IBAction private func cityButton(_ sender: Any) {
        showAlert(currentState: false, titleName: Constants.cityText)
    }
    
    private func showAlert(currentState: Bool, titleName: String) {
        
        let alert = UIAlertController(title: "Write your \(titleName) name", message: nil, preferredStyle: .alert)
        
        alert.addTextField { (textField) in
            textField.text = Constants.emptyString
        }
        alert.addAction(UIAlertAction(title: Constants.doneButtonText, style: .default, handler: { [weak self] _ in
            guard let alertTextField = alert.textFields?[0] as? UITextField else { return }
            switch currentState {
            case true:
                self?.uniLabel.text = alertTextField.text
            case false:
                self?.cityLabel.text = alertTextField.text
            }
        }))
        alert.addAction(UIAlertAction(title: Constants.cancelButtonText, style: .cancel))
        
        present(alert, animated: true)
    }
}


//
//  UIViewController+Ext.swift
//  Tasks-App
//
//  Created by Taras Veremchuk on 02.03.2025.
//

import UIKit

extension UIViewController {

    @objc
    private func hideKeyboard() {
        view.endEditing(true)
    }

    func addTapToDismissKeyboard() {
        let tap = UITapGestureRecognizer(
            target: self,
            action: #selector(hideKeyboard))
        view.addGestureRecognizer(tap)
    }

    func showAlert(_ message: String) {
        let alert = UIAlertController(
            title: "Внимание", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .cancel)
        alert.addAction(okAction)
        self.present(alert, animated: true)
    }
}

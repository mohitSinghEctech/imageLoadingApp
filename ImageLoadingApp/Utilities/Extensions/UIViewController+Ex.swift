//
//  UIAlertController+Ex.swift
//  ImageLoadingApp
//
//  Created by Akanksha Trivedi on 09/12/20.
//

import UIKit

extension UIViewController {
    func addAlert(message: String) {
        let alert = UIAlertController(title: "Network Error", message: message, preferredStyle: .alert)
        DispatchQueue.main.async {
            self.present(alert, animated: true)
        }
    }
}

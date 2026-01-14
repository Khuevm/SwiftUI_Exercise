//
//  TextFieldAlertPresenter.swift
//  Todoey-SwiftData
//
//  Created by Khue on 13/1/26.
//

import UIKit
import SwiftUI

struct TextFieldAlert {
    let title: String
    let message: String?
    let placeholder: String
    let action: (String) -> Void
}

struct TextFieldAlertVC: UIViewControllerRepresentable {
    @Binding var alert: TextFieldAlert?

    func makeUIViewController(context: Context) -> UIViewController {
        UIViewController()
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        guard let alert else { return }

        let alertController = UIAlertController(
            title: alert.title,
            message: alert.message,
            preferredStyle: .alert
        )

        alertController.addTextField {
            $0.placeholder = alert.placeholder
        }

        alertController.addAction(
            UIAlertAction(title: "Cancel", style: .cancel) { _ in
                self.alert = nil
            }
        )

        alertController.addAction(
            UIAlertAction(title: "OK", style: .default) { _ in
                let text = alertController.textFields?.first?.text ?? ""
                alert.action(text)
                self.alert = nil
            }
        )

        uiViewController.present(alertController, animated: true)
    }
}

//
//  ScannerView.swift
//  Exercise3
//
//  Created by Khue on 18/12/25.
//

import SwiftUI

struct ScannerView: UIViewControllerRepresentable {
    typealias UIViewControllerType = ScannerVC
    @ObservedObject var viewModel: BarcodeScannerVM
    
    func makeUIViewController(context: Context) -> ScannerVC {
        let vc = ScannerVC()
        vc.delegate = context.coordinator
        return vc
    }
    
    func updateUIViewController(_ uiViewController: ScannerVC, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        Coordinator(view: self)
    }
    
    final class Coordinator: NSObject, ScannerDelegate {
        private let view: ScannerView
        
        init(view: ScannerView) {
            self.view = view
        }
        
        func didFindBarcode(barcode: String) {
            view.viewModel.barcode = barcode
            view.viewModel.error = nil
        }
        
        func didError(error: ScannerError) {
            view.viewModel.barcode = ""
            view.viewModel.error = error
        }
    }
}

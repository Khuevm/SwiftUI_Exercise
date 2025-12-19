//
//  BarcodeScannerVM.swift
//  Exercise3
//
//  Created by Khue on 19/12/25.
//

import SwiftUI
import Combine

final class BarcodeScannerVM: ObservableObject {
    @Published var barcode = "Setting up..."
    @Published var error: ScannerError?
}

//
//  ContentView.swift
//  Exercise3
//
//  Created by Khue on 16/12/25.
//

import SwiftUI

struct BarcodeScannerView: View {
    @StateObject var viewModel = BarcodeScannerVM()
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer().frame(height: 20)
                ScannerView(viewModel: viewModel)
                    .frame(height: 400)
                    
                Spacer()
                Label("Scanned Barcode", systemImage: "barcode.viewfinder")
                    .font(.title3)
                
                Text(viewModel.error == nil ? viewModel.barcode : viewModel.error!.rawValue)
                    .font(.title2)
                    .bold()
                    .foregroundStyle(viewModel.error == nil ? Color.green : Color.red)
                    
                Spacer()
            }
            .navigationTitle("Barcode Scanner")
        }
    }
}

#Preview {
    BarcodeScannerView()
}

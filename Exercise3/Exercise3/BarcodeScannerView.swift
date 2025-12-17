//
//  ContentView.swift
//  Exercise3
//
//  Created by Khue on 16/12/25.
//

import SwiftUI

struct BarcodeScannerView: View {
    var body: some View {
        NavigationView {
            VStack {
                Spacer().frame(height: 20)
                Rectangle()
                    .fill(Color.black)
                    .frame(height: 400)
                    
                Spacer()
                Label("Scanned Barcode", systemImage: "barcode.viewfinder")
                    .font(.title3)
                
                Text("Not Yet Scanned")
                    .font(.title2)
                    .bold()
                    .foregroundStyle(Color.red)
                    
                Spacer()
            }
            .navigationTitle("Barcode Scanner")
        }
    }
}

#Preview {
    BarcodeScannerView()
}

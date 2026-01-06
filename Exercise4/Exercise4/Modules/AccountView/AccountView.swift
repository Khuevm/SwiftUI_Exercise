//
//  AccountView.swift
//  Exercise4
//
//  Created by Khue on 29/12/25.
//

import SwiftUI

struct AccountView: View {
    @StateObject var viewModel = AccountViewModel()
    
    var body: some View {
        NavigationStack {
            Form {
                Section("PERSONAL INFO") {
                    TextField("First Name", text: $viewModel.user.firstName)
                    TextField("Last Name", text: $viewModel.user.lastName)
                    TextField("Email", text: $viewModel.user.email)
                        .keyboardType(.emailAddress)
                    DatePicker("Birthday", selection: $viewModel.user.birthDate, displayedComponents: .date)
                    Button {
                        viewModel.saveUser()
                    } label: {
                        Text("Save Changes")
                    }
                }
                
                Section("REQUESTS") {
                    Toggle("Extra Napkins", isOn: $viewModel.user.isExtraNapkins)
                    Toggle("Frequent Refills", isOn: $viewModel.user.isFrequentRefills)
                }
                .tint(Color.accent)
            }
            .navigationTitle("Account")
        }
        .alert(
            viewModel.alertItem?.title ?? "",
            isPresented: Binding(
                get: { viewModel.alertItem != nil },
                set: { if !$0 { viewModel.alertItem = nil } }
            ),
            presenting: viewModel.alertItem
        ) { alert in
            Button(alert.dismissButton, role: .cancel) {}
        } message: { alert in
            Text(alert.desc)
        }
        .onAppear {
            viewModel.getUser()
        }
    }
}

//#Preview {
//    AccountView()
//}

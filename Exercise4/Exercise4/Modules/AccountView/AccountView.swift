//
//  AccountView.swift
//  Exercise4
//
//  Created by Khue on 29/12/25.
//

import SwiftUI

struct AccountView: View {
    @StateObject var viewModel = AccountViewModel()
    @FocusState private var focusTextField: FocusTextField?
    
    enum FocusTextField {
        case firstName, lastName, email
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section("PERSONAL INFO") {
                    TextField("First Name", text: $viewModel.user.firstName)
                        .submitLabel(.next)
                        .focused($focusTextField, equals: .firstName)
                        .onSubmit { focusTextField = .lastName }
                    
                    TextField("Last Name", text: $viewModel.user.lastName)
                        .submitLabel(.next)
                        .focused($focusTextField, equals: .lastName)
                        .onSubmit { focusTextField = .email }
                    
                    TextField("Email", text: $viewModel.user.email)
                        .keyboardType(.emailAddress)
                        .submitLabel(.next)
                        .focused($focusTextField, equals: .email)
                        .onSubmit { focusTextField = nil }
                    
                    DatePicker("Birthday", selection: $viewModel.user.birthDate, in: ...Date(), displayedComponents: .date)
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
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Dismiss") { focusTextField = nil }
                }
            }
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

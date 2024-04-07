//
//  PaymentView.swift
//  ZigZag
//
//  Created by Navodya Weerasooriya on 2024-04-07.
//

import SwiftUI

struct PaymentView: View {
    @Environment(\.presentationMode) var presentationMode
    
    let total: Double
    @State private var name: String = ""
    @State private var address: String = ""
    @State private var showAlert = false
    
    var body: some View {
        VStack {
            VStack {
                Text("Total to Pay")
                    .padding(.top)
                Text("LKR \(String(format: "%.2f", total)) ")
                    .fontWeight(.semibold)
                    .font(.system(size: 40))

                TextField("Name", text: $name)
                    .foregroundColor(.black)
                    .padding()
                    .background(Color.black.opacity(0.05))
                    .cornerRadius(10)
                TextField("Address", text: $address)
                    .foregroundColor(.black)
                    .padding()
                    .background(Color.black.opacity(0.05))
                    .cornerRadius(10)
            }
            .padding()
            
            Spacer()
            
            Button("Pay") {
                showAlert = true
            }
            .foregroundColor(.white)
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color("SplashBlue"))
            .cornerRadius(30)
            .fontWeight(.bold)
            .frame(height: 80)
            .padding()
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Payment Successful"), message: Text("Thank you for your purchase!"), dismissButton: .default(Text("OK")) {
                 
                    presentationMode.wrappedValue.dismiss()
                })
            }
        }
        .navigationTitle("Payment")
    }
}



#Preview {
    PaymentView(total: 1000.00)
}

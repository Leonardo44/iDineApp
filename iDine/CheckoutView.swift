//
//  CheckoutView.swift
//  iDine
//
//  Created by Leonardo López on 23/11/20.
//

import SwiftUI

struct CheckoutView: View {
    @EnvironmentObject var order: Order
    @State private var paymentType = 0
    @State private var addLoyaltyDetails = false
    @State private var loyaltyNumber = ""
    @State private var tipAmount = 1
    @State private var pickupTime = 1
    @State private var showingPaymentAlert = false
    static let paymentTypes = ["Cash", "Credit Card", "iDine Points"]
    static let pickupTimeTypes = ["Now", "Tonight", "Tomorrow Morning"]
    static let tipAmounts = [10, 15, 20, 25, 0]
    var totalPrice: Double {
        let total = Double(order.total)
        let tipValue = total / 100 * Double(Self.tipAmounts[tipAmount])
        return total + tipValue
    }
    
    var body: some View {
        Form {
            Section {
                Picker("How do you want to pay?", selection: $paymentType) {
                    ForEach(0 ..< Self.paymentTypes.count) {
                        Text(Self.paymentTypes[$0])
                    }
                }
                Picker("When will you come for the purchase?", selection: $pickupTime) {
                    ForEach(0 ..< Self.pickupTimeTypes.count) {
                        Text(Self.pickupTimeTypes[$0])
                    }
                }
                Toggle(isOn: $addLoyaltyDetails.animation(), label: {
                    Text("Add iDine loyalty card")
                })
                
                if addLoyaltyDetails {
                    TextField("Enter you iDine ID", text: $loyaltyNumber)
                }
            }
            
            Section(header: Text("Add a tip?")) {
                Picker("Percentage", selection: $tipAmount) {
                    ForEach(0 ..< Self.tipAmounts.count) {
                        Text("\(Self.tipAmounts[$0])%")
                    }
                }
            }
            
            Section(header: Text("Total $\(totalPrice, specifier: "%.2f")").font(.largeTitle)) {
                Button("Confirm order") {
                    self.showingPaymentAlert.toggle()
                }
            }
        }.navigationBarTitle(Text("Payment"), displayMode: .inline).alert(isPresented: $showingPaymentAlert) {
            Alert(title: Text("Order confirmed"), message: Text("Your total was $\(totalPrice, specifier: "%.2f") - than you!"), dismissButton: .default(Text("OK")))
        }
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static let order = Order()
    
    static var previews: some View {
        CheckoutView().environmentObject(order)
    }
}

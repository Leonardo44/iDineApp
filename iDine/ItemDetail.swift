//
//  ItemDetail.swift
//  iDine
//
//  Created by Leonardo López on 11/12/20.
//

import SwiftUI

struct ItemDetail: View {
    @EnvironmentObject var order: Order
    var item: MenuItem
    
    var body: some View {
        VStack {
            ZStack(alignment: .bottomTrailing) {
                Image(item.mainImage)
                Text("Photo: \(item.photoCredit)")
                    .padding(4)
                    .background(Color.black)
                    .font(.caption)
                    .foregroundColor(.white)
            }
            
            Text(item.description).padding()
            Button("Order This") {
                self.order.add(item: self.item)
            }
            Spacer()
        }
        .navigationBarTitle(Text(item.name), displayMode: .inline)
    }
}

struct ItemDetail_Previews: PreviewProvider {
    static let order = Order()
    static var previews: some View {
        NavigationView {
            ItemDetail(item: MenuItem.example).environmentObject(order)
        }
    }
}

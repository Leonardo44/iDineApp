//
//  ItemDetail.swift
//  iDine
//
//  Created by Leonardo López on 11/12/20.
//

import SwiftUI

struct ItemDetail: View {
    @EnvironmentObject var order: Order
    @EnvironmentObject var favorite: Favorite
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
            Button(action: {
                self.order.add(item: self.item)
            }, label: {
                Text("Order This")
                    .foregroundColor(Color.white)
            })
            .frame(width: 256, height: 50, alignment: .center)
            .font(.title2)
            .background(RoundedRectangle(cornerRadius: 8).fill(Color.blue))
    
            Spacer()
        }
        .navigationBarTitle(Text(item.name), displayMode: .inline)
        
        .navigationBarItems(trailing: Button(action: {
            if favorite.items.first(where: { $0.id == item.id }) == nil {
                addItemToFavorite()
            } else {
                removeItemToFavorite()
            }
        }, label: {
            if favorite.items.first(where: { $0.id == item.id }) == nil {
                Image(systemName: "star")
            } else {
                Image(systemName: "star.fill")
            }
        }))
    }
    
    func addItemToFavorite() {
        favorite.add(item: FavoriteItem(id: item.id, name: item.name))
    }
    
    func removeItemToFavorite() {
        favorite.items.removeAll(where: { $0.id == item.id })
    }
}

struct ItemDetail_Previews: PreviewProvider {
    static let order = Order()
    static let favorite = Favorite()
    
    static var previews: some View {
        NavigationView {
            ItemDetail(item: MenuItem.example).environmentObject(order).environmentObject(favorite)
        }
    }
}

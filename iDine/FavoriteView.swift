//
//  FavoriteView.swift
//  iDine
//
//  Created by Leonardo López on 30/11/20.
//

import SwiftUI

struct FavoriteView: View {
    @EnvironmentObject var favorite: Favorite
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    ForEach(favorite.items) { item in
                        HStack {
                            Text(item.name)
                        }
                    }.onDelete(perform: deleteItems(at:))
                }
            }
            .navigationTitle("Favorites")
            .listStyle(GroupedListStyle())
            .navigationBarItems(trailing: EditButton())
        }
    }
    
    func deleteItems(at offsets: IndexSet) {
        favorite.items.remove(atOffsets: offsets)
    }
}

struct FavoriteView_Previews: PreviewProvider {
    static let favorite = Favorite()
    
    static var previews: some View {
        FavoriteView().environmentObject(favorite)
    }
}

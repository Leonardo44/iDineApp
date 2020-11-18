//
//  ContentView.swift
//  iDine
//
//  Created by Leonardo López on 11/9/20.
//

import SwiftUI

struct ContentView: View {
    let menu = Bundle.main.decode([MenuSection].self, from:
    "menu.json")
    @EnvironmentObject var order: Order
    
    var body: some View {
        
        TabView {
            NavigationView {
                List {
                    ForEach(menu) { section in
                        Section(header: Text(section.name)) {
                            ForEach(section.items) { item in
                                ItemRow(item: item)
                            }
                        }
                    }
                }
                .navigationTitle("Menu")
                .listStyle(GroupedListStyle())
            }.tabItem {
                Image(systemName: "list.dash")
                Text("Menu")
            }
            
            OrderView().tabItem {
                Image(systemName: "square.and.pencil")
                Text("Order")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static let order = Order()
    
    static var previews: some View {
        ContentView().environmentObject(order)
    }
}

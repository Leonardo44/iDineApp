//
//  ItemRow.swift
//  iDine
//
//  Created by Leonardo López on 11/9/20.
//

import SwiftUI

struct ItemRow: View {
    var item: MenuItem
    static let colors: [String: Color] = ["D": .purple, "G": .black, "N": .red, "S": .blue, "V": .green]
    
    var body: some View {
        NavigationLink(
            destination: ItemDetail(item: item)) {
            HStack {
                Image(item.thumbnailImage).clipShape(Circle())
                    .overlay(Circle().stroke(Color.gray, lineWidth: 2))
                
                VStack(alignment: .leading, spacing: nil) {
                    Text(item.name).font(.headline)
                    Text("$\(item.price)")
                }
                Spacer()
                ForEach(item.restrictions, id: \.self) { restricition in
                    Text(restricition)
                        .font(.caption)
                        .fontWeight(.black)
                        .padding(5)
                        .background(Self.colors[restricition, default: .black])
                        .clipShape(Circle())
                        .foregroundColor(.white)
                }
            }
        }
    }
}

struct ItemRow_Previews: PreviewProvider {
    static var previews: some View {
        ItemRow(item: MenuItem.example)
    }
}

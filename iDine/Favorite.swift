//
//  Favorite.swift
//  iDine
//
//  Created by Leonardo López on 30/11/20.
//

import Foundation
import SwiftUI

class Favorite: ObservableObject {
    @Published var items = [FavoriteItem]()

    func add(item: FavoriteItem) {
        items.append(item)
    }

    func remove(item: FavoriteItem) {
        if let index = items.firstIndex(of: item) {
            items.remove(at: index)
        }
    }
}

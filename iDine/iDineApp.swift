//
//  iDineApp.swift
//  iDine
//
//  Created by Leonardo López on 11/9/20.
//

import SwiftUI

@main
struct iDineApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(Order()).environmentObject(Favorite())
        }
    }
}

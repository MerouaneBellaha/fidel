//
//  FidelApp.swift
//  Fidel
//
//  Created by Merouane Bellaha on 23/01/2022.
//

import SwiftUI

@main
struct FidelApp: App {
    @StateObject var appState = AppState()
    
    var body: some Scene {
        WindowGroup {
            HomeView().environmentObject(appState)
        }
    }
}

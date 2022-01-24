//
//  AppState.swift
//  Fidel
//
//  Created by Merouane Bellaha on 24/01/2022.
//

import Foundation

class AppState: ObservableObject {
    let user: User
    
    init(user: User = UserGenerator.create()) {
        self.user = user
        
    }
}

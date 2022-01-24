//
//  CardListView.swift
//  Fidel
//
//  Created by Merouane Bellaha on 24/01/2022.
//

import SwiftUI

struct CardListView: View {
    
    let cards: [Card]
    
    var body: some View {
        List(cards) { card in
            CardView(card: card)
        }
    }
}

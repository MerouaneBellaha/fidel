//
//  CardView.swift
//  Fidel
//
//  Created by Merouane Bellaha on 23/01/2022.
//

import SwiftUI

struct CardView: View {
    let card: Card
    
    var body: some View {
        
        
        HStack {
            VStack(alignment: .leading, spacing: 7) {
                Text(card.owner)
                    .font(.title.bold())
                Spacer()

                
                    Text("🎁 \(card.reward)")
                        .font(.body)
//                    Spacer()
                    Text("\(card.numberOfStamps)/\(card.limit) ✅")
                        .font(.body )
            }
            .padding(.all)
            .padding(.vertical, 30)
            .foregroundColor(.white)
            
            
            VStack {
                Spacer()
                Image(card.logo)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
                    .padding()
            }
            .background(Color.yellow)
            
            
        }
        .frame(height: 200)
        .background(Color("cardBackground"))
        .cornerRadius(16)
    }
}


struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: Card(owner: "Canopée",
                            id: UUID(),
                            logo: "logo1.jpg"))
    }
}

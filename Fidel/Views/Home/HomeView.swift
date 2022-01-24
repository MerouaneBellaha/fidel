//
//  ContentView.swift
//  Fidel
//
//  Created by Merouane Bellaha on 23/01/2022.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var vm = HomeViewModel()
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        
        NavigationView {
            VStack {
                Image(uiImage: vm.QRCode)
                    .interpolation(.none)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                Text("Ton QrCode, prends en soin :)")
                    .font(.subheadline.italic())
            }
            .onAppear {
                vm.create(uuid: appState.user.uuid)
            }
            .navigationTitle("Hello \(appState.user.name)!")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink("Cards", destination:  CardListView(cards: appState.user.cards))
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(AppState())
    }
}

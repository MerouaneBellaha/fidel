//
//  ContentView.swift
//  Fidel
//
//  Created by Merouane Bellaha on 23/01/2022.
//

import SwiftUI

struct Helper {
    static func createUser() -> User {
        return User(uuid: UUID(),
             name: "Doe",
             firstName: "John",
             cards: [
                Card(owner: "Canopée", id: UUID(), logo: "logo1.jpg"),
                Card(owner: "Les Brasseurs", id: UUID(), logo: "logo2.jpg")
             ])
    }
}

class AppState: ObservableObject {
    let user: User
    
    init(user: User = Helper.createUser()) {
        self.user = user
        
    }
}

struct User {
    let uuid: UUID
    let name: String
    let firstName: String
    let cards: [Card]
}

struct Card: Identifiable {
    
    let owner: String
    let id: UUID
    let numberOfStamps = 5
    let logo: String
    let reward: String = "un menu offert !"
    let limit = 10
}


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
                Text("C'est ton QRCode")
                    .font(.body.italic())
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

struct CardListView: View {
    
    let cards: [Card]
    
    var body: some View {
        List(cards) { card in
            CardView(card: card)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(AppState()) 
    }
}

class HomeViewModel: ObservableObject {

    @Published var QRCode = UIImage()
    
    private let qrCodeService = QRCodeService()
    
    func create(uuid: UUID) {
        QRCode = qrCodeService.generateQRCode(from: uuid)
    }
}

import CoreImage.CIFilterBuiltins

struct QRCodeService {
    
    let context = CIContext()
    let generator = CIFilter.qrCodeGenerator()
    
    
    func generateQRCode(from uuid: UUID) -> UIImage {
        generator.message = Data(uuid.uuidString.utf8)
        
        if let outputImage = generator.outputImage {
            if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
                return UIImage(cgImage: cgimg)
            }
        }
        return UIImage(systemName: "xmark.circle") ?? UIImage()
    }
}

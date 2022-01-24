//
//  HomeViewModel.swift
//  Fidel
//
//  Created by Merouane Bellaha on 24/01/2022.
//

import SwiftUI

class HomeViewModel: ObservableObject {

    @Published var QRCode = UIImage()
    
    private let qrCodeService = QRCodeService()
    
    func create(uuid: UUID) {
        QRCode = qrCodeService.generateQRCode(from: uuid)
    }
}

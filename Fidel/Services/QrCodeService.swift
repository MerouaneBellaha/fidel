//
//  QrCodeService.swift
//  Fidel
//
//  Created by Merouane Bellaha on 24/01/2022.
//

import CoreImage.CIFilterBuiltins
import SwiftUI

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

//
//  ImageUploadManager.swift
//  OnlyAcademy
//
//  Created by Igor Augusto Wolf on 25/06/24.
//

import Foundation
import UIKit
import Supabase

class ImageUploadManager {
    static let shared = ImageUploadManager()
    
    func uploadImage(image: UIImage, completion: @escaping (Result<String, Error>) -> Void) {
        guard let imageData = image.jpegData(compressionQuality: 0.5) else {
            completion(.failure(NSError(domain: "InvalidImageData", code: 0, userInfo: nil)))
            return
        }
        
        // Nome único para a imagem (pode ser o UUID ou algo semelhante)
        let imageName = "\(UUID().uuidString).jpeg"
        
        // Caminho onde a imagem será armazenada no Supabase Storage
        let imagePath = "images/\(imageName)"
        
        // Upload da imagem para o Supabase Storage
        SupabaseClientManager.shared.client.storage
            .from("public") // Nome do bucket no Supabase Storage
            .upload(file: imageData, fileName: imageName, path: imagePath, contentType: .jpeg)
            .then { result in
                guard let imageUrl = result.url else {
                    completion(.failure(NSError(domain: "ImageUploadFailed", code: 0, userInfo: nil)))
                    return
                }
                completion(.success(imageUrl))
            }
            .catch { error in
                completion(.failure(error))
            }
    }
}

//
//  PaymentManager.swift
//  OnlyAcademy
//
//  Created by Igor Augusto Wolf on 18/05/24.
//
import Foundation

class PaymentManager {
    static func processPayment(plan: String, cardNumber: String, expiryDate: String, cvv: String, cardHolderName: String, completion: @escaping (Bool) -> Void) {
        // Montar a URL e o request
        guard let url = URL(string: "https://api.pagseguro.uol.com.br/") else {
            completion(false)
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let paymentInfo: [String: Any] = [
            "plan": plan,
            "cardNumber": cardNumber,
            "expiryDate": expiryDate,
            "cvv": cvv,
            "cardHolderName": cardHolderName
        ]

        guard let httpBody = try? JSONSerialization.data(withJSONObject: paymentInfo, options: []) else {
            completion(false)
            return
        }
        request.httpBody = httpBody

        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                completion(false)
                return
            }

            if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 {
                completion(true)
            } else {
                completion(false)
            }
        }.resume()
    }
}

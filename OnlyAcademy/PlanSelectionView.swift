//
//  PlanSelectionView.swift
//  OnlyAcademy
//
//  Created by Igor Augusto Wolf on 18/05/24.
//

import SwiftUI

struct PlanSelectionView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("Selecione seu Plano")
                    .font(.largeTitle)
                    .padding()

                NavigationLink(destination: PaymentView(plan: "FREE")) {
                    Text("FREE")
                        .font(.title)
                        .padding()
                        .background(Color.gray)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }

                NavigationLink(destination: PaymentView(plan: "PREMIUM MENSAL")) {
                    Text("PREMIUM MENSAL")
                        .font(.title)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }

                NavigationLink(destination: PaymentView(plan: "PREMIUM ANUAL")) {
                    Text("PREMIUM ANUAL")
                        .font(.title)
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .navigationBarTitle("Planos", displayMode: .inline)
        }
    }
}

struct PlanSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        PlanSelectionView()
    }
}

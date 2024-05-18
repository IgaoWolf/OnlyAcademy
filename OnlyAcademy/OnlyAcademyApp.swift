//
//  OnlyAcademyApp.swift
//  OnlyAcademy
//
//  Created by Igor Augusto Wolf on 18/05/24.
//

import SwiftUI
import SwiftData

@main
struct OnlyAcademyApp: App {
    var sharedModelContainer: ModelContainer = {
        // Define o esquema com os modelos persistentes
        let schema = Schema([
            Item.self,  // Não precisa de 'as any PersistentModel.Type' aqui
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            PlanSelectionView()
                .modelContainer(sharedModelContainer)  // Injetar o model container
        }
    }
}

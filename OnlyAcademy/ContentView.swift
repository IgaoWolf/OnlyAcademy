//
//  ContentView.swift
//  OnlyAcademy
//
//  Created by Igor Augusto Wolf on 18/05/24.
//
import SwiftUI

struct ContentView: View {
    var body: some View {
        ProfileView()
        CameraView()
        PlanSelectionView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

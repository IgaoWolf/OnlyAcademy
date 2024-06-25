//
//  SupabaseClient.swift
//  OnlyAcademy
//
//  Created by Igor Augusto Wolf on 25/06/24.
//

import Foundation

import Supabase

class SupabaseClientManager {
    static let shared = SupabaseClientManager()
    
    private let supabaseUrl = URL(string: "https://ccfnsqszjwcypxcziapl.supabase.co")!
    private let supabaseKey = "vm7Bt4x7GbB2Rkn6n+F2tpM/HX3CL33PPseMPfWtRoo/31SiSh/M3ctyw7GGg59dJzNx/6zM+4Db7z/jowaWFQ=="

    let client: SupabaseClient

    private init() {
        client = SupabaseClient(supabaseURL: supabaseUrl, supabaseKey: supabaseKey)
    }
}

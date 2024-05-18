//
//  Item.swift
//  OnlyAcademy
//
//  Created by Igor Augusto Wolf on 18/05/24.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}

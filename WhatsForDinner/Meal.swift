//
//  Meal.swift
//  WhatsForDinner
//
//  Created by Shannon Fluellen on 5/4/20.
//  Copyright © 2020 Shannon Fluellen. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

struct Meal : Hashable, Identifiable {
    let id = UUID()
    var entree : String
    var side1 : String
    var side2 : String
    
    var mealPhoto : Image
    
    init(entree: String, side1: String, side2: String) {
        self.entree = entree
        self.side1 = side1
        self.side2 = side2
        self.mealPhoto = Image("meal-icon.png")
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(entree)
        hasher.combine(side1)
        hasher.combine(side2)
    }
}

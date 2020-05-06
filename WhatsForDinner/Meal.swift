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

class Meal : ObservableObject {
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
}

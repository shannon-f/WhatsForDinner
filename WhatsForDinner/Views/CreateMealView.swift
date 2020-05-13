//
//  CreateMealView.swift
//  WhatsForDinner
//
//  Created by Shannon Fluellen on 5/6/20.
//  Copyright © 2020 Shannon Fluellen. All rights reserved.
//

import SwiftUI

struct CreateMealView: View {
    @State var entree  = ""
    @State var side1  = ""
    
    var body: some View {
        VStack {
            Text("New Meal")
            TextField("Entree", text: $entree)
            TextField("Side 1", text: $side1)
        }
    }
}

struct CreateMealView_Previews: PreviewProvider {
    static var previews: some View {
        CreateMealView()
    }
}

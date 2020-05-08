//
//  CreateMealView.swift
//  WhatsForDinner
//
//  Created by Shannon Fluellen on 5/6/20.
//  Copyright © 2020 Shannon Fluellen. All rights reserved.
//

import SwiftUI

struct CreateMealView: View {
//    @Binding var entree : String?
    
    var body: some View {
        VStack (alignment: .leading) {
            Text("New Meal").font(.largeTitle)
//            TextField("Entree", text: entree)
        }
    }
}

struct CreateMealView_Previews: PreviewProvider {
    static var previews: some View {
        CreateMealView()
    }
}

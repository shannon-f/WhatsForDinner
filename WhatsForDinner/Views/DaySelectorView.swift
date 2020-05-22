//
//  DaySelectorView.swift
//  WhatsForDinner
//
//  Created by Shannon Fluellen on 5/15/20.
//  Copyright © 2020 Shannon Fluellen. All rights reserved.
//

import SwiftUI

struct DaySelectorView: View {
    var body: some View {
        VStack {
            ForEach(Day.allCases, id: \.self) { day in
                Button(action: {}){
                    Text(day.rawValue).background(Circle().border(Color.blue).frame(width: 100, height: 100)).clipped().padding()
                }
                
            }
        }
    }
}

struct DaySelectorView_Previews: PreviewProvider {
    static var previews: some View {
        DaySelectorView()
    }
}

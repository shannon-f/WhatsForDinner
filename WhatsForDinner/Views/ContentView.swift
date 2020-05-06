//
//  ContentView.swift
//  WhatsForDinner
//
//  Created by Shannon Fluellen on 5/4/20.
//  Copyright © 2020 Shannon Fluellen. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var daysOfTheWeek = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
    
    var body: some View {
        VStack {
            Image("meal-icon").resizable()
            Divider()
            HStack{
                ZStack {
                    NavigationView {
                        List {
                            ForEach(daysOfTheWeek, id: \.self) {
                                Text($0)
                            }
                        }.navigationBarTitle("Days")
                        
                    }
                    HStack {
                        Spacer()
                        VStack {
                            Spacer()
                            Button(action: {}) {
                                Image(systemName: "plus.circle").resizable().frame(width: 50, height: 50).padding()
                            }
                        }
                    }
                }
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
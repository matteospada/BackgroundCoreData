//
//  ContentView.swift
//  BackgroundCoreData
//
//  Created by Matteo Spada on 20/11/22.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var numbers = ContentViewViewModel()
    
    var body: some View {
        VStack {
            List {
                ForEach(numbers.values, id: \.self){ number in
                    Text("\(number)")
                }
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

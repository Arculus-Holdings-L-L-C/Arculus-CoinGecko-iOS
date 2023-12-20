//
//  ContentView.swift
//  GeckoApp
//
//  Created by Sean Orelli on 12/20/23.
//

import SwiftUI

struct ContentView: View {
    let model = Model()
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .onAppear(){
            model.setup()
        }
    }
}

#Preview {
    ContentView()
}

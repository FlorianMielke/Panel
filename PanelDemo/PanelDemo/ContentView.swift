/**
 *  Panel
 *  Copyright (c) Florian Mielke 2021
 *  MIT license, see LICENSE file for details
 */

import SwiftUI

struct ContentView: View {
    @State private var panelDetent = PanelDetent.medium
    @State private var searchString = ""
    
    var body: some View {
        VStack {
            Image("Logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(100)
        }
        .panel(
            Panel(detent: $panelDetent) {
                VStack {
                    TextField("Search", text: $searchString)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal)
                    
                    List {
                        ForEach(0..<100, id: \.self) {
                            Text("Element \($0)")
                        }
                    }
                }
            })
        .background(Color(UIColor.systemTeal))
        .ignoresSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .previewDevice("iPhone 12 mini")
            
            ContentView()
                .previewDevice("iPad Pro (11-inch) (3rd generation)")
        }
    }
}

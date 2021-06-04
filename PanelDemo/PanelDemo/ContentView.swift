/**
*  Panel
*  Copyright (c) Florian Mielke 2021
*  MIT license, see LICENSE file for details
*/

import SwiftUI

struct ContentView: View {
    @State private var panelAnchor = PanelAnchor.medium
    
    var body: some View {
        VStack {
            Panel(anchor: $panelAnchor) {
                List {
                    ForEach(0..<100, id: \.self) {
                        Text("Element \($0)")
                    }
                }
            }
        }
        .background(Color.gray)
        .ignoresSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

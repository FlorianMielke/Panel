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
            Image("Logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(100)
        }
        .panel(
            Panel(anchor: $panelAnchor) {
                List {
                    ForEach(0..<100, id: \.self) {
                        Text("Element \($0)")
                    }
                }
            })
        .background(Color(UIColor.systemTeal))
        .ignoresSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

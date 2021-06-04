/**
*  Panel
*  Copyright (c) Florian Mielke 2021
*  MIT license, see LICENSE file for details
*/

import SwiftUI

struct ContentView: View {
    @State private var panelAnchor = PanelAnchor.medium
    
    var body: some View {
        GeometryReader { geometry in
            Panel(anchor: $panelAnchor, insets: geometry.safeAreaInsets) {
                List {
                    ForEach(0..<100, id: \.self) {
                        Text("Element \($0)")
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

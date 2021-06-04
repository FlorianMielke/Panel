/**
*  Panel
*  Copyright (c) Florian Mielke 2021
*  MIT license, see LICENSE file for details
*/

import SwiftUI

public extension View {
    func panel<Panel: PanelView>(_ panel: Panel) -> some View {
        ZStack {
            self
            panel
        }
    }
}

/**
*  Panel
*  Copyright (c) Florian Mielke 2021
*  MIT license, see LICENSE file for details
*/

import SwiftUI

extension EdgeInsets {
    static var panel: EdgeInsets {
        guard let safeArea = UIApplication.shared.windows.first?.safeAreaInsets else {
            return EdgeInsets(top: 20.0, leading: 0.0, bottom: 20.0, trailing: 0.0)
        }

        return EdgeInsets(safeArea)
    }
    
    init(_ edgeInsets: UIEdgeInsets) {
        self.init()
        top = edgeInsets.top
        leading = edgeInsets.left
        bottom = edgeInsets.bottom
        trailing = edgeInsets.right
    }
}

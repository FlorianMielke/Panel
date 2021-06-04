/**
*  Panel
*  Copyright (c) Florian Mielke 2021
*  MIT license, see LICENSE file for details
*/

import Foundation

extension Array where Element: (Comparable & SignedNumeric) {
    func nearest(to value: Element) -> Element? {
        enumerated().min(by: {
            abs($0.element - value) < abs($1.element - value)
        })?.element
    }
}

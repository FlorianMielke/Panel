/**
*  Panel
*  Copyright (c) Florian Mielke 2021
*  MIT license, see LICENSE file for details
*/

import SwiftUI

enum DragState {
    case inactive
    case dragging(translation: CGSize)
    
    var translation: CGSize {
        switch self {
        case .inactive:
            return .zero
        case .dragging(let translation):
            return translation
        }
    }
    
    var isDragging: Bool {
        switch self {
        case .inactive:
            return false
        case .dragging:
            return true
        }
    }
}

extension DragGesture.Value {
    var direction: Direction {
        let movement = predictedEndLocation.y - location.y
        if movement < 0 {
            return .up
        } else if movement > 1 {
            return .down
        } else {
            return .none
        }
    }
    
    enum Direction {
        case up, down, none
    }
}

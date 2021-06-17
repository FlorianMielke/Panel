/**
*  Panel
*  Copyright (c) Florian Mielke 2021
*  MIT license, see LICENSE file for details
*/

import SwiftUI

struct PanelEnvironment {
    let detent: PanelDetent
    let geometry: GeometryProxy
    let sizeClass: UserInterfaceSizeClass?
    let dragState: DragState
    
    let insets = EdgeInsets.panel

    var isCompact: Bool {
        sizeClass == .compact
    }
    
    var padding: EdgeInsets {
        return isCompact ? EdgeInsets() : EdgeInsets(top: insets.top + 10.0, leading: 10.0, bottom: 0.0, trailing: 0.0)
    }
    
    var alignment: Alignment {
        isCompact ? .bottom : .top
    }
    
    var animation: Animation? {
        dragState.isDragging ? nil : .interpolatingSpring(stiffness: 400.0, damping: 50.0, initialVelocity: 10.0)
    }
    
    var spacing: CGFloat {
        isCompact ? 0.0 : 4.0
    }
}

// MARK: - Size
extension PanelEnvironment {
    var width: CGFloat {
        isCompact ? max(geometry.size.width, Size.maxWidth) : Size.maxWidth
    }

    var height: CGFloat {
        let detents = detents()
        let predictedHeight = predictedHeight

        let largeHeight = detents[.large]!
        if predictedHeight > largeHeight {
            let diff = predictedHeight - largeHeight
            let stiffness = diff * CGFloat(0.6)
            return predictedHeight - stiffness
        }

        let smallHeight = detents[.small]!
        if predictedHeight < smallHeight {
            let diff = smallHeight - predictedHeight
            let stiffness = diff * CGFloat(0.6)
            return predictedHeight + stiffness
        }

        return predictedHeight
    }

    private enum Size {
        static let maxWidth: CGFloat = 375.0
    }
}

extension PanelEnvironment {
    func anchor(for drag: DragGesture.Value) -> PanelDetent {
        switch drag.direction {
        case .up:
            return nearby().0
        case .down:
            return nearby().1
        case .none:
            return closest()
        }
    }

    private func nearby() -> (PanelDetent, PanelDetent) {
        if predictedHeight >= PanelDetent.medium.height(for: self) {
            return isCompact ? (.large, .medium) : (.medium, .large)
        } else {
            return isCompact ? (.medium, .small) : (.small, .medium)
        }
    }

    private func closest() -> PanelDetent {
        let anchors = detents()
        let nearestHeight = Array(anchors.values).nearest(to: predictedHeight)
        return anchors.first(where: { $1 == nearestHeight })?.key ?? .small
    }

    private func detents() -> [PanelDetent: CGFloat] {
        return Dictionary(uniqueKeysWithValues: PanelDetent.allCases.map { ($0, $0.height(for: self)) })
    }
}

// MARK: - Predicted Height
extension PanelEnvironment {
    var predictedHeight: CGFloat {
        if isCompact {
            return detent.height(for: self) - dragState.translation.height
        } else {
            return detent.height(for: self) + dragState.translation.height
        }
    }
}

/**
*  Panel
*  Copyright (c) Florian Mielke 2021
*  MIT license, see LICENSE file for details
*/

import SwiftUI

public protocol PanelView: View {}

public struct Panel<Content: View> : PanelView {
    @Binding private var detent: PanelDetent
    private let content: () -> Content
    
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    @GestureState private var dragState = DragState.inactive
    private let shadowColor = Color(.sRGBLinear, white: 0, opacity: 0.13)
    
    public init(detent: Binding<PanelDetent>, @ViewBuilder content: @escaping () -> Content) {
        self._detent = detent
        self.content = content
    }
    
    public var body: some View {
        GeometryReader { geometry in
            let environment = PanelEnvironment(detent: detent, geometry: geometry, sizeClass: horizontalSizeClass, dragState: dragState)
            
            VStack(spacing: environment.spacing) {
                if environment.isCompact {
                    Handle()
                    content()
                } else {
                    content()
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
                    Handle()
                }
            }
            .frame(maxWidth: environment.width, maxHeight: environment.height, alignment: .top)
            .background(BlurView(style: .systemChromeMaterial))
            .cornerRadius(10.0)
            .shadow(color: shadowColor, radius: 10.0)
            .frame(maxHeight: .infinity, alignment: environment.alignment)
            .padding(environment.padding)
            .animation(environment.animation)
            .gesture(
                DragGesture()
                    .updating($dragState) { drag, state, transaction in
                        state = .dragging(translation: drag.translation)
                    }
                    .onEnded { value in
                        onDragEnded(drag: value, environment: environment)
                    }
            )
            .ignoresSafeArea(edges: .bottom)
        }
    }
    
    private func onDragEnded(drag: DragGesture.Value, environment: PanelEnvironment) {
        detent = environment.anchor(for: drag)
    }
}

struct Panel_Previews: PreviewProvider {
    static var content: some View {
        List {
            ForEach(0..<100, id: \.self) {
                Text("Element \($0)")
            }
        }
    }

    static var previews: some View {
        Group {
            Panel(detent: .constant(.medium)) {
                content
            }
            .previewDevice("iPad Pro (11-inch) (3rd generation)")
            
            Panel(detent: .constant(.small)) {
                content
            }
            .previewDevice("iPhone 12 mini")
        }
    }
}

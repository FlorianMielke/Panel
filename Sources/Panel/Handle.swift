/**
*  Panel
*  Copyright (c) Florian Mielke 2021
*  MIT license, see LICENSE file for details
*/

import SwiftUI

struct Handle : View {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    private let handleThickness = CGFloat(5.0)
    
    var body: some View {
        VStack(spacing: 0) {
            if horizontalSizeClass == .regular {
                Divider()
            }

            RoundedRectangle(cornerRadius: handleThickness / 2.0)
                .frame(width: 40, height: 5.0)
                .foregroundColor(Color.secondary.opacity(0.5))
                .padding(7)
        }
        .frame(maxWidth: .infinity, alignment: .center)
    }
}

struct Handle_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Handle()
                .previewDevice("iPad Pro (11-inch) (3rd generation)")
                .preferredColorScheme(.dark)
            
            Handle()
                .preferredColorScheme(.dark)
        }
    }
}

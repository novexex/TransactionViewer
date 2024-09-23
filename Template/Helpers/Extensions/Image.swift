
import SwiftUI

extension Image {
    func background() -> some View {
        GeometryReader { geo in
            self
                .resizable()
                .scaledToFill()
                .frame(width: geo.size.width,
                       height: geo.size.height)
        }
        .ignoresSafeArea()
    }
}

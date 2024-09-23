
import SwiftUI

extension View {
    func navigate<NewView: View>(when binding: Binding<Bool>,
                                 isNavigationBarHidden: Bool = true,
                                 navigationBarTitle: String = "",
                                 @ViewBuilder view: () -> NewView) -> some View {
        NavigationView {
            ZStack {
                self
                    .navigationBarTitle("")
                    .navigationBarHidden(true)
                NavigationLink(
                    destination: view()
                        .navigationBarTitle(navigationBarTitle)
                        .navigationBarTitleDisplayMode(.inline)
                        .navigationBarHidden(isNavigationBarHidden),
                    isActive: binding
                ) {
                    EmptyView()
                }
            }
        }
        .navigationViewStyle(.stack)
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

extension View {
    func disabledAndGrayed(_ condition: Bool) -> some View {
        self
            .disabled(condition)
            .grayscale(condition ? 1 : 0)
    }
}

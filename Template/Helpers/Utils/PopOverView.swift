import SwiftUI

fileprivate struct PopOverView<PopOverContent: View>: ViewModifier {
    let popup: () -> PopOverContent
    let isPresented: Binding<Bool>
    let animation: Animation

    func body(content: Content) -> some View {
        ZStack {
            content
                .blur(radius: isPresented.wrappedValue ? 2 : 0)
            
            if isPresented.wrappedValue {
                popup()
            }
        }
        .animation(animation, value: isPresented.wrappedValue)
    }
}

extension View {
    func popOver<PopOverContent: View>(
        isPresented: Binding<Bool>,
        animation: Animation = .easeInOut(duration: 0.5),
        @ViewBuilder popOverContent: @escaping () -> PopOverContent
    ) -> some View {
        self.modifier(PopOverView(popup: popOverContent, isPresented: isPresented, animation: animation))
    }
}


import SwiftUI

private struct DismissToMenuActionKey: EnvironmentKey {
    static let defaultValue: DismissAction? = nil
}

extension EnvironmentValues {
    var dismissToMenuAction: DismissAction? {
        get {
            self[DismissToMenuActionKey.self]
        }
        set {
            self[DismissToMenuActionKey.self] = newValue
        }
    }
}

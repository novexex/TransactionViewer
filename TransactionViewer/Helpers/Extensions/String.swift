
import Foundation

extension String {
    var currencySymbol: String? {
        let locale = Locale.availableIdentifiers
            .map { Locale(identifier: $0) }
            .first { $0.currencyCode == self }
        
        return locale?.currencySymbol
    }
}

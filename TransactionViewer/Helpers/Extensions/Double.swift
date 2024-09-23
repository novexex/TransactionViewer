
import Foundation

extension Double {
    var formattedCurrency: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencySymbol = ""
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        formatter.groupingSeparator = ","
        formatter.decimalSeparator = "."
        formatter.usesGroupingSeparator = true
        
        return formatter.string(from: NSNumber(value: self)) ?? String(format: "%.2f", self)
    }
}

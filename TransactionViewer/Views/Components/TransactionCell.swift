
import SwiftUI

struct TransactionCell: View {
    let transaction: TransactionModel
    let convertedToGBP: Double
    
    var formattedGBP: String {
        convertedToGBP.formattedCurrency
    }
    
    var currencySymbol: String {
        transaction.currency.currencySymbol ?? transaction.currency
    }
    
    var body: some View {
        HStack {
            Text(currencySymbol + transaction.amount)
            
            Spacer()
            
            Text("£\(formattedGBP)")
                .foregroundStyle(.gray)
        }
    }
}


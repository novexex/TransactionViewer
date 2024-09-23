
import SwiftUI

struct ProductCell: View {
    let groupedTransactions: TransactionGroup
    
    var body: some View {
        HStack {
            Text(groupedTransactions.sku)
            
            Spacer()
            
            Text(groupedTransactions.transactions.count.description + " transactions")
                .foregroundStyle(.gray)
        }
    }
}

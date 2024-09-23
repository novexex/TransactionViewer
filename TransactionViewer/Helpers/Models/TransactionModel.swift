
import Foundation

typealias Transactions = [TransactionModel]

struct TransactionModel: Identifiable {
    let id: UUID
    let amount: String
    let currency: String
    let sku: String
    
    init(from decodableModel: DecodableTransactionModel) {
        self.amount = decodableModel.amount
        self.currency = decodableModel.currency
        self.sku = decodableModel.sku
        self.id = UUID()
    }
}

// Helpers
extension TransactionModel {
    var amountValue: Double? {
        Double(amount)
    }
}

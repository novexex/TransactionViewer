
import Foundation

typealias TransactionGroups = [TransactionGroup]

struct TransactionGroup: Identifiable {
    let id = UUID()
    let sku: String
    let transactions: Transactions
}

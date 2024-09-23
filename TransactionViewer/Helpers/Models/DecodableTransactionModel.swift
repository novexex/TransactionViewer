
typealias DecodableTransactions = [DecodableTransactionModel]

struct DecodableTransactionModel: Decodable {
    let amount: String
    let currency: String
    let sku: String
}

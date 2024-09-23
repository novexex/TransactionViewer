
protocol DataSourceMappableProtocol {
    func convertToIdentifiable(items: DecodableTransactions) -> Transactions
}

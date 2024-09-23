
protocol DataSourceDecodableRatesProtocol {
    func decodeRates(for resource: String, with extension: String) -> Rates?
}

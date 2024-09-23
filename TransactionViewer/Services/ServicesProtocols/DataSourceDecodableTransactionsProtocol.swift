
import Foundation

protocol DataSourceDecodableTransactionsProtocol {
    func decodeTransactions(for resource: String, with extension: String) -> DecodableTransactions?
}

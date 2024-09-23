
import Foundation

final class DataSourceService {
    private let decoder: PropertyListDecoder
    
    init(
        decoder: PropertyListDecoder = .init()
    ) {
        self.decoder = decoder
    }
    
    private func decode<T: Decodable>(for resource: String, with extension: String) -> T? {
        guard let url = Bundle.main.url(forResource: resource, withExtension: `extension`) else {
            NSLog("\(String(describing: self)): Resource not found")
            return nil
        }
        
        do {
            let data = try Data(contentsOf: url)
            let decodableItem = try decoder.decode(T.self, from: data)
            return decodableItem
        } catch {
            NSLog("\(String(describing: self)): " + error.localizedDescription)
            return nil
        }
    }
}

extension DataSourceService: DataSourceMappableProtocol {
    func convertToIdentifiable(items: DecodableTransactions) -> Transactions {
        items.map { item in
            TransactionModel(from: item)
        }
    }
}

extension DataSourceService: DataSourceDecodableTransactionsProtocol {
    func decodeTransactions(for resource: String, with extension: String) -> DecodableTransactions? {
        decode(for: resource, with: `extension`)
    }
}

extension DataSourceService: DataSourceDecodableRatesProtocol {
    func decodeRates(for resource: String, with extension: String) -> Rates? {
        decode(for: resource, with: `extension`)
    }
}

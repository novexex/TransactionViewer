
import Foundation

extension ProductsView {
    final class ViewModel: ObservableObject {
        // MARK: Public properties
        let listTitle = Constant.ProductsConstant.title

        @Published var transactions: Transactions?
        
        var groupedTransactions: TransactionGroups {
            let grouped = Dictionary(grouping: transactions ?? [], by: { $0.sku })
            return grouped.map { (sku, transactions) in
                TransactionGroup(sku: sku, transactions: transactions)
            }
            .sorted(by: { $0.sku < $1.sku })
        }
        
        // MARK: Private properties
        private let decoderService: DataSourceDecodableTransactionsProtocol
        private let mappableService: DataSourceMappableProtocol
        
        // MARK: Public methods
        init(
            decoderService: DataSourceDecodableTransactionsProtocol = DataSourceService(),
            mappableService: DataSourceMappableProtocol = DataSourceService()
        ) {
            self.decoderService = decoderService
            self.mappableService = mappableService
            
            fetchTransactions()
        }
        
        // MARK: Private methods
        private func fetchTransactions() {
            if let transactions = decoderService.decodeTransactions(for: Constant.FileName.transactions,
                                                             with: Constant.FileExtension.plist) {
                self.transactions = mappableService.convertToIdentifiable(items: transactions)
            }
        }
    }
}

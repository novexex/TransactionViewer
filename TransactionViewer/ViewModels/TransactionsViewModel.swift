
import Foundation

extension TransactionsView {
    final class ViewModel: ObservableObject {
        // MARK: Public properties
        let transactions: Transactions
        
        var totalGBPAmountFormatted: String {
            totalGBPAmount.formattedCurrency
        }
        
        // MARK: Private properties
        private let decoderService: DataSourceDecodableRatesProtocol
        
        private var totalGBPAmount: Double {
            transactions.reduce(0) {
                $0 + convertCurrency(
                    amount: $1.amountValue,
                    from: $1.currency,
                    ratesDictionary: ratesDictionary
                )
            }
        }
        
        private var ratesDictionary: RatesDictionary = [:]
        
        // MARK: Public methods
        init(
            transactions: Transactions,
            decoderService: DataSourceDecodableRatesProtocol = DataSourceService()
        ) {
            self.transactions = transactions
            self.decoderService = decoderService
            
            fetchRates()
        }
        
        func convertToGBP(transaction: TransactionModel) -> Double {
            convertCurrency(amount: transaction.amountValue,
                            from: transaction.currency,
                            to: "GBP",
                            ratesDictionary: ratesDictionary)
        }
        
        // MARK: Private methods
        private func fetchRates() {
            if let rates = decoderService.decodeRates(for: Constant.FileName.rates,
                                                      with: Constant.FileExtension.plist) {
                self.ratesDictionary = convertToDictionary(with: rates)
            }
        }
    }
}

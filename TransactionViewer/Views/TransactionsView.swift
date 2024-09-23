
import SwiftUI

struct TransactionsView: View {
    @StateObject private var vm: ViewModel
    
    init(transactions: Transactions) {
        _vm = .init(wrappedValue: .init(transactions: transactions))
    }
    
    var body: some View {
        list
    }
    
    var list: some View {
        List {
            section
        }
        .listStyle(.plain)
    }
    
    var section: some View {
        Section {
            transactions
        } header: {
            sectionHeader
        }
    }
    
    var transactions: some View {
        ForEach(vm.transactions) { transaction in
            TransactionCell(
                transaction: transaction,
                convertedToGBP: vm.convertToGBP(transaction: transaction)
            )
        }
    }
    
    var sectionHeader: some View {
        Text("Total: £\(vm.totalGBPAmountFormatted)")
    }
}

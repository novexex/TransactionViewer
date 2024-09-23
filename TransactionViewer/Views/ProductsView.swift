
import SwiftUI

struct ProductsView: View {
    @StateObject private var vm = ViewModel()
    
    var body: some View {
        if vm.groupedTransactions.isEmpty {
            emptyTransactions
        } else {
            someTransactions
        }
    }
    
    var emptyTransactions: some View {
        Text("Resource not found")
    }
    
    var someTransactions: some View {
        NavigationView {
            list
                .navigationTitle(vm.listTitle)
                .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    var list: some View {
        List {
            groupedTransactions
        }
    }
    
    var groupedTransactions: some View {
        ForEach(vm.groupedTransactions) { group in
            NavigationLink {
                TransactionsView(transactions: group.transactions)
                    .navigationTitle("Transactions for \(group.sku)")
            } label: {
                ProductCell(groupedTransactions: group)
            }
        }
    }
}

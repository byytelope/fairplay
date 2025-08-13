import SwiftUI

struct AddExpenseView: View {
  @Environment(\.dismiss) var dismiss

  var body: some View {
    NavigationView {
      Text("Add Expense")
        .navigationTitle("Add Expense")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
          ToolbarItem(placement: .topBarTrailing) {
            Button("Close", systemImage: "xmark") {
              dismiss()
            }
          }
        }
    }
    .presentationDetents([.medium])
  }
}

#Preview {
  AddExpenseView()
}

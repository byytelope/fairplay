import SwiftUI

struct CurrencyView: View {
  @Binding var amount: Double

  var body: some View {
    Text(
      amount,
      format: .currency(code: Locale.current.currency?.identifier ?? "USD")
    )
  }
}

#Preview {
  CurrencyView(amount: .constant(250.00))
}

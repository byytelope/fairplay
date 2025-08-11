import Foundation
import SwiftData

@Model
final class Split {
  @Attribute(.unique)
  var id: UUID

  var amount: Decimal
  var user: User

  @Relationship(deleteRule: .cascade)
  var expense: Expense

  init(amount: Decimal, user: User, expense: Expense) {
    self.id = UUID()
    self.amount = amount
    self.user = user
    self.expense = expense
  }
}

import Foundation
import SwiftData

@Model
final class Expense {
  @Attribute(.unique)
  var id: UUID

  var title: String
  var amount: Decimal
  var date: Date
  var notes: String?
  var createdBy: User
  var group: ExpenseGroup

  @Relationship(deleteRule: .cascade)
  var splits = [Split]()

  init(
    title: String,
    amount: Decimal,
    date: Date,
    createdBy: User,
    group: ExpenseGroup,
  ) {
    self.id = UUID()
    self.title = title
    self.amount = amount
    self.date = date
    self.createdBy = createdBy
    self.group = group
  }
}

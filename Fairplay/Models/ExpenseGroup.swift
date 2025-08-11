import Foundation
import SwiftData

@Model
final class ExpenseGroup {
  @Attribute(.unique)
  var id: UUID

  var name: String
  var currencyCode: String
  var members = [User]()

  @Relationship(deleteRule: .cascade)
  var expenses = [Expense]()

  init(name: String, currencyCode: String = "USD") {
    self.id = UUID()
    self.name = name
    self.currencyCode = currencyCode
  }
}

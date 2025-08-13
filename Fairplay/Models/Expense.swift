import Foundation

struct Expense: Codable {
  let id: UUID
  let createdAt: Date
  let createdBy: User
  let title: String
  let amount: Decimal
}

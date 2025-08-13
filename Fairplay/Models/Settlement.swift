import Foundation

struct Settlement: Codable {
  let id: UUID
  let createdAt: Date
  let payer: User
  let receiver: User
  let amount: Decimal
}

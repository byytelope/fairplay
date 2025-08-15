import Foundation

struct Friend: Codable {
  let friendId: UUID
  let name: String
  let avatarUrl: String?
  let netBalance: Decimal
}

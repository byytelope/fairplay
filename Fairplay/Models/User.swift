import Foundation

struct User: Codable {
  let id: UUID
  let createdAt: Date
  let name: String
  let email: String
  let avatarURL: URL?
}

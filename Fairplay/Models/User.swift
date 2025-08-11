import Foundation
import SwiftData

@Model
final class User {
  @Attribute(.unique)
  var id: UUID

  var name: String
  var email: String
  var avatarURL: URL?
  var groups = [ExpenseGroup]()
  var splits = [Split]()

  init(name: String, email: String, avatarURL: URL? = nil) {
    self.id = UUID()
    self.name = name
    self.email = email
    self.avatarURL = avatarURL
  }
}

import SwiftUI

@main
struct FairplayApp: App {
  @State private var authService = AuthService()

  var body: some Scene {
    WindowGroup {
      AppView()
        .environment(authService)
    }
  }
}

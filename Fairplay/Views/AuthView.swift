import SwiftUI

struct AuthView: View {
  @Environment(AuthService.self) var authService

  var body: some View {
    VStack {
      Button {
        Task {
          do {
            try await authService.signInWithGoogle()
          } catch {
            print("sign in failed:", error)
          }
        }
      } label: {
        Label("Sign in with Google", systemImage: "person.badge.shield.checkmark.fill")
      }
    }
    .buttonStyle(.glass)
    .frame(maxWidth: .infinity, maxHeight: .infinity)
  }
}

#Preview {
  AuthView()
    .environment(AuthService())
}

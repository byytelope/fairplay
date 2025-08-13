import SwiftUI

struct ProfileView: View {
  @Environment(\.dismiss) var dismiss
  @Environment(AuthService.self) var authService

  var body: some View {
    NavigationView {
      Form {
        Text("Profile")
      }
      .scrollContentBackground(.hidden)
      .background(Color.background)
      .navigationTitle("Profile")
      .toolbar {
        ToolbarItem {
          Button(
            "Sign Out",
            systemImage: "rectangle.portrait.and.arrow.forward"
          ) {
            Task {
              do {
                try await authService.signOut()
              } catch {
                print("sign out failed:", error)
              }
            }
          }
        }

        ToolbarItem {
          Button("Close", systemImage: "xmark") {
            dismiss()
          }
        }
      }
    }
  }
}

#Preview {
  ProfileView()
    .environment(AuthService())
}

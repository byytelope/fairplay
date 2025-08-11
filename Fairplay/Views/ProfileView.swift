import SwiftUI

struct ProfileView: View {
  @Environment(\.dismiss) var dismiss
  @State private var friendsIsPresented = false

  var body: some View {
    NavigationStack {
      VStack {
        Text("Profile")
          .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
              Button("Close", systemImage: "xmark") {
                dismiss()
              }
            }
            ToolbarItem(placement: .topBarLeading) {
              Button("Add Friend", systemImage: "person.badge.plus") {
              }
            }
          }
          .navigationDestination(isPresented: $friendsIsPresented) {
            AddFriendView()
          }
      }
    }
  }
}

#Preview {
  ProfileView()
}

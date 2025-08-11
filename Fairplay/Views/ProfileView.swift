import SwiftUI

struct ProfileView: View {
  @Environment(\.dismiss) var dismiss
  @State private var friendsIsPresented = false

  var body: some View {
    NavigationStack {
      VStack {
        Text("Profile")
          .toolbar {
            ToolbarItem {
              Button("Add Friend", systemImage: "person.badge.plus") {
                friendsIsPresented.toggle()
              }
            }

            ToolbarItem {
              Button("Close", systemImage: "xmark") {
                dismiss()
              }
            }
          }
      }
      .navigationTitle("Profile")
      .sheet(isPresented: $friendsIsPresented) {
        AddFriendView()
      }
    }
  }
}

#Preview {
  ProfileView()
}

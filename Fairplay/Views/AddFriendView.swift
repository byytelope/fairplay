import SwiftUI

struct AddFriendView: View {
  @Environment(\.dismiss) var dismiss

  var body: some View {
    NavigationView {
      Text("Add Friend")
        .navigationTitle("Add Friend")
        .toolbar {
          ToolbarItem(placement: .topBarTrailing) {
            Button("Close", systemImage: "xmark") {
              dismiss()
            }
          }
        }
    }
  }
}

#Preview {
  AddFriendView()
}

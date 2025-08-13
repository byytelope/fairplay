import SwiftUI

struct AddFriendView: View {
  @Environment(\.dismiss) var dismiss
  @FocusState private var focusedField: FocusedField?
  @State private var email = ""
  @State private var nickname = ""

  enum FocusedField {
    case email, nickname
  }

  var body: some View {
    NavigationView {
      Form {
        HStack {
          Text("Email")
          Spacer()
          TextField(
            "Friend's Email",
            text: $email,
            prompt: Text(verbatim: "friend@email.com")
          )
          .focused($focusedField, equals: .email)
          .keyboardType(.emailAddress)
          .textInputAutocapitalization(.never)
          .multilineTextAlignment(.trailing)
        }

        HStack {
          Text("Nickname")
          Spacer()
          TextField(
            "Optional Nickname",
            text: $nickname,
            prompt: Text("Dababy")
          )
          .focused($focusedField, equals: .nickname)
          .keyboardType(.emailAddress)
          .textInputAutocapitalization(.never)
          .multilineTextAlignment(.trailing)
        }
      }
      .scrollContentBackground(.hidden)
      .background(Color.background)
      .onAppear { focusedField = .email }
      .navigationTitle("Add Friend")
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        ToolbarItem(placement: .topBarLeading) {
          Button("Close", systemImage: "xmark") {
            dismiss()
          }
        }

        ToolbarItem(placement: .topBarTrailing) {
          Button("Add", systemImage: "checkmark") {
            dismiss()
          }
          .buttonStyle(.glassProminent)
        }
      }
    }
  }
}

#Preview {
  AddFriendView()
}

import SwiftData
import SwiftUI

struct ContentView: View {
  @Environment(\.modelContext) private var modelContext
  @Query(animation: .default) private var users: [User]

  @State private var searchQuery = ""
  @State private var showingSheet = false

  var body: some View {
    NavigationStack {
      HomeListView()
        .background(Color.background)
        .toolbar {
          ToolbarItem(placement: .topBarTrailing) {
            Button(action: { showingSheet.toggle() }) {
              Label("Profile", systemImage: "person")
            }
            .sheet(isPresented: $showingSheet) {
              ProfileView()
            }
          }
        }
        .toolbar {
          ToolbarItem(placement: .bottomBar) {
            Button(action: {}) {
              Label("Filter", systemImage: "line.3.horizontal.decrease")
            }
          }
          ToolbarSpacer(.flexible, placement: .bottomBar)
          DefaultToolbarItem(kind: .search, placement: .bottomBar)
          ToolbarSpacer(.flexible, placement: .bottomBar)
          ToolbarItem(placement: .bottomBar) {
            Button(action: addItem) {
              Label("Add Item", systemImage: "plus")
            }
            .buttonStyle(.glassProminent)
          }
        }
        .searchable(text: $searchQuery)
    }
  }

  private func addItem() {
    let newItem = User(name: "Hello", email: "hello@gmail.com")
    modelContext.insert(newItem)
  }

  private func deleteItems(offsets: IndexSet) {
    for index in offsets {
      modelContext.delete(users[index])
    }
  }
}

#Preview {
  ContentView()
    .modelContainer(for: User.self, inMemory: true)
    .fontDesign(.rounded)
}

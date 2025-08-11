import SwiftData
import SwiftUI

struct HomeListView: View {
  @Environment(\.modelContext) private var modelContext
  @Query private var users: [User]

  @State private var activeListExpanded = true
  @State private var hiddenListExpanded = true

  var body: some View {
    List {
      VStack {
        Text("$250.00")
          .font(.largeTitle)
          .fontWeight(.semibold)

      }
      .listRowBackground(Color.clear)

      Section("Active", isExpanded: $activeListExpanded) {
        ForEach(users) { item in
          NavigationLink {
            Text(item.name)
          } label: {
            Text(item.name)
          }
        }
        .onDelete(perform: deleteItems)
      }

      Section("Settled", isExpanded: $hiddenListExpanded) {

      }
    }
    .headerProminence(.increased)
    .listStyle(.sidebar)
    .scrollContentBackground(.hidden)
  }

  private func deleteItems(offsets: IndexSet) {
    withAnimation {
      for index in offsets {
        modelContext.delete(users[index])
      }
    }
  }
}

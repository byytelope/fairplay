import SwiftData
import SwiftUI

struct HomeView: View {
  @Environment(\.modelContext) private var modelContext
  @Query(animation: .default) private var users: [User]

  @State private var searchQuery = ""
  @State private var amount = 250.00
  @State private var owing = false
  @State private var showingSheet = false
  @State private var activeListExpanded = true
  @State private var hiddenListExpanded = true

  var body: some View {
    NavigationStack {
      List {
        Section("Active", isExpanded: $activeListExpanded) {
          ForEach(users) { item in
            NavigationLink {
              Text(item.name)
                .navigationTitle(item.name)
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
      .background(Color.background)
      .navigationTitle("Home")
      .toolbar {
        ToolbarItem(placement: .largeTitle) {
          CurrencyView(amount: $amount)
            .scenePadding()
            .font(.system(size: 40))
            .fontWeight(.bold)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        ToolbarItem(placement: .subtitle) {
          CurrencyView(amount: $amount)
            .font(.footnote)
        }
      }
      .toolbar {
        ToolbarItem(placement: .topBarTrailing) {
          Button(action: { showingSheet.toggle() }) {
            Label("Profile", systemImage: "person")
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
          Menu("Add", systemImage: "plus") {
            Button("Add Item") {
              addItem()
            }

            Button("Add 10 Items") {
              for _ in 0..<10 {
                addItem()
              }
            }
          }
        }
      }
      .searchable(text: $searchQuery)
      .sheet(isPresented: $showingSheet) {
        ProfileView()
      }
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
  HomeView()
    .modelContainer(for: User.self, inMemory: true)
    .fontDesign(.rounded)
}

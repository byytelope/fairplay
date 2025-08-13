import SwiftData
import SwiftUI

struct HomeView: View {
  @State private var searchQuery = ""
  @State private var amount = 250.00
  @State private var owing = false
  @State private var presentProfile = false
  @State private var presentAddFriend = false
  @State private var presentAddExpense = false
  @State private var activeListExpanded = true
  @State private var hiddenListExpanded = true

  var body: some View {
    NavigationStack {
      List {
        Section("Active", isExpanded: $activeListExpanded) {
          //          ForEach(users) { item in
          //            NavigationLink {
          //              Text(item.name)
          //                .navigationTitle(item.name)
          //            } label: {
          //              Text(item.name)
          //            }
          //          }
          //          .onDelete(perform: deleteItems)
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
          Button(action: { presentProfile.toggle() }) {
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
            Button("Add Expense", systemImage: "dollarsign") {
              presentAddExpense.toggle()
            }

            Button("Add Friend", systemImage: "person.badge.plus") {
              presentAddFriend.toggle()
            }
          }
        }
      }
      .fontDesign(.rounded)
      .searchable(text: $searchQuery)
      .sheet(isPresented: $presentProfile) {
        ProfileView()
      }
      .sheet(isPresented: $presentAddExpense) {
        AddExpenseView()
      }
      .sheet(isPresented: $presentAddFriend) {
        AddFriendView()
      }
    }
  }
}

#Preview {
  HomeView()
    .environment(AuthService())
}

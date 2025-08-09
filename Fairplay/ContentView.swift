//
//  ContentView.swift
//  Fairplay
//
//  Created by Mohamed Shadhaan on 07/08/2025.
//

import SwiftData
import SwiftUI

struct ContentView: View {
  @Environment(\.modelContext) private var modelContext
  @Query(animation: .default) private var items: [Item]

  @State private var searchQuery = ""

  var body: some View {
    NavigationStack {
      HomeList()
        .toolbar {
          ToolbarItem(placement: .topBarTrailing) {
            Button(action: addItem) {
              Label("Profile", systemImage: "person")
            }
          }
        }
        .toolbar {
          DefaultToolbarItem(kind: .search, placement: .bottomBar)
          ToolbarSpacer(.flexible, placement: .bottomBar)
          ToolbarItem(placement: .bottomBar) {
            Button(action: addItem) {
              Label("Filter", systemImage: "line.3.horizontal.decrease")
            }
          }
          ToolbarItem(placement: .bottomBar) {
            Button(action: addItem) {
              Label("Add Item", systemImage: "plus")
            }
            .buttonStyle(.glassProminent)
          }
        }
        .searchable(text: $searchQuery)
      //        .searchToolbarBehavior(.minimize)
    }
  }

  private func addItem() {
    let newItem = Item(timestamp: .now)
    modelContext.insert(newItem)
  }

  private func deleteItems(offsets: IndexSet) {
    for index in offsets {
      modelContext.delete(items[index])
    }
  }
}

#Preview {
  ContentView()
    .modelContainer(for: Item.self, inMemory: true)
    .fontDesign(.rounded)
}

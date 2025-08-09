//
//  HomeList.swift
//  Fairplay
//
//  Created by Mohamed Shadhaan on 08/08/2025.
//

import SwiftData
import SwiftUI

struct HomeList: View {
  @Environment(\.modelContext) private var modelContext
  @Query private var items: [Item]

  @State private var activeListExpanded = true
  @State private var hiddenListExpanded = true

  var body: some View {
    List {
      Section("Active", isExpanded: $activeListExpanded) {
        ForEach(items) { item in
          NavigationLink {
            Text(
              "Item at \(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))"
            )
          } label: {
            Text(
              item.timestamp,
              format: Date.FormatStyle(date: .numeric, time: .standard)
            )
          }
        }
        .onDelete(perform: deleteItems)
      }

      Section("Hidden", isExpanded: $hiddenListExpanded) {

      }
    }
    .headerProminence(.increased)
    .listStyle(.sidebar)
  }

  private func deleteItems(offsets: IndexSet) {
    withAnimation {
      for index in offsets {
        modelContext.delete(items[index])
      }
    }
  }
}

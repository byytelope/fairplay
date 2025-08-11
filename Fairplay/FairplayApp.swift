import SwiftData
import SwiftUI

@main
struct FairplayApp: App {
  var sharedModelContainer: ModelContainer = {
    let schema = Schema([
      Expense.self,
      ExpenseGroup.self,
      User.self,
      Split.self,
    ])
    let modelConfiguration = ModelConfiguration(
      schema: schema,
      isStoredInMemoryOnly: false
    )

    do {
      return try ModelContainer(
        for: schema,
        configurations: [modelConfiguration]
      )
    } catch {
      fatalError("Could not create ModelContainer: \(error)")
    }
  }()

  var body: some Scene {
    WindowGroup {
      ContentView()
        .fontDesign(.rounded)
    }
    .modelContainer(sharedModelContainer)
  }
}

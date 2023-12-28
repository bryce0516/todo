//
//  ContentView.swift
//  Todo App
//
//  Created by 박혜성(Hyesung Park) on 12/14/23.
//

import SwiftUI
import CoreData

struct ContentView: View {
  @Environment(\.managedObjectContext) private var viewContext

  @FetchRequest(
    sortDescriptors: [NSSortDescriptor(keyPath: \Todo.id, ascending: true)],
      animation: .default)
  private var todos: FetchedResults<Todo>

    @State private var showingAddTodoView: Bool = false
  
    var body: some View {
        NavigationView {
          List(0 ..< 5) { item in
            Text("Hello world!")
//                ForEach(items) { item in
//                    NavigationLink {
//                        Text("Item at \(item.timestamp!, formatter: itemFormatter)")
//                    } label: {
//                        Text(item.timestamp!, formatter: itemFormatter)
//                    }
//                }
            } // END: list
          .navigationTitle("Todo")
          .navigationBarTitleDisplayMode(.inline)
          .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
              Button(action: {
                self.showingAddTodoView.toggle()
              }) {
                Image(systemName: "plus")
              }
              .sheet(isPresented: $showingAddTodoView, content: {
                AddTodoView().environment(\.managedObjectContext, self.viewContext)
              })
            }
          }
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

#Preview {
    ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}

//
//  AddTodo.swift
//  Todo App
//
//  Created by 박혜성(Hyesung Park) on 12/14/23.
//

import SwiftUI

struct AddTodoView: View {
  // MARK: - PROPERTIES
  @Environment(\.managedObjectContext) var viewContext
  @Environment(\.presentationMode) var presetationMode
  
  @State private var name : String = ""
  @State private var priority: String = "Normal"
  
  let priorities = ["High", "Normal", "Low"]
  
  @State private var errorShowing: Bool = false
  @State private var errorTitle: String = ""
  @State private var errorMessage: String = ""
  
  
  // MARK: - BODY
  var body: some View {
    NavigationView {
      VStack {
        Form {
          // MARK: - Todo Name
          TextField("Todo", text:$name)
          Picker("Priority", selection: $priority) {
            ForEach(priorities, id: \.self) {
              Text($0)
            }
          }
          .pickerStyle(.segmented)
          
          // MARK: - Save Button
          Button(action: {
            if self.name != "" {
              let todo = Todo(context: self.viewContext)
              todo.name = self.name
              todo.priority = self.priority
              do {
                print("working", todo)
                try self.viewContext.save()
              } catch {
                print(error)
              }
            } else {
              self.errorShowing = true
              self.errorTitle = "Invalid Name"
              self.errorMessage = "Make sure to enter something for\nthe new todo item."
              return
            }
            self.presetationMode.wrappedValue.dismiss()
          }, label: {
            Text("Save")
          })
          
          
        }

      } // END: VSTACK
      .navigationTitle("New Todo")
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        ToolbarItem(placement: .topBarTrailing) {
          Button(action: {
            self.presetationMode.wrappedValue.dismiss()
          }, label: {
            Image(systemName: "xmark")
          })
        }
      }
      .alert(isPresented: $errorShowing, content: {
        Alert(title: Text(errorTitle), message: Text(errorMessage), dismissButton: .default(Text("OK")))
      })
    } // END: NAVIGATION VIEW
  }
}

#Preview {
  AddTodoView()
}

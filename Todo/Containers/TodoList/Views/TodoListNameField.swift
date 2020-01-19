import SwiftUI

struct TodoListNameField : View {
  @Binding var name: String
  
  var body: some View {
    TextField("Untitled todo list", text: $name)
    .font(.title)
    .padding()
  }
}
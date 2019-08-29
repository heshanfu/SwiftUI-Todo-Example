import SwiftUI
import SwiftDux
import Combine

struct TodoListDetailsRowContainer : View {
  
  @MappedState private var todo: Todo
  @MappedDispatch() private var dispatch
  
  private var text: Binding<String> {
    Binding<String>(
      get: { self.todo.text },
      set: { self.dispatch(TodosAction.setText(forId: self.todo.id, text: $0)) }
    )
  }
  
  private var completed: Binding<Bool> {
    Binding<Bool>(
      get: { self.todo.completed },
      set: { self.dispatch(TodosAction.setCompleted(forId: self.todo.id, completed: $0)) }
    )
  }
  
  var body: some View {
    TodoListDetailsRow(completed: completed, text: text)
  }
  
}

extension TodoListDetailsRowContainer : ParameterizedConnectable {
  
  func map(state: TodoList, with parameter: String) -> Todo? {
    state.todos[parameter]
  }
  
}

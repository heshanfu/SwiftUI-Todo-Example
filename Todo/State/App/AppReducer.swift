import Foundation
import SwiftDux

final class AppReducer : Reducer {
  
  let mainSceneReducer = MainSceneReducer()
  let todoListsReducer = TodoListsReducer()
  let todosReducer = TodosReducer()
  
  func reduce(state: AppState, action: AppAction) -> AppState {
    var state = state
    switch action {
    case .selectTodoList(let id):
      state.selectedTodoListId = id
    }
    return state
  }
  
  func reduceNext(state: AppState, action: Action) -> AppState {
    return AppState(
      schemaVersion: state.schemaVersion,
      mainScene: mainSceneReducer.reduceAny(state: state.mainScene, action: action),
      todoLists: todoListsReducer.reduceAny(state: state.todoLists, action: action),
      todos: todosReducer.reduceAny(state: state.todos, action: action),
      selectedTodoListId: state.selectedTodoListId
    )
  }
  
}

import Foundation
import SwiftDux

final class MainSceneReducer: Reducer {
  
  func reduce(state: MainScene, action: MainSceneAction) -> MainScene {
    var state = state
    switch action {
    case .setDisplayMode(let mode):
      state.displayMode = mode
    }
    return state
  }
  
}

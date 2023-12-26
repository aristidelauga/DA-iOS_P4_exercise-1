import SwiftUI

final class ToDoListViewModel: ObservableObject {
  // MARK: - Private properties
  
  private let repository: ToDoListRepositoryType
  
  // MARK: - Init
  
  init(repository: ToDoListRepositoryType) {
    self.repository = repository
    self.toDoItems = repository.loadToDoItems()
  }
  
  // MARK: - Outputs
//  @Published var filterIndex = 0
  /// Publisher for the list of to-do items.
  @Published var toDoItems: [ToDoItem] = [] {
    didSet {
      repository.saveToDoItems(toDoItems)
    }
  }
  @Published var filterState: FilterState = .all
  
  var filteredItems: [ToDoItem] {
    return applyFilter(filterState: filterState)
  }
  
  // MARK: - Inputs
  
  // Add a new to-do item with priority and category
  func add(item: ToDoItem) {
    toDoItems.append(item)
  }
  
  /// Toggles the completion status of a to-do item.
  func toggleTodoItemCompletion(_ item: ToDoItem) {
    if let index = toDoItems.firstIndex(where: { $0.id == item.id }) {
      toDoItems[index].isDone.toggle()
    }
  }
  
  /// Removes a to-do item from the list.
  func removeTodoItem(_ item: ToDoItem) {
    toDoItems.removeAll { $0.id == item.id }
  }
  
  /// Apply the filter to update the list.
  func applyFilter(filterState: FilterState) -> [ToDoItem] {
    // TODO: - Implement the logic for filtering
    switch filterState {
      case .all:
        return toDoItems
      case .done:
        return toDoItems.filter { $0.isDone }
      case .undone:
        return toDoItems.filter { !$0.isDone }
    }
  }
}

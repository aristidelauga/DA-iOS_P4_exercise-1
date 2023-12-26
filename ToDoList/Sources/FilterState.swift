//
//  FilterState.swift
//  ToDoList
//
//  Created by Aristide LAUGA on 26/12/2023.
//

import Foundation

enum FilterState: Int, CaseIterable {
  case all = 0
  case done = 1
  case undone = 2
  
  var text: String {
    switch self {
      case .all:
        return "All"
      case .done:
        return "Done"
      case .undone:
        return "Undone"
    }
  }
}

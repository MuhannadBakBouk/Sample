//
//  UISection.swift
//  NewsApp
//
//  Created by Mohannad on 3/6/22.
//

import Foundation
import RxDataSources

enum SectionViewData {
    case OverViewSec(items: [SectionItem])
    case InstructorSec(items: [SectionItem])
    case StatisticsSec(items: [SectionItem])
    case ClassesSec(items: [SectionItem])
}


enum SectionItem {
  case OverView
  case Instructor
  case Statistics
  case Classes
    
}

extension SectionViewData : SectionModelType {
  typealias Item = SectionItem

  var items: [SectionItem] {
      switch self {
      case .OverViewSec(items: let items):
          return items.map { $0 }
      case .InstructorSec(items: let items):
          return items.map { $0 }
      case .StatisticsSec(items: let items):
        return items.map { $0 }
      case .ClassesSec(items: let items):
        return items.map { $0 }
      }
  }

  init(original: SectionViewData, items: [Item]) {
      switch  original {
      case .OverViewSec(let items):
          self = .OverViewSec(items: items)
      case .InstructorSec(let items):
          self = .InstructorSec(items: items)
      case .StatisticsSec(let items):
        self = .StatisticsSec(items: items)
      case .ClassesSec(let items):
        self = .ClassesSec(items: items)
      }
  }
}




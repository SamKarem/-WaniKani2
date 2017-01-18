//
//  LeftRightTitleViewModel.swift
//  WaniKani
//
//  Created by Andriy K. on 3/22/16.
//  Copyright © 2016 Andriy K. All rights reserved.
//

import Foundation

struct LeftRightTitleViewModel: LeftRightTitleDatasource {
  fileprivate let leftTitleString: String
  fileprivate let rightTitleString: String
  
  init(left: String, right: String) {
    leftTitleString = left
    rightTitleString = right
  }
}

// MARK: - LeftRightTitleDatasource
extension LeftRightTitleViewModel {
  var leftTitle: String {
    return leftTitleString
  }
  
  var rightTitle: String {
    return rightTitleString
  }
}

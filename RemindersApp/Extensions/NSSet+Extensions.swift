//
//  NSSet+Extensions.swift
//  RemindersApp
//
//  Created by Mohammad Azam on 1/28/23.
//

import Foundation

extension NSSet {
  func toArray<T>() -> [T] {
    let array = self.map({ $0 as! T})
    return array
  }
}

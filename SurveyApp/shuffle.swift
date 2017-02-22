//
//  shuffle.swift
//  SurveyApp
//
//  Created by Mac on 15/12/16.
//  Copyright © 2016 Realizer Tech. All rights reserved.
//

import Foundation
import UIKit

extension Array {
    var shuffle: [Element] {
        var elements = self
        for index in indices.dropLast() {
            guard
                case let swapIndex = Int(arc4random_uniform(UInt32(count - index))) + index
                where swapIndex != index else {continue}
            swap(&elements[index], &elements[swapIndex])
            
        }
        return elements
    }
    mutating func shuffled() {
        for index in indices.dropLast() {
            guard
                case let swapIndex = Int(arc4random_uniform(UInt32(count - index))) + index
                where swapIndex != index
                else { continue }
            swap(&self[index], &self[swapIndex])
        }
    }
    var chooseOne: Element {
        return self[Int(arc4random_uniform(UInt32(count)))]
    }
    func choose(n: Int) -> [Element] {
        return Array(shuffle.prefix(n))
}
}
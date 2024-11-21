//
//  CounterViewDelegate.swift
//  TWOSOMEHEART-iOS
//
//  Created by RAFA on 11/20/24.
//

import Foundation

protocol PriceUpdateDelegate: AnyObject {
    func priceDidChange(section: Int, itemIndex: Int, count: Int)
}

protocol ResetCounterDelegate: AnyObject {
    func resetCounters()
}

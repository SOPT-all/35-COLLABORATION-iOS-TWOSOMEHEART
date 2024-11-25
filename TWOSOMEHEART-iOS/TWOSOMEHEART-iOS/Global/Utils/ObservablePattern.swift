//
//  ObservablePattern.swift
//  TWOSOMEHEART-iOS
//
//  Created by 이수민 on 11/25/24.
//

import Foundation

final class ObservablePattern<T> {
    
    var value: T? {
        didSet {
            self.listener?(value)
        }
    }
    
    init(_ value: T?) {
        self.value = value
    }
    
    private var listener: ((T?) -> Void)?
    
    func bind(_ listener: @escaping (T?) -> Void) {
        listener(value)
        self.listener = listener
    }
    
}

//
//  DidSetPublished.swift
//  TheD&D
//
//  Created by RYAN GREENBURG on 2/11/24.
//

import Combine
import Foundation

extension Published.Publisher {
    var didSet: AnyPublisher<Value, Never> {
        self.receive(on: RunLoop.main).eraseToAnyPublisher()
    }
}

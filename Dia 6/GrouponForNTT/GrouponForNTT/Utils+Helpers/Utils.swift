//
//  Utils.swift
//  GrouponForNTT
//
//  Created by Guillermo Rodríguez ALonso on 4/3/24.
//

import Foundation

public protocol ReuseIdentifierView: class {
    static var defaultReuseIdentifierView : String { get }
}

public extension ReuseIdentifierView

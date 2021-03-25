//
//  ExampleFiniteAutomata.swift
//  MyFiniteAutomatas
//
//  Created by Filip Klembara on 17/02/2020.
//

import Foundation

public protocol ExampleStringAutomata {
    static var description: StaticString { get }
}

public protocol ExampleAutomataInputs {
    static var valid: [(String, [String])] { get }
    static var invalid: [String] { get }
}

extension ExampleStringAutomata {
    public static var data: Data {
        return description.description.data(using: .utf8)!
    }
}

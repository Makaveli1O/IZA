//
//  FiniteAutomata.swift
//  FiniteAutomata
//
//  Created by Filip Klembara on 17/02/2020.
//

/// Finite automata
public struct FiniteAutomata {
    public let states:[String]
    public let symbols:[String]
    public let initialState:String
    public let finalStates:[String]
    public let transitions : [Transition]

    enum CodingKeys: String, CodingKey {
        case states
        case symbols
        case initialState
        case finalStates
        case transitions
    }
}
// MARK: Transition structure(nested dict)
public struct Transition:Decodable {
  public let with,to,from:String
 }

extension FiniteAutomata: Decodable {
    
}

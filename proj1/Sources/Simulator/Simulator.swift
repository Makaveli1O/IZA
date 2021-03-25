//
//  Simulator.swift
//  Simulator
//
//  Created by Filip Klembara on 17/02/2020.
//

import FiniteAutomata

/// Simulator
public struct Simulator {
    /// Finite automata used in simulations
    private let finiteAutomata: FiniteAutomata

    /// Initialize simulator with given automata
    /// - Parameter finiteAutomata: finite automata
    public init(finiteAutomata: FiniteAutomata) {
        self.finiteAutomata = finiteAutomata
    }

    /// Simulate automata on given string
    /// - Parameter string: string with symbols separated by ','
    /// - Returns: Empty array if given string is not accepted by automata,
    ///     otherwise array of states
    public func simulate(on string: String) -> [String] {
        var answer : [String] = []
        var finalState:String = ""
        var symbolsArray = string.split(separator: ",")
        //assign and pop(empty element)
        var actualSymbol:String
        if !symbolsArray.isEmpty{
            actualSymbol = String(symbolsArray[0])
            symbolsArray.remove(at: 0)
        }else{//empty string input
            answer.append(finiteAutomata.initialState)
            answer.forEach { line in
                print("\(line)")
            }
            return answer
        }
        
        var actualState = self.finiteAutomata.initialState
        simulateStep(actualState: &actualState, actualSymbol: &actualSymbol, symbolsArray: &symbolsArray,answerArr: &answer,finalState: &finalState, initial: true)
        
        
        if finiteAutomata.finalStates.contains(finalState){
            answer.forEach { line in
                print("\(line)")
            }
            return answer
        }else{
            return []
        }
        
        
    }
    ///Sne step of simulation
    //MARK: - simulateStep(singleStep)
    ///- Parameter actualState: actual state within automata
    ///- Parameter actualySymbol: processing symbol from given string
    ///- Parameter symbolsArray: remaining symbols
    ///- Parameter answerArr: array holding answered states
    ///- Parameter finalState: final state( to check if last state was actually final state
    ///- Parameter initial: bool  representing first call
    ///- Recurisvely called function representing single step of automata
    public func simulateStep(actualState: inout String, actualSymbol:inout String, symbolsArray: inout [Substring], answerArr:inout[String],finalState:inout String, initial: Bool = false)->Void{
        answerArr.append(actualState)
        for transition in finiteAutomata.transitions {
            if transition.from == actualState && transition.with == actualSymbol && transition.to != "Sink" {
                if symbolsArray.isEmpty{
                    answerArr.append(transition.to)
                    finalState = transition.to
                    return
                }
                var newSymbol = String(symbolsArray[0])
                symbolsArray.remove(at: 0)
                var state = transition.to
                simulateStep(actualState: &state, actualSymbol: &newSymbol, symbolsArray: &symbolsArray, answerArr: &answerArr, finalState: &finalState)
            }
        }
        return
    }
}

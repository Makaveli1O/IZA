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
        var finalStates:[String] = []
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
        //check undefined states
        if isStateDefined() != 0 {
            return ["-21"]
        }
        
        //check undefined symbols
        
        if isSymbolDefined() != 0 {
            return ["-22"]
        }
        var actualState = self.finiteAutomata.initialState
        simulateStep(actualState: &actualState, actualSymbol: &actualSymbol, symbolsArray: &symbolsArray,answerArr: &answer,finalStates: &finalStates, initial: true)
        //check final states
        for finalState in finalStates {
            if finiteAutomata.finalStates.contains(finalState){
                answer.forEach { line in
                    print("\(line)")
                }
            return answer
            }
        }
        //answer not found
        return []
    }
    //MARK: -isDefined
    /// - Returns: 0 if OK, -1 otherwise
    func isStateDefined()->Int{
        for state in finiteAutomata.states{
            if finiteAutomata.transitions.filter({$0.from == state}).count == 0 && finiteAutomata.transitions.filter({$0.to == state}).count == 0{
                return -1
            }
        }
        for transition in finiteAutomata.transitions {
            if !finiteAutomata.states.contains(transition.from) || !finiteAutomata.states.contains(transition.to){
                return -1
            }
        }
        return 0 //everything ok
    }
    
    //MARK: -isSymbolDefined
    /// - Returns: 0 if OK, -1 otherwise
    func isSymbolDefined() -> Int {
        for symbol in finiteAutomata.symbols{
            if finiteAutomata.transitions.filter({$0.with == symbol}).count == 0{
                return -1
            }
        }
        for transition in finiteAutomata.transitions {
            if !finiteAutomata.symbols.contains(transition.with){
                return -1
            }
        }
        return 0 //everything ok
    }
    
    //MARK: -isMultiplePath
    /// - Parameter actualState: actual state being processed
    /// - Parameter actualSymbol: actual symbol being processed
    /// - Returns: Returns number of possible paths from current state
    public func isMultiplePath(actualState:String,actualSymbol:String)->Int{
        var count = 0
        for transition in finiteAutomata.transitions{
            if transition.from==actualState && transition.with==actualSymbol {
                    count+=1
            }
        }
        return count
    }
    //MARK: detectSink
    /// - Parameter actualState: actual state being processed
    /// - Parameter actualSymbol: actual symbol being processed
    /// - Returns: array of sink states
    public func detectSink(actualState:String,actualSymbol:String)->[String]{
        var nextStates:[String] = []
        for transition in finiteAutomata.transitions{
            if transition.from==actualState && transition.with==actualSymbol {
                nextStates.append(transition.to)
            }
        }
        //look for next FROM with nextStates
        for transition in finiteAutomata.transitions {
            for state in nextStates{
                if transition.from == state {
                    if let firstIndex = nextStates.firstIndex(of: state){
                        nextStates.remove(at: firstIndex)
                    }
                }
            }
         }
        //check if sink states aren't actually final states <PATCH>
        for finalState in finiteAutomata.finalStates {
            for state in nextStates{
                if finalState == state{
                    if let firstIndex = nextStates.firstIndex(of: state){
                        nextStates.remove(at: firstIndex)
                    }
                }
            }
        }
        return nextStates
    }
    ///Sne step of simulation
    //MARK: - simulateStep(singleStep)
    ///- Parameter actualState: actual state within automata
    ///- Parameter actualySymbol: processing symbol from given string
    ///- Parameter symbolsArray: remaining symbols
    ///- Parameter answerArr: array holding answered states
    ///- Parameter finalStates: final states( to check if last state was actually final state)
    ///- Parameter initial: bool  representing first call
    ///- Recurisvely called function representing single step of automata
    public func simulateStep(actualState: inout String, actualSymbol:inout String, symbolsArray: inout [Substring], answerArr:inout[String],finalStates:inout [String], initial: Bool = false, processedStates:[String] = [])->Void{
        answerArr.append(actualState)
        
        //detect multipath
        let isMultiple = isMultiplePath(actualState: actualState, actualSymbol: actualSymbol) > 1 ? true : false
        // if multiple paths were found, find sink path
        var sinkStates:[String] = []
        if isMultiple {
            sinkStates.append(contentsOf: detectSink(actualState: actualState, actualSymbol:actualSymbol))
        }
        //store next states for each symbol
        var nextStates:[String] = []
        for transition in finiteAutomata.transitions{
            if transition.from == actualState && transition.with == actualSymbol && !sinkStates.contains(transition.to) {
                nextStates.append(transition.to)
            }
        }
        
        for transition in finiteAutomata.transitions {
            if transition.from == actualState && transition.with == actualSymbol && !sinkStates.contains(transition.to) {
                
                //last element
                if symbolsArray.isEmpty{
                    //no sink detected, but still multiple states were found
                    if !nextStates.isEmpty {
                        if finiteAutomata.finalStates.contains(transition.to) {
                            answerArr.append(transition.to)
                            nextStates.remove(at: 0)
                            finalStates.append(transition.to)
                            continue
                        }else{continue}
                    }
                    return
                }
                var newSymbol = String(symbolsArray[0])
                symbolsArray.remove(at: 0)
                var state = transition.to
                simulateStep(actualState: &state, actualSymbol: &newSymbol, symbolsArray: &symbolsArray, answerArr: &answerArr, finalStates: &finalStates)
            }
        }
        return
    }
}

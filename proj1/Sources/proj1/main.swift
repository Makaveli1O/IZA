//
//  main.swift
//  proj1
//
//  Created by Filip Klembara on 17/02/2020.
//

import Foundation
import FiniteAutomata
import Simulator
import MyFiniteAutomatas

// MARK: - Main
func main() -> Result<Void, RunError> {
    if CommandLine.argc != 3 {
        return .failure(.wrongArguments)
    }
    let inputString = CommandLine.arguments[1]
    let fileName = CommandLine.arguments[2]
    
    //file
    let fileManager = FileManager.default

    if !fileManager.fileExists(atPath: fileName) {
        return .failure(.fileError)
    }
    
    if !fileManager.isReadableFile(atPath: fileName){
        return .failure(.fileError)
    }
    
    let fileUrl = URL(fileURLWithPath: fileName)
    
    //reading
    guard let automata = try? String(contentsOf: fileUrl, encoding: .utf8)else{
        return .failure(.fileError)
    }

    do {
        let f = try JSONDecoder().decode(FiniteAutomata.self, from: Data(bytes:automata.utf8))

        let sim = Simulator(finiteAutomata: f)
        let answer = sim.simulate(on: inputString)
        if answer.isEmpty {
            return .failure(.notAccepted)
        }
    } catch {
        return .failure(.automataDecodeError)
    }
    return .success(())
}


// MARK: - program body
let result = main()

switch result {
case .success:
    break
case .failure(let error):
    var stderr = STDERRStream()
    print("Error:", error.description, to: &stderr)
    exit(Int32(error.code))
}

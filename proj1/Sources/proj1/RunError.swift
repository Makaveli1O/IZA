//
//  RunError.swift
//  proj1
//
//  Created by Filip Klembara on 17/02/2020.
//

enum RunError: Error {

    case notImplemented
    case notAccepted
    case wrongArguments
    case fileError
    case automataDecodeError
    case unknownState
    case unknownSymbol
    case otherError
}

// MARK: - Return codes
extension RunError {
    var code: Int {
        switch self {
        case .notImplemented:
            return 66
        case .notAccepted:
            return 6
        case .wrongArguments:
            return 11
        case .fileError:
            return 12
        case .automataDecodeError:
            return 20
        case .unknownState:
            return 21
        case .unknownSymbol:
            return 22
        case .otherError:
            return 99
        }
    }
}

// MARK:- Description of error
extension RunError: CustomStringConvertible {
    var description: String {
        switch self {
        case .notImplemented:
            return "Not implemented."
        case .notAccepted:
            return "String Not accepted by finite automata."
        case .wrongArguments:
            return "Wrong input arguments."
        case .fileError:
            return "File error."
        case .automataDecodeError:
            return "Error decoding automata."
        case .unknownState:
            return "Automata contains undefined state."
        case .unknownSymbol:
            return "Automata contains undefined symbol."
        case .otherError:
            return "Other not specified error."
        }
    }
}

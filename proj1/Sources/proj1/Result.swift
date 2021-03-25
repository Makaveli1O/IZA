//
//  Result.swift
//  proj1
//
//  Created by Filip Klembara on 28/02/2021.
//

#if !swift(>=5.0)
// Implementation of Result for older versions of Swift
enum Result<Success, Failure: Error> {
    case success(Success)
    case failure(Failure)
}
#endif

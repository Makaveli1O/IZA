//
//  STDERRStream.swift
//  proj1
//
//  Created by Filip Klembara on 17/02/2020.
//

import Foundation

/// Stream for stderr
final class STDERRStream: TextOutputStream {
    func write(_ string: String) {
        FileHandle.standardError.write(Data(string.utf8))
    }
}

//
//  FiniteAutomataTests.swift
//  proj1Tests
//
//  Created by Filip Klembara on 17/02/2020.
//

import XCTest
import Simulator
import FiniteAutomata
import MyFiniteAutomatas

class FiniteAutomataTests: XCTestCase {
    func testAstarC2Bstar() throws {
        let fa = AstarC2Bstar.data
        let f = try JSONDecoder().decode(FiniteAutomata.self, from: fa)

        let sim = Simulator(finiteAutomata: f)
        AstarC2Bstar.valid.forEach { input, states in
            let r = sim.simulate(on: input)

            XCTAssertGreaterThan(r.count, 0)
            XCTAssertFalse(r.isEmpty)
            XCTAssertEqual(r, states, "generated array of states '\(r)' for input '\(input)' is not equal to expected '\(states)'")
        }

        AstarC2Bstar.invalid.forEach { input in
            let r = sim.simulate(on: input)

            XCTAssertEqual(r.count, 0)
            XCTAssertTrue(r.isEmpty)
        }
    }

    func testCIdentifierAutomata() throws {
        let fa = CIdentifierAutomata.description.description.data(using: .utf8)!
        let f = try JSONDecoder().decode(FiniteAutomata.self, from: fa)

        let sim = Simulator(finiteAutomata: f)
        CIdentifierAutomata.valid.forEach { input, states in
            let r = sim.simulate(on: input)

            XCTAssertGreaterThan(r.count, 0)
            XCTAssertFalse(r.isEmpty)
            XCTAssertEqual(r, states, "generated array of states '\(r)' for input '\(input)' is not equal to expected '\(states)'")
        }

        CIdentifierAutomata.invalid.forEach { input in
            let r = sim.simulate(on: input)

            XCTAssertEqual(r.count, 0)
            XCTAssertTrue(r.isEmpty)
        }
    }

    static var allTests = [
    ("testAstarC2Bstar", testAstarC2Bstar),
    ("testCIdentifierAutomata", testCIdentifierAutomata),
    ]
}

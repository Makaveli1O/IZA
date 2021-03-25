//
//  Astar_Bstar_Cstar.swift
//  MyFiniteAutomatas
//
//  Created by Filip Klembara on 17/02/2020.
//

public struct Astar_Bstar_Cstar {
    private init() { }
}

extension Astar_Bstar_Cstar: ExampleAutomataInputs {
    public static var valid: [(String, [String])] = [
        ("", ["S"]),
        ("a,a", ["S", "A", "A"]),
        ("c,c,c,c,c,c", ["S", "C", "C", "C", "C", "C", "C"]),
        ("b", ["S", "B"])
    ]

    public static var invalid: [String] = [
        "a,a,c,b,b,b",
        "ca",
        "ac",
        "c,b,b,b,b,b,b,b,b,b,b,b,b,b,b,b,b,b,b,b",
    ]
}

extension Astar_Bstar_Cstar: ExampleStringAutomata {

    public static var description: StaticString = """
{
  "states" : [
    "C",
    "A",
    "B",
    "B2",
    "B3",
    "S"
  ],
  "symbols" : [
    "c",
    "a",
    "b"
  ],
  "transitions" : [
    {
      "with" : "c",
      "to" : "C",
      "from" : "C"
    },
    {
      "with" : "b",
      "to" : "B",
      "from" : "B"
    },
    {
      "with" : "b",
      "to" : "B2",
      "from" : "B"
    },
    {
      "with" : "c",
      "to" : "B3",
      "from" : "B2"
    },
    {
      "with" : "a",
      "to" : "B3",
      "from" : "B2"
    },
    {
      "with" : "b",
      "to" : "B3",
      "from" : "B2"
    },
    {
      "with" : "a",
      "to" : "A",
      "from" : "A"
    },
    {
      "with" : "a",
      "to" : "A",
      "from" : "S"
    },
    {
      "with" : "b",
      "to" : "B",
      "from" : "S"
    },
    {
      "with" : "c",
      "to" : "C",
      "from" : "S"
    }
  ],
  "initialState" : "S",
  "finalStates" : [
    "B",
    "A",
    "C",
    "S"
  ]
}
"""
}

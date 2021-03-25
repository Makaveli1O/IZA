//
//  AstarC2Bstar.swift
//  MyFiniteAutomatas
//
//  Created by Filip Klembara on 17/02/2020.
//

public struct AstarC2Bstar {
    private init() { }
}

extension AstarC2Bstar: ExampleAutomataInputs {
    public static var valid: [(String, [String])] = [
        ("a,a,c,c,b,b,b", ["A", "A", "A", "C", "B", "B", "B", "B"]),
        ("c,c", ["A", "C", "B"]),
        ("c,c,b,b,b,b,b,b,b,b,b,b,b,b,b,b,b,b,b,b,b", ["A", "C", "B", "B", "B", "B", "B", "B", "B", "B", "B", "B", "B", "B", "B", "B", "B", "B", "B", "B", "B", "B"])
    ]

    public static var invalid: [String] = [
        "a,a,c,b,b,b",
        "c",
        "a,c"
    ]
}

extension AstarC2Bstar: ExampleStringAutomata {

    public static var description: StaticString = """
{
  "states" : [
    "C",
    "A",
    "B",
    "Sink",
  ],
  "symbols" : [
    "c",
    "a",
    "b"
  ],
  "transitions" : [
    {
      "with" : "c",
      "to" : "B",
      "from" : "C"
    },
    {
      "with" : "c",
      "to" : "Sink",
      "from" : "C"
    },
    {
      "with" : "b",
      "to" : "B",
      "from" : "B"
    },
    {
      "with" : "b",
      "to" : "Sink",
      "from" : "B"
    },
    {
      "with" : "c",
      "to" : "C",
      "from" : "A"
    },
    {
      "with" : "c",
      "to" : "Sink",
      "from" : "A"
    },
    {
      "with" : "a",
      "to" : "A",
      "from" : "A"
    },
    {
      "with" : "a",
      "to" : "Sink",
      "from" : "A"
    }
  ],
  "initialState" : "A",
  "finalStates" : [
    "B"
  ]
}
"""
}

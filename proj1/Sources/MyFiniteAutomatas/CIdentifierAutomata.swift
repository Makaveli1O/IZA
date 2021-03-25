//
//  CIdentifierAutomata.swift
//  MyFiniteAutomatas
//
//  Created by Filip Klembara on 17/02/2020.
//

public struct CIdentifierAutomata {
    private init() { }
}

extension CIdentifierAutomata: ExampleAutomataInputs {
    public static var valid: [(String, [String])] = [
        ("a", ["First symbol", "Final"]),
        ("a,A,b,2", ["First symbol", "Final", "Final", "Final", "Final"]),
    ]

    public static var invalid: [String] = [
        "4,a",
        "1,2,1,4",
        "$,v,a,r",
        "1,_,r"
    ]
}

extension CIdentifierAutomata: ExampleStringAutomata {
    public static var description: StaticString = """
{
  "states" : [
    "Final",
    "First symbol"
  ],
  "symbols" : [
    "t",
    "N",
    "k",
    "u",
    "d",
    "D",
    "e",
    "n",
    "a",
    "b",
    "B",
    "L",
    "j",
    "Q",
    "U",
    "9",
    "E",
    "w",
    "q",
    "3",
    "8",
    "P",
    "4",
    "S",
    "m",
    "r",
    "Y",
    "o",
    "X",
    "0",
    "7",
    "v",
    "H",
    "G",
    "y",
    "R",
    "W",
    "F",
    "z",
    "T",
    "6",
    "A",
    "J",
    "i",
    "_",
    "s",
    "I",
    "2",
    "l",
    "p",
    "x",
    "K",
    "C",
    "V",
    "O",
    "Z",
    "1",
    "g",
    "h",
    "f",
    "M",
    "5",
    "c"
  ],
  "transitions" : [
    {
      "with" : "s",
      "to" : "Final",
      "from" : "First symbol"
    },
    {
      "with" : "B",
      "to" : "Final",
      "from" : "First symbol"
    },
    {
      "with" : "p",
      "to" : "Final",
      "from" : "First symbol"
    },
    {
      "with" : "G",
      "to" : "Final",
      "from" : "First symbol"
    },
    {
      "with" : "Z",
      "to" : "Final",
      "from" : "First symbol"
    },
    {
      "with" : "v",
      "to" : "Final",
      "from" : "First symbol"
    },
    {
      "with" : "Q",
      "to" : "Final",
      "from" : "First symbol"
    },
    {
      "with" : "M",
      "to" : "Final",
      "from" : "First symbol"
    },
    {
      "with" : "h",
      "to" : "Final",
      "from" : "First symbol"
    },
    {
      "with" : "j",
      "to" : "Final",
      "from" : "First symbol"
    },
    {
      "with" : "n",
      "to" : "Final",
      "from" : "First symbol"
    },
    {
      "with" : "U",
      "to" : "Final",
      "from" : "First symbol"
    },
    {
      "with" : "f",
      "to" : "Final",
      "from" : "First symbol"
    },
    {
      "with" : "y",
      "to" : "Final",
      "from" : "First symbol"
    },
    {
      "with" : "d",
      "to" : "Final",
      "from" : "First symbol"
    },
    {
      "with" : "O",
      "to" : "Final",
      "from" : "First symbol"
    },
    {
      "with" : "S",
      "to" : "Final",
      "from" : "First symbol"
    },
    {
      "with" : "D",
      "to" : "Final",
      "from" : "First symbol"
    },
    {
      "with" : "H",
      "to" : "Final",
      "from" : "First symbol"
    },
    {
      "with" : "t",
      "to" : "Final",
      "from" : "First symbol"
    },
    {
      "with" : "q",
      "to" : "Final",
      "from" : "First symbol"
    },
    {
      "with" : "w",
      "to" : "Final",
      "from" : "First symbol"
    },
    {
      "with" : "W",
      "to" : "Final",
      "from" : "First symbol"
    },
    {
      "with" : "g",
      "to" : "Final",
      "from" : "First symbol"
    },
    {
      "with" : "A",
      "to" : "Final",
      "from" : "First symbol"
    },
    {
      "with" : "m",
      "to" : "Final",
      "from" : "First symbol"
    },
    {
      "with" : "N",
      "to" : "Final",
      "from" : "First symbol"
    },
    {
      "with" : "r",
      "to" : "Final",
      "from" : "First symbol"
    },
    {
      "with" : "z",
      "to" : "Final",
      "from" : "First symbol"
    },
    {
      "with" : "K",
      "to" : "Final",
      "from" : "First symbol"
    },
    {
      "with" : "o",
      "to" : "Final",
      "from" : "First symbol"
    },
    {
      "with" : "P",
      "to" : "Final",
      "from" : "First symbol"
    },
    {
      "with" : "J",
      "to" : "Final",
      "from" : "First symbol"
    },
    {
      "with" : "R",
      "to" : "Final",
      "from" : "First symbol"
    },
    {
      "with" : "_",
      "to" : "Final",
      "from" : "First symbol"
    },
    {
      "with" : "k",
      "to" : "Final",
      "from" : "First symbol"
    },
    {
      "with" : "F",
      "to" : "Final",
      "from" : "First symbol"
    },
    {
      "with" : "I",
      "to" : "Final",
      "from" : "First symbol"
    },
    {
      "with" : "C",
      "to" : "Final",
      "from" : "First symbol"
    },
    {
      "with" : "X",
      "to" : "Final",
      "from" : "First symbol"
    },
    {
      "with" : "i",
      "to" : "Final",
      "from" : "First symbol"
    },
    {
      "with" : "b",
      "to" : "Final",
      "from" : "First symbol"
    },
    {
      "with" : "e",
      "to" : "Final",
      "from" : "First symbol"
    },
    {
      "with" : "V",
      "to" : "Final",
      "from" : "First symbol"
    },
    {
      "with" : "L",
      "to" : "Final",
      "from" : "First symbol"
    },
    {
      "with" : "a",
      "to" : "Final",
      "from" : "First symbol"
    },
    {
      "with" : "u",
      "to" : "Final",
      "from" : "First symbol"
    },
    {
      "with" : "c",
      "to" : "Final",
      "from" : "First symbol"
    },
    {
      "with" : "x",
      "to" : "Final",
      "from" : "First symbol"
    },
    {
      "with" : "E",
      "to" : "Final",
      "from" : "First symbol"
    },
    {
      "with" : "Y",
      "to" : "Final",
      "from" : "First symbol"
    },
    {
      "with" : "l",
      "to" : "Final",
      "from" : "First symbol"
    },
    {
      "with" : "T",
      "to" : "Final",
      "from" : "First symbol"
    },
    {
      "with" : "_",
      "to" : "Final",
      "from" : "Final"
    },
    {
      "with" : "f",
      "to" : "Final",
      "from" : "Final"
    },
    {
      "with" : "T",
      "to" : "Final",
      "from" : "Final"
    },
    {
      "with" : "n",
      "to" : "Final",
      "from" : "Final"
    },
    {
      "with" : "0",
      "to" : "Final",
      "from" : "Final"
    },
    {
      "with" : "A",
      "to" : "Final",
      "from" : "Final"
    },
    {
      "with" : "K",
      "to" : "Final",
      "from" : "Final"
    },
    {
      "with" : "9",
      "to" : "Final",
      "from" : "Final"
    },
    {
      "with" : "y",
      "to" : "Final",
      "from" : "Final"
    },
    {
      "with" : "X",
      "to" : "Final",
      "from" : "Final"
    },
    {
      "with" : "8",
      "to" : "Final",
      "from" : "Final"
    },
    {
      "with" : "R",
      "to" : "Final",
      "from" : "Final"
    },
    {
      "with" : "t",
      "to" : "Final",
      "from" : "Final"
    },
    {
      "with" : "W",
      "to" : "Final",
      "from" : "Final"
    },
    {
      "with" : "d",
      "to" : "Final",
      "from" : "Final"
    },
    {
      "with" : "2",
      "to" : "Final",
      "from" : "Final"
    },
    {
      "with" : "w",
      "to" : "Final",
      "from" : "Final"
    },
    {
      "with" : "e",
      "to" : "Final",
      "from" : "Final"
    },
    {
      "with" : "q",
      "to" : "Final",
      "from" : "Final"
    },
    {
      "with" : "o",
      "to" : "Final",
      "from" : "Final"
    },
    {
      "with" : "U",
      "to" : "Final",
      "from" : "Final"
    },
    {
      "with" : "3",
      "to" : "Final",
      "from" : "Final"
    },
    {
      "with" : "j",
      "to" : "Final",
      "from" : "Final"
    },
    {
      "with" : "M",
      "to" : "Final",
      "from" : "Final"
    },
    {
      "with" : "7",
      "to" : "Final",
      "from" : "Final"
    },
    {
      "with" : "z",
      "to" : "Final",
      "from" : "Final"
    },
    {
      "with" : "L",
      "to" : "Final",
      "from" : "Final"
    },
    {
      "with" : "F",
      "to" : "Final",
      "from" : "Final"
    },
    {
      "with" : "V",
      "to" : "Final",
      "from" : "Final"
    },
    {
      "with" : "D",
      "to" : "Final",
      "from" : "Final"
    },
    {
      "with" : "N",
      "to" : "Final",
      "from" : "Final"
    },
    {
      "with" : "u",
      "to" : "Final",
      "from" : "Final"
    },
    {
      "with" : "C",
      "to" : "Final",
      "from" : "Final"
    },
    {
      "with" : "5",
      "to" : "Final",
      "from" : "Final"
    },
    {
      "with" : "Q",
      "to" : "Final",
      "from" : "Final"
    },
    {
      "with" : "S",
      "to" : "Final",
      "from" : "Final"
    },
    {
      "with" : "v",
      "to" : "Final",
      "from" : "Final"
    },
    {
      "with" : "E",
      "to" : "Final",
      "from" : "Final"
    },
    {
      "with" : "G",
      "to" : "Final",
      "from" : "Final"
    },
    {
      "with" : "x",
      "to" : "Final",
      "from" : "Final"
    },
    {
      "with" : "I",
      "to" : "Final",
      "from" : "Final"
    },
    {
      "with" : "c",
      "to" : "Final",
      "from" : "Final"
    },
    {
      "with" : "p",
      "to" : "Final",
      "from" : "Final"
    },
    {
      "with" : "H",
      "to" : "Final",
      "from" : "Final"
    },
    {
      "with" : "1",
      "to" : "Final",
      "from" : "Final"
    },
    {
      "with" : "h",
      "to" : "Final",
      "from" : "Final"
    },
    {
      "with" : "i",
      "to" : "Final",
      "from" : "Final"
    },
    {
      "with" : "6",
      "to" : "Final",
      "from" : "Final"
    },
    {
      "with" : "O",
      "to" : "Final",
      "from" : "Final"
    },
    {
      "with" : "g",
      "to" : "Final",
      "from" : "Final"
    },
    {
      "with" : "a",
      "to" : "Final",
      "from" : "Final"
    },
    {
      "with" : "k",
      "to" : "Final",
      "from" : "Final"
    },
    {
      "with" : "b",
      "to" : "Final",
      "from" : "Final"
    },
    {
      "with" : "P",
      "to" : "Final",
      "from" : "Final"
    },
    {
      "with" : "B",
      "to" : "Final",
      "from" : "Final"
    },
    {
      "with" : "m",
      "to" : "Final",
      "from" : "Final"
    },
    {
      "with" : "l",
      "to" : "Final",
      "from" : "Final"
    },
    {
      "with" : "Y",
      "to" : "Final",
      "from" : "Final"
    },
    {
      "with" : "Z",
      "to" : "Final",
      "from" : "Final"
    },
    {
      "with" : "r",
      "to" : "Final",
      "from" : "Final"
    },
    {
      "with" : "s",
      "to" : "Final",
      "from" : "Final"
    },
    {
      "with" : "J",
      "to" : "Final",
      "from" : "Final"
    },
    {
      "with" : "4",
      "to" : "Final",
      "from" : "Final"
    }
  ],
  "initialState" : "First symbol",
  "finalStates" : [
    "Final"
  ]
}
"""
}

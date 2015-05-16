//
//  RoShamBoModel.swift
//  RoShamBo
//
//  Created by Jon Gordon on 16/05/2015.
//  Copyright (c) 2015 JonGor Software. All rights reserved.
//

import Foundation

enum RoShamBo {
    case Rock, Paper, Scissors

    init() {
        switch arc4random() % 3 {
        case 0:
            self = .Rock
        case 1:
            self = .Paper
        default:
            self = .Scissors
        }
    }

    func beats(opponent: RoShamBo) -> Bool {
        switch (self, opponent) {
        case (.Rock, .Scissors), (.Paper, .Rock), (.Scissors, .Paper):
            return true
        default:
            return false
        }
    }
}

extension RoShamBo: Printable {
    var description: String {
        get {
            switch (self) {
            case .Rock:
                return "Rock"
            case .Paper:
                return "Paper"
            case Scissors:
                return "Scissors"
            }
        }
    }
}

struct Match {
    let p1: RoShamBo
    let p2: RoShamBo

    init(p1: RoShamBo, p2: RoShamBo) {
        self.p1 = p1
        self.p2 = p2
    }

    var winner: RoShamBo {
        get {
            return p1.beats(p2) ? p1 : p2
        }
    }

    var loser: RoShamBo {
        get {
            return p1.beats(p2) ? p2 : p1
        }
    }
}
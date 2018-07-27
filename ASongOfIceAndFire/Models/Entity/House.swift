//
//  House.swift
//  ASongOfIceAndFire
//
//  Created by Nastya on 23.07.2018.
//  Copyright © 2018 Nastya. All rights reserved.
//

import UIKit
import ObjectMapper

class House: Mappable {

    private struct Keys {
        public static let url = "url"
        public static let name = "name"
        public static let region = "region"
        public static let coatOfArms = "coatOfArms"
        public static let words = "words"
        public static let titles = "titles"
        public static let seats = "seats"
        public static let currentLord = "currentLord"
        public static let heir = "released"
        public static let overlord = "overlord"
        public static let founded = "founded"
        public static let founder = "founder"
        public static let diedOut = "diedOut"
        public static let ancestralWeapons = "ancestralWeapons"
        public static let cadetBranches = "cadetBranches"
        public static let swornMembers = "swornMembers"
    }

    public var url = ""
    public var name = ""
    public var region = ""
    public var coatOfArms = ""
    public var words = ""
    public var titles: [String]?
    public var seats: [String]?
    public var currentLord = ""
    public var heir = ""
    public var overlord = ""
    public var founded = ""
    public var founder = ""
    public var diedOut = ""
    public var ancestralWeapons: [String]?
    public var cadetBranches: [String]?
    public var swornMembers: [String]?

    public required init?(map: Map) {}

    public func mapping(map: Map) {
        self.url <- map[Keys.url]
        self.name <- map[Keys.name]
        self.region <- map[Keys.region]
        self.coatOfArms <- map[Keys.coatOfArms]
        self.words <- map[Keys.words]
        self.titles <- map[Keys.titles]
        self.seats <- map[Keys.seats]
        self.currentLord <- map[Keys.currentLord]
        self.heir <- map[Keys.heir]
        self.overlord <- map[Keys.overlord]
        self.founded <- map[Keys.founded]
        self.founder <- map[Keys.founder]
        self.diedOut <- map[Keys.diedOut]
        self.ancestralWeapons <- map[Keys.ancestralWeapons]
        self.cadetBranches <- map[Keys.cadetBranches]
        self.swornMembers <- map[Keys.swornMembers]
    }
}

//
//  Character.swift
//  ASongOfIceAndFire
//
//  Created by Nastya on 27.07.2018.
//  Copyright © 2018 Nastya. All rights reserved.
//

import UIKit
import ObjectMapper

class Character: Mappable {

    private struct Keys {
        public static let url = "url"
        public static let name = "name"
        public static let gender = "gender"
        public static let culture = "culture"
        public static let born = "born"
        public static let died = "died"
        public static let titles = "titles"
        public static let aliases = "aliases"
        public static let father = "father"
        public static let mother = "mother"
        public static let spouse = "spouse"
        public static let allegiances = "allegiances"
        public static let books = "books"
        public static let povBooks = "povBooks"
        public static let tvSeries = "tvSeries"
        public static let playedBy = "playedBy"
    }

    public var url = ""
    public var name = ""
    public var gender = ""
    public var culture = ""
    public var born = ""
    public var died = ""
    public var titles: [String]?
    public var aliases: [String]?
    public var father = ""
    public var mother = ""
    public var spouse = ""
    public var allegiances: [String]?
    public var books: [String]?
    public var povBooks: [String]?
    public var tvSeries: [String]?
    public var playedBy: [String]?

    public required init?(map: Map) {}

    public func mapping(map: Map) {
        self.url <- map[Keys.url]
        self.name <- map[Keys.name]
        self.gender <- map[Keys.gender]
        self.culture <- map[Keys.culture]
        self.born <- map[Keys.born]
        self.died <- map[Keys.died]
        self.titles <- map[Keys.titles]
        self.aliases <- map[Keys.aliases]
        self.father <- map[Keys.father]
        self.mother <- map[Keys.mother]
        self.spouse <- map[Keys.spouse]
        self.allegiances <- map[Keys.allegiances]
        self.books <- map[Keys.books]
        self.povBooks <- map[Keys.povBooks]
        self.tvSeries <- map[Keys.tvSeries]
        self.playedBy <- map[Keys.playedBy]
    }
}

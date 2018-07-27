//
//  Book.swift
//  ASongOfIceAndFire
//
//  Created by Nastya on 23.07.2018.
//  Copyright © 2018 Nastya. All rights reserved.
//

import UIKit
import ObjectMapper

class Book: Mappable {

    private struct Keys {
        public static let url = "url"
        public static let name = "name"
        public static let isbn = "isbn"
        public static let authors = "authors"
        public static let numberOfPages = "numberOfPages"
        public static let publisher = "publisher"
        public static let country = "country"
        public static let mediaType = "mediaType"
        public static let released = "released"
        public static let characters = "characters"
        public static let povCharacters = "povCharacters"
    }

    public var url = ""
    public var name = ""
    public var isbn = ""
    public var authors: [String]?
    public var numberOfPages = 0
    public var publisher = ""
    public var country = ""
    public var mediaType = ""
    public var released = ""
    public var characters: [String]?
    public var povCharacters: [String]?

    public required init?(map: Map) {}

    public func mapping(map: Map) {
        self.url <- map[Keys.url]
        self.name <- map[Keys.name]
        self.isbn <- map[Keys.isbn]
        self.authors <- map[Keys.authors]
        self.numberOfPages <- map[Keys.numberOfPages]
        self.publisher <- map[Keys.publisher]
        self.country <- map[Keys.country]
        self.mediaType <- map[Keys.mediaType]
        self.released <- map[Keys.released]
        self.characters <- map[Keys.characters]
        self.povCharacters <- map[Keys.povCharacters]
    }
}

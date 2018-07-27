//
//  NetworkService.swift
//  ASongOfIceAndFire
//
//  Created by Nastya on 24.07.2018.
//  Copyright © 2018 Nastya. All rights reserved.
//

import UIKit

typealias BooksRequestCompletion = ([Book]?, Error?) -> Void
typealias CharactersRequestCompletion = ([Character]?, Error?) -> Void
typealias HousesRequestCompletion = ([House]?, Error?) -> Void

final class NetworkService {

    func getBooks(completion: @escaping BooksRequestCompletion) {
        GetAllBooksRequest.getBooks { (books, error) in
            completion(books, error)
        }
    }

    func getHouses(completion: @escaping HousesRequestCompletion) {
        GetAllHousesRequest.getHouses { (houses, error) in
            completion(houses, error)
        }
    }

    func getCharacters(completion: @escaping CharactersRequestCompletion) {
        GetAllCharactersRequest.getCharacters { (characters, error) in
            completion(characters, error)
        }
    }
}

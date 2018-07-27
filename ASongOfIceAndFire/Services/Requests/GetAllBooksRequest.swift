//
//  GetAllBooksRequest.swift
//  ASongOfIceAndFire
//
//  Created by Nastya on 23.07.2018.
//  Copyright © 2018 Nastya. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper

final class GetAllBooksRequest {

    static func getBooks(completion: @escaping BooksRequestCompletion) {
        Alamofire.request(URLs.apiBaseUrl + URLs.Books, method: .get).responseJSON { response in
            guard response.result.isSuccess else {
                print("Ошибка запроса \(String(describing: response.result.error))")
                completion(nil, response.result.error)
                return
            }
            guard let mapped = Mapper<Book>().mapArray(JSONObject: response.value) else {
                completion(nil, nil)
                return
            }
            completion(mapped, response.result.error)
        }
    }

}

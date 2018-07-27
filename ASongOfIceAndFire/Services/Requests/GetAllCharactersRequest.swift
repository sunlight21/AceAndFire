//
//  GetAllCharactersRequest.swift
//  ASongOfIceAndFire
//
//  Created by Nastya on 22.07.2018.
//  Copyright © 2018 Nastya. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper



final class GetAllCharactersRequest {

    static func getCharacters(completion: @escaping CharactersRequestCompletion) {
        Alamofire.request(URLs.apiBaseUrl + URLs.Character, method: .get).responseJSON { response in
            guard response.result.isSuccess else {
                print("Ошибка запроса \(String(describing: response.result.error))")
                completion(nil, response.result.error)
                return
            }
            guard let mapped = Mapper<Character>().mapArray(JSONObject: response.value) else {
                completion(nil, nil)
                return
            }
            completion(mapped, response.result.error)
        }
    }
}

//
//  Presenter.swift
//  ASongOfIceAndFire
//
//  Created by Nastya on 23.07.2018.
//  Copyright © 2018 Nastya. All rights reserved.
//

import UIKit

final class Presenter {

    weak var view: ViewController?
    let service: NetworkService?

    init(view: ViewController?) {
        self.view = view
        self.service = NetworkService()
    }
}

extension Presenter {

    func loadBooks() {
        view?.loader(value: true)
        service?.getBooks(completion: { [weak self] (books, error) in
            self?.view?.loader(value: false)
            if let err = error {
                self?.view?.showError(error: err)
                return
            }
            if let val = books {
                self?.view?.reloadBooks(result: val)
            }
        })
    }

    func loadHouses() {
        view?.loader(value: true)
        service?.getHouses(completion: { [weak self] (houses, error) in
            self?.view?.loader(value: false)
            if let err = error {
                self?.view?.showError(error: err)
                return
            }
            if let val = houses {
                self?.view?.reloadHouses(result: val)
            }
        })
    }

    func loadCharacters() {
        view?.loader(value: true)
        service?.getCharacters(completion: { [weak self] (characters, error) in
            self?.view?.loader(value: false)
            if let err = error {
                self?.view?.showError(error: err)
                return
            }
            if let val = characters {
                self?.view?.reloadCharacters(result: val)
            }
        })
    }
}

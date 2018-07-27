//
//  ViewController.swift
//  ASongOfIceAndFire
//
//  Created by Nastya on 21.07.2018.
//  Copyright © 2018 Nastya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - IBOutlets
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var tableView: UITableView!

    // MARK: - Constants

    fileprivate let bookCell = String(describing: BookCell.self)
    fileprivate let commonCell = String(describing: CommonCell.self)

    // MARK: - Properties

    var presenter: Presenter?
    var books: [Book]?
    var houses: [House]?
    var characters: [Character]?

    lazy var indicator: IndicatorItem? = IndicatorItem(view: self.view, color: UIColor.lightGray)

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = Presenter(view: self)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.registerNib(cellType: BookCell.self)
        tableView.registerNib(cellType: CommonCell.self)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UIApplication.shared.statusBarStyle = .lightContent
        presenter?.loadBooks()
    }
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension ViewController {

    func loader(value: Bool) {
        indicator?.make(visible: value)
    }

    func showError(error: Error?) {
        let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true)
    }

    func reloadBooks(result: [Book]) {
        self.books = result
        tableView.reloadData()
    }

    func reloadCharacters(result: [Character]) {
        self.characters = result
        tableView.reloadData()
    }

    func reloadHouses(result: [House]) {
        self.houses = result
        tableView.reloadData()
    }
}

private extension ViewController {
    @IBAction func indexChanged(sender: UISegmentedControl) {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            presenter?.loadBooks()
        case 1:
            presenter?.loadHouses()
        case 2:
            presenter?.loadCharacters()
        default:
            break;
        }
    }
}

// MARK: UITableViewDataSource

extension ViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            if let val = self.books?.count {
                return val
            }
            return 0
        case 1:
            if let val = self.houses?.count {
                return val
            }
            return 0
        case 2:
            if let val = self.characters?.count {
                return val
            }
            return 0
        default:
            return 0
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        switch segmentedControl.selectedSegmentIndex {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: bookCell) as? BookCell else {
                return UITableViewCell()
            }
            if let book = self.books?[indexPath.row] {
                cell.configureCell(book: book)
            }
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: commonCell) as? CommonCell else {
                return UITableViewCell()
            }
            if let val = self.houses?[indexPath.row] {
                cell.configureCell(value: val.name)
            }
            return cell
        case 2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: commonCell) as? CommonCell else {
                return UITableViewCell()
            }
            if let val = self.characters?[indexPath.row] {
                cell.configureCell(value: val.name)
            }
            return cell
        default:
            return UITableViewCell()
        }
    }
}

// MARK: UITableViewDelegate

extension ViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }

}



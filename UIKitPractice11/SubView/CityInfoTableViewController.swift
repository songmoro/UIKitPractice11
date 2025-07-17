//
//  CityInfoTableViewController.swift
//  UIKitPractice11
//
//  Created by 송재훈 on 7/17/25.
//

import UIKit

extension CityInfoTableViewController {
    typealias Input = [City]
    typealias Model = [City]
    
    func put(_ input: Input) {
        model = input
    }
}

class CityInfoTableViewController: UIViewController, HasModel, UITableViewDelegate, UITableViewDataSource {
    var selectedCities = [City]()
    var model: Model? {
        didSet {
            update()
        }
    }
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        print(#function, #fileID)
        super.viewDidLoad()
        
        configureTableView()
    }
    
    override func viewIsAppearing(_ animated: Bool) {
        print(#function, #fileID)
        super.viewIsAppearing(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print(#function, #fileID)
        super.viewDidAppear(animated)
    }
    
    deinit {
        print(#function, #fileID)
    }
    
    func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 150
        tableView.separatorStyle = .none
        tableView.register(of: CityInfoCell.self)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectedCities.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueCustomCell(of: CityInfoCell.self, for: indexPath)
        let city = selectedCities[indexPath.row]
        cell?.put(city)

        return cell ?? UITableViewCell()
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // TODO: Storyboard 네임
        guard let vc = UIStoryboard(name: "CityInfo", bundle: nil).instantiateViewController(withIdentifier: CityDetailViewController.identifier) as? CityDetailViewController else { return }
        let city = selectedCities[indexPath.row]
        vc.put(city)

        navigationController?.pushViewController(vc, animated: true)
    }
    
    func update() {
        guard let model else { return }
        selectedCities = model
        tableView.reloadData()
    }
}

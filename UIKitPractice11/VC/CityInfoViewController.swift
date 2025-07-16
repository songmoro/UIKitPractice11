//
//  CityInfoViewController.swift
//  UIKitPractice11
//
//  Created by 송재훈 on 7/16/25.
//

import UIKit

// TODO: 특정 상황에서 getCity() out of range 발생
class CityInfoViewController: UIViewController {
    let cityInfo = CityInfo()
    var selectedCities: [City] = []
    // TODO: 필터링한 데이터 보여줄 다른 방법
    var filteredCities: [City] = []
    
    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var segmentedControl: UISegmentedControl!
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSearchBar()
        configureTableView()
        configureSegmentedControl()
        
        didChangeSelectedSegment()
    }
}

// MARK: TableView
extension CityInfoViewController: UITableViewDelegate, UITableViewDataSource  {
    func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 150
        tableView.separatorStyle = .none
        tableView.register(of: CityInfoCell.self)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchBar.searchTextField.isEditing {
            return filteredCities.count
        }
        else {
            return selectedCities.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueCustomCell(of: CityInfoCell.self, for: indexPath)
        let city = getCity(indexPath)
        cell?.put(city)
        
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: CityDetailViewController.identifier) as? CityDetailViewController else { return }
        let city = getCity(indexPath)
        vc.put(city)
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func getCity(_ indexPath: IndexPath) -> City {
        if searchBar.searchTextField.isEditing {
            filteredCities[indexPath.row]
        }
        else {
            selectedCities[indexPath.row]
        }
    }
}

// MARK: SegmentedControl
extension CityInfoViewController {
    func configureSegmentedControl() {
        segmentedControl.removeAllSegments()
        segmentedControl.addTarget(self, action: #selector(didChangeSelectedSegment), for: .valueChanged)
        
        segmentedControl.insertSegment(withTitle: "모두", at: 0, animated: true)
        segmentedControl.insertSegment(withTitle: "국내", at: 1, animated: true)
        segmentedControl.insertSegment(withTitle: "해외", at: 2, animated: true)
        
        segmentedControl.selectedSegmentIndex = 0
    }
    
    @objc func didChangeSelectedSegment() {
        view.endEditing(true)
        
        selectedCities = {
            return switch segmentedControl.selectedSegmentIndex {
            case 0: cityInfo.city
            case 1: cityInfo.city.filter(\.domestic_travel)
            case 2: cityInfo.city.filter({ !$0.domestic_travel })
            default: []
            }
        }()
        
        tableView.reloadData()
    }
}

// MARK: SearchBar & TextField
extension CityInfoViewController {
    func configureSearchBar() {
        searchBar.searchTextField.addTarget(self, action: #selector(textFieldDidEndEditing), for: .editingDidEndOnExit)
        searchBar.searchTextField.addTarget(self, action: #selector(textFieldEditingChange), for: .editingChanged)
    }
    
    @objc func textFieldEditingChange(_ textField: UITextField) {
        guard let text = textField.text?.lowercased(), !text.isEmpty else { return }
        
        // TODO: ㅂ ㅏ ㅇ ㅋ ㅗ ㄱ 같은 검색 성능 개선
        filteredCities = selectedCities.filter {
            $0.city_name.hasPrefix(text) ||
            $0.lowerCasedCityEnglishName.hasPrefix(text) ||
            $0.city_explain.hasPrefix(text)
        }
        
        tableView.reloadData()
    }
    
    @objc func textFieldDidEndEditing() {
        view.endEditing(true)
        
//        tableView.reloadData()
    }
}

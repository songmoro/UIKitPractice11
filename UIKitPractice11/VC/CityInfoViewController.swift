//
//  CityInfoViewController.swift
//  UIKitPractice11
//
//  Created by 송재훈 on 7/16/25.
//

import UIKit

class CityInfoViewController: UIViewController {
    let cityInfo = CityInfo()
    let domesticCities = CityInfo().city.filter(\.domestic_travel)
    let foreignCities = CityInfo().city.filter({ !$0.domestic_travel })
    
    var selectedCities: [City] = []
    var subVC: UIViewController?
    
    @IBOutlet var containerView: UIView!
    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var segmentedControl: UISegmentedControl!
    @IBOutlet var tableView: UITableView!
    @IBOutlet var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        print(#function, #fileID)
        super.viewDidLoad()
        
        configureSearchBar()
        configureSegmentedControl()
        configureContainer()
        
        didChangeSelectedSegment()
    }
}

// MARK: Container View
extension CityInfoViewController {
    func configureContainer() {
//        $0.willMove(toParent: nil)
//        $0.view.removeFromSuperview()
//        $0.removeFromParent()
        
//        addChild(vc)
//        view.addSubview(vc.view)
//        vc.didMove(toParent: self)
        
        if navigationController?.tabBarItem.tag == 1 {
            guard let vc = Bundle.main.loadNibNamed("CityInfoTableViewController", owner: nil)?.first as? CityInfoTableViewController else { return }
            subVC = vc
            vc.view.frame = containerView.bounds
            
            addChild(vc)
            containerView.addSubview(vc.view)
            vc.didMove(toParent: self)
        }
        else if navigationController?.tabBarItem.tag == 2 {
            guard let vc = Bundle.main.loadNibNamed("CityInfoCollectionViewController", owner: nil)?.first as? CityInfoCollectionViewController else { return }
            subVC = vc
            vc.view.frame = containerView.bounds
            
            addChild(vc)
            containerView.addSubview(vc.view)
            vc.didMove(toParent: self)
        }
    }
}

// MARK: SegmentedControl
extension CityInfoViewController {
    func configureSegmentedControl() {
        segmentedControl.removeAllSegments()
        segmentedControl.insertSegment(withTitle: "모두", at: 0, animated: true)
        segmentedControl.insertSegment(withTitle: "국내", at: 1, animated: true)
        segmentedControl.insertSegment(withTitle: "해외", at: 2, animated: true)
        segmentedControl.addTarget(self, action: #selector(didChangeSelectedSegment), for: .valueChanged)
        segmentedControl.selectedSegmentIndex = 0
    }
    
    @objc func didChangeSelectedSegment() {
        view.endEditing(true)
        selectedCities = filterCities()
        
        (subVC as? CityInfoTableViewController)?.put(selectedCities)
        (subVC as? CityInfoCollectionViewController)?.put(selectedCities)
    }
}

// MARK: SearchBar & TextField
extension CityInfoViewController {
    func configureSearchBar() {
        searchBar.searchTextField.addTarget(self, action: #selector(textFieldDidEndEditing), for: .editingDidEndOnExit)
        searchBar.searchTextField.addTarget(self, action: #selector(textFieldEditingChange), for: .editingChanged)
    }
    
    func filterCities() -> [City] {
        return switch segmentedControl.selectedSegmentIndex {
        case 0: cityInfo.city
        case 1: domesticCities
        case 2: foreignCities
        default: []
        }
    }
    
    @objc func textFieldEditingChange(_ textField: UITextField) {
        if let text = textField.text?.lowercased(), !text.isEmpty {
            // TODO: ㅂ ㅏ ㅇ ㅋ ㅗ ㄱ 같은 검색 성능 개선
            // TODO: 중간 텍스트를 입력해도 검색 가능(콕 -> 방콕)
            selectedCities = filterCities().filter {
                $0.city_name.hasPrefix(text) ||
                $0.lowerCasedCityEnglishName.hasPrefix(text) ||
                $0.city_explain.hasPrefix(text)
            }
        }
        else {
            selectedCities = filterCities()
        }
        
        (subVC as? CityInfoTableViewController)?.put(selectedCities)
        (subVC as? CityInfoCollectionViewController)?.put(selectedCities)
    }
    
    @objc func textFieldDidEndEditing() {
        view.endEditing(true)
    }
}

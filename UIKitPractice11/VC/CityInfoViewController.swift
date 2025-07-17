//
//  CityInfoViewController.swift
//  UIKitPractice11
//
//  Created by 송재훈 on 7/16/25.
//

import UIKit

// TODO: 테이블 뷰, 컬렉션 뷰 컨트롤러 나눠서 불러오기
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
        print(#function, #file)
        super.viewDidLoad()
        configureSearchBar()
        configureSegmentedControl()
        
//        configureTableView()
//        configureCollectionView()
        configureContainer()
        
        didChangeSelectedSegment()
    }
    
    func configureContainer() {
//        $0.willMove(toParent: nil)
//        $0.view.removeFromSuperview()
//        $0.removeFromParent()
        
//        addChild(vc)
//        view.addSubview(vc.view)
//        vc.didMove(toParent: self)
        
        if navigationController?.tabBarItem.tag == 1 - 1 {
            guard let vc = Bundle.main.loadNibNamed("CityInfoTableViewController", owner: nil)?.first as? CityInfoTableViewController else { return }
            subVC = vc
            vc.view.frame = containerView.bounds
            
            addChild(vc)
            containerView.addSubview(vc.view)
            vc.didMove(toParent: self)
        }
        else {
            guard let vc = Bundle.main.loadNibNamed("CityInfoCollectionViewController", owner: nil)?.first as? CityInfoCollectionViewController else { return }
            subVC = vc
            vc.view.frame = containerView.bounds
            
            addChild(vc)
            containerView.addSubview(vc.view)
            vc.didMove(toParent: self)
        }
    }
}

// MARK: Collection View
extension CityInfoViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func configureCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(of: CityInfoCollectionCell.self)
        
        let screen = UIScreen.main.bounds
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: screen.width * 0.4, height: screen.height * 0.3)
        layout.minimumInteritemSpacing = 16
        
        collectionView.collectionViewLayout = layout
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return selectedCities.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueCustomCell(of: CityInfoCollectionCell.self, for: indexPath)
        let city = selectedCities[indexPath.row]
        let screen = UIScreen.main.bounds
        cell?.put(.init(city: city, width: screen.width * 0.4))
        
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: CityDetailViewController.identifier) as? CityDetailViewController else { return }
        let city = selectedCities[indexPath.row]
        vc.put(city)
        
        navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: TableView
//extension CityInfoViewController: UITableViewDelegate, UITableViewDataSource  {
//    func configureTableView() {
//        tableView.delegate = self
//        tableView.dataSource = self
//        tableView.rowHeight = 150
//        tableView.separatorStyle = .none
//        tableView.register(of: CityInfoCell.self)
//    }
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return selectedCities.count
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueCustomCell(of: CityInfoCell.self, for: indexPath)
//        let city = selectedCities[indexPath.row]
//        cell?.put(city)
//        
//        return cell ?? UITableViewCell()
//    }
//    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        guard let vc = storyboard?.instantiateViewController(withIdentifier: CityDetailViewController.identifier) as? CityDetailViewController else { return }
//        let city = selectedCities[indexPath.row]
//        vc.put(city)
//        
//        navigationController?.pushViewController(vc, animated: true)
//    }
//}

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
        
        selectedCities = filterCities()
        
        // TODO: 통합
        (subVC as? CityInfoTableViewController)?.put(selectedCities)
        (subVC as? CityInfoCollectionViewController)?.put(selectedCities)
        tableView.reloadData()
        collectionView.reloadData()
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
    
    // TODO: 로직 개선
    @objc func textFieldEditingChange(_ textField: UITextField) {
        guard let text = textField.text?.lowercased(), !text.isEmpty else {
            selectedCities = filterCities()
            
            // TODO: 통합
            (subVC as? CityInfoTableViewController)?.put(selectedCities)
            (subVC as? CityInfoCollectionViewController)?.put(selectedCities)
            tableView.reloadData()
            collectionView.reloadData()
            return
        }
        
        // TODO: ㅂ ㅏ ㅇ ㅋ ㅗ ㄱ 같은 검색 성능 개선
        // TODO: 중간 텍스트를 입력해도 검색 가능(콕 -> 방콕)
        selectedCities = filterCities().filter {
            $0.city_name.hasPrefix(text) ||
            $0.lowerCasedCityEnglishName.hasPrefix(text) ||
            $0.city_explain.hasPrefix(text)
        }
        
        // TODO: 통합
        (subVC as? CityInfoTableViewController)?.put(selectedCities)
        (subVC as? CityInfoCollectionViewController)?.put(selectedCities)
        tableView.reloadData()
        collectionView.reloadData()
    }
    
    @objc func textFieldDidEndEditing() {
        view.endEditing(true)
    }
}

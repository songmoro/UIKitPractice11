//
//  CityInfoCollectionViewController.swift
//  UIKitPractice11
//
//  Created by 송재훈 on 7/18/25.
//

import UIKit

extension CityInfoCollectionViewController {
    typealias Input = [City]
    typealias Model = [City]
    
    func put(_ input: Input) {
        model = input
    }
}

class CityInfoCollectionViewController: UIViewController, HasModel, UICollectionViewDelegate, UICollectionViewDataSource {
    var selectedCities = [City]()
    var model: Model? {
        didSet {
            update()
        }
    }
    
    @IBOutlet var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(#function, #fileID)
        configureCollectionView()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print(#function, #fileID)
    }
    
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
        guard let vc = UIStoryboard(name: "CityInfo", bundle: nil).instantiateViewController(withIdentifier: CityDetailViewController.identifier) as? CityDetailViewController else { return }
        let city = selectedCities[indexPath.row]
        vc.put(city)

        navigationController?.pushViewController(vc, animated: true)
    }
    
    func update() {
        guard let model else { return }
        selectedCities = model
        collectionView.reloadData()
    }
}

//
//  TravelInfoTableViewController.swift
//  UIKitPractice11
//
//  Created by 송재훈 on 7/11/25.
//

import UIKit
import Kingfisher

class TravelInfoTableViewController: UITableViewController {
    let travelInfo = TravelInfo()
    
    // TODO: 메모리 절약
    
    override func viewDidLoad() {
        print(#file, #function)
        super.viewDidLoad()
        
        tableView.rowHeight = 150
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        travelInfo.travel.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: TravelInfoTableViewCell.identifier,
            for: indexPath
        ) as? TravelInfoTableViewCell else { return UITableViewCell() }
        

        let travel = travelInfo.travel[indexPath.row]
        cell.travel = TravelInfoTableViewCell.Input(
            titleText: travel.title,
            descriptionText: travel.description,
            grade: travel.grade,
            save: travel.save,
            like: travel.like
        )
        
        if let url = URL(string: travel.travel_image ?? "") {
            cell.travel_image.kf.setImage(with: url)
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? TravelInfoTableViewCell else { return }
        guard cell.travel != nil else { return }
        cell.travel!.grade = CGFloat(Int.random(in: 0...5))
    }
}

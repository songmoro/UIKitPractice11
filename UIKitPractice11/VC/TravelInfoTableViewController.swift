//
//  TravelInfoTableViewController.swift
//  UIKitPractice11
//
//  Created by 송재훈 on 7/11/25.
//

import UIKit

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
        let travel = travelInfo.travel[indexPath.row]
        
        if travel.ad != nil, travel.ad! {
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: AdCell.identifier,
                for: indexPath
            ) as? AdCell else { return UITableViewCell() }
            
            cell.adTextLabel.text = travel.title
            
            return cell
        }
        
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: TravelInfoCell.identifier,
            for: indexPath
        ) as? TravelInfoCell else { return UITableViewCell() }
        
        cell.travel = TravelInfoCell.Input(
            imageURL: travel.travel_image,
            titleText: travel.title,
            descriptionText: travel.description,
            grade: travel.grade,
            save: travel.save,
            like: travel.like
        )
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? TravelInfoCell else { return }
        guard cell.travel != nil else { return }
        cell.travel!.grade = CGFloat(Int.random(in: 0...5))
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let travel = travelInfo.travel[indexPath.row]
        
        if travel.ad != nil, travel.ad! {
            return 100
        }
        else {
            return 150
        }
    }
}

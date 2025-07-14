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
    // TODO: UITableView + Custom Cell initializer
    // TODO: Input protocol
    // TODO: UITableView + Custom Cell Register 
    // TODO: UITableViewController Cell -> Xib Cell
    // TODO: kingfisher placeholder size
    
    override func viewDidLoad() {
        print(#file, #function)
        super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        travelInfo.travel.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let travel = travelInfo.travel[indexPath.row]
        let cell = tableView.dequeueCustomCell(of: travel.cell, for: indexPath)
        
        if travel.cell is AdCell.Type {
            let adCell = cell as! AdCell
            adCell.input = AdCell.Input(adText: travel.title)
        }
        else if travel.cell is TravelInfoCell.Type {
            let travelInfoCell = cell as! TravelInfoCell
            
            travelInfoCell.travel = TravelInfoCell.Input(
                imageURL: travel.travel_image,
                titleText: travel.title,
                descriptionText: travel.description,
                grade: travel.grade,
                save: travel.save,
                like: travel.like
            )
        }
        
        return cell ?? UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? TravelInfoCell else { return }
        guard cell.travel != nil else { return }
        cell.travel!.grade = CGFloat(Int.random(in: 0...5))
    }
}

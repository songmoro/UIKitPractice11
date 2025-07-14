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
        
        switch cell {
        case let adCell as AdCell:
            adCell.put(travel)
        case let travelCell as TravelInfoCell:
            travelCell.put(travel)
        default:
            break
        }
        
        return cell ?? UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? TravelInfoCell else { return }
        guard cell.model != nil else { return }
        cell.model!.grade = CGFloat(Int.random(in: 0...5))
    }
}

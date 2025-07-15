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
    // TODO: kingfisher placeholder size
    // TODO: variable arguments text label clear
    
    override func viewDidLoad() {
        print(#file, #function)
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: AdCell.identifier, bundle: nil), forCellReuseIdentifier: AdCell.identifier)
        tableView.register(UINib(nibName: TravelInfoCell.identifier, bundle: nil), forCellReuseIdentifier: TravelInfoCell.identifier)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        travelInfo.travel.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let travel = travelInfo.travel[indexPath.row]
        let cell = tableView.dequeueCustomCell(of: travel.cell, for: indexPath)
        
        (cell as? AdCell)?.put(travel)
        (cell as? TravelInfoCell)?.put(travel)
        
        return cell ?? UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? TravelInfoCell else { return }
        guard cell.model != nil else { return }
        cell.model!.grade = CGFloat(Int.random(in: 0...5))
    }
      
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch travelInfo.travel[indexPath.row].ad {
        case true: 80
        default: 150
        }
    }
}

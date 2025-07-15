//
//  MagazinInfoTableViewController.swift
//  UIKitPractice11
//
//  Created by 송재훈 on 7/11/25.
//

import UIKit

class MagazinInfoTableViewController: UITableViewController {    
    let magazineInfo = MagazineInfo()
    
    override func viewDidLoad() {
        print(#file, #function)
        super.viewDidLoad()
        
        tableView.rowHeight = 450
        tableView.register(UINib(nibName: MagazineInfoCell.identifier, bundle: nil), forCellReuseIdentifier: MagazineInfoCell.identifier)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        magazineInfo.magazine.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let magazine = magazineInfo.magazine[indexPath.row]
        let cell = tableView.dequeueCustomCell(of: magazine.cell, for: indexPath)
        
        (cell as? MagazineInfoCell)?.put(magazine)
        
        return cell ?? UITableViewCell()
    }
}

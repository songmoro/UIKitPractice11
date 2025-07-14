//
//  MagazinInfoTableViewController.swift
//  UIKitPractice11
//
//  Created by 송재훈 on 7/11/25.
//

import UIKit

class MagazinInfoTableViewController: UITableViewController {    
    let magazineInfo = MagazineInfo()
    
    // TODO: 데이트 포매터 다른 방법
    
    override func viewDidLoad() {
        print(#file, #function)
        super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        magazineInfo.magazine.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let magazine = magazineInfo.magazine[indexPath.row]
        let cell = tableView.dequeueCustomCell(of: magazine.cell, for: indexPath)
        
        switch cell {
        case is MagazineInfoTableViewCell:
            (cell as! MagazineInfoTableViewCell).put(magazine)
        default:
            break
        }
        
        return cell ?? UITableViewCell()
    }
}

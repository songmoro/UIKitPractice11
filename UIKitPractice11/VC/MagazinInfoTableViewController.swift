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
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        magazineInfo.magazine.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: MagazineInfoTableViewCell.identifier,
            for: indexPath
        ) as? MagazineInfoTableViewCell else { return UITableViewCell()}
        
        cell.title.text = magazineInfo.magazine[indexPath.row].title
        cell.subtitle.text = magazineInfo.magazine[indexPath.row].subtitle
        cell.date.text = magazineInfo.magazine[indexPath.row].date
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        600
    }
}

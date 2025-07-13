//
//  MagazinInfoTableViewController.swift
//  UIKitPractice11
//
//  Created by 송재훈 on 7/11/25.
//

import UIKit

class MagazinInfoTableViewController: UITableViewController {
    let dateToStringFomatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyMMdd"
        return dateFormatter
    }()
    let stringToDateFomatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yy년 MM월 dd일"
        return dateFormatter
    }()
    
    let magazineInfo = MagazineInfo()
    
    // TODO: 데이트 포매터 다른 방법
    // TODO: 셀 타입 캐스팅 가독성 향상시키기
    
    override func viewDidLoad() {
        print(#file, #function)
        super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        magazineInfo.magazine.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let magazine = magazineInfo.magazine[indexPath.row]
        
        if let cell = tableView.dequeueCustomCell(
            of: MagazineInfoTableViewCell.self,
            for: indexPath
        ), let cellDate = modelDateToCellDate(magazine.date) {
            
            cell.input = MagazineInfoTableViewCell.Input(
                imageURL: magazine.photo_image,
                titleText: magazine.title,
                subtitleText: magazine.subtitle,
                dateText: cellDate
            )
            
            return cell
        }
        else {
            return UITableViewCell()
        }
    }
    
    func modelDateToCellDate(_ text: String) -> String? {
        let formattedDate = dateToStringFomatter.date(from: text)
        guard let formattedDate else { return nil }
            
        return stringToDateFomatter.string(from: formattedDate)
    }
}

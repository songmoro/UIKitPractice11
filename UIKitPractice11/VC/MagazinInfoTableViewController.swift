//
//  MagazinInfoTableViewController.swift
//  UIKitPractice11
//
//  Created by 송재훈 on 7/11/25.
//

import UIKit
import Kingfisher

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
    
    // TODO: 셀 높이 구해서 rowHeight 계산
    // TODO: prepareForReuse
    
    override func viewDidLoad() {
        print(#file, #function)
        super.viewDidLoad()
        
        tableView.rowHeight = 480
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        magazineInfo.magazine.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: MagazineInfoTableViewCell.identifier,
            for: indexPath
        ) as? MagazineInfoTableViewCell else { return UITableViewCell() }
        
        let magazine = magazineInfo.magazine[indexPath.row]
        
        guard let cellDate = modelDateToCellDate(magazine.date)
        else { return UITableViewCell()}
        
        cell.input = MagazineInfoTableViewCell.Input(
            titleText: magazine.title,
            subtitleText: magazine.subtitle,
            dateText: cellDate
        )
        
        if let url = URL(string: magazine.photo_image) {
            cell.photo_image.kf.setImage(
                with: url,
                placeholder: UIImage(systemName: "arrow.circlepath")
            )
        }
        
        return cell
    }
    
    func modelDateToCellDate(_ text: String) -> String? {
        let formattedDate = dateToStringFomatter.date(from: text)
        guard let formattedDate else { return nil }
            
        return stringToDateFomatter.string(from: formattedDate)
    }
}

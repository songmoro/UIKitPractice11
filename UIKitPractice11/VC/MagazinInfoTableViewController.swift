//
//  MagazinInfoTableViewController.swift
//  UIKitPractice11
//
//  Created by 송재훈 on 7/11/25.
//

import UIKit
import Kingfisher

class MagazinInfoTableViewController: UITableViewController {
    let magazineInfo = MagazineInfo()
    
    // TODO: 셀 높이 구해서 rowHeight 계산
    // TODO: 데이트 스트링 데이트 포매터
    // TODO: prepareForReuse
    // TODO: 플레이스홀더
    // TODO: 키패스 접근 시도
    
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
        ) as? MagazineInfoTableViewCell else { return UITableViewCell()}
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyMMdd"
        let formattedDate = dateFormatter.date(from: magazineInfo.magazine[indexPath.row].date)
        dateFormatter.dateFormat = "yy년 MM월 dd일"
        let cellDate = dateFormatter.string(from: formattedDate!)
        
        let url = URL(string: magazineInfo.magazine[indexPath.row].photo_image)!
        cell.photo_image.kf.setImage(with: url, placeholder: UIImage(systemName: "arrow.circlepath"), options: [])
        cell.title.text = magazineInfo.magazine[indexPath.row].title
        cell.subtitle.text = magazineInfo.magazine[indexPath.row].subtitle
        cell.date.text = cellDate
        
        return cell
    }
}

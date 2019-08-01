//
//  LKHomeViewController.swift
//  MouseToolbox
//
//  Created by leikai on 2019/7/13.
//  Copyright © 2019 leikai. All rights reserved.
//

import UIKit
import SnapKit
class LKHomeViewController: LKViewController {

    var dataArr = Array<LKHomeModel>()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "😉开心哦"
        createBase()
    }
    
    func createBase() {
        dataArr.append(LKHomeModel(iconName: "home_timer", title: "计时器", bgColor: UIColor.appBlue))
        
        dataArr.append(LKHomeModel(iconName: "home_drink_water", title: "喝水提醒", bgColor: UIColor.appPink))

        view.addSubview(tableView)
        tableView.register(LKHomeCell.self, forCellReuseIdentifier: LKHomeCell.identifier())
        tableView.snp.makeConstraints { (make) in
            make.edges.equalTo(view)
        }
    }

    // MARK: - Lazy
    lazy var tableView: LKTableView = {
        let tableView = LKTableView(frame: CGRect.zero, style: .plain)
        tableView.separatorStyle = .none;
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 70.0;
        return tableView
    }()
    

}

extension LKHomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:LKHomeCell = tableView.dequeueReusableCell(withIdentifier: LKHomeCell.identifier(), for: indexPath) as! LKHomeCell
//        cell.textLabel?.text = "hello,world!"
        cell.model = dataArr[indexPath.row]
        return cell
    }

}

extension LKHomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        switch indexPath.row {
        case 0:
            let timerVc = LKTimerViewController()
            navigationController?.pushViewController(timerVc, animated: true)
        default:
            break
        }
    }
    

}

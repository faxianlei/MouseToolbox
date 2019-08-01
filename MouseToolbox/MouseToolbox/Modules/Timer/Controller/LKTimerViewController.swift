//
//  LKTimerViewController.swift
//  MouseToolbox
//
//  Created by leikai on 2019/7/28.
//  Copyright © 2019 leikai. All rights reserved.
//

import UIKit
import SnapKit

class LKTimerViewController: LKViewController {

    var dataArr = Array<LKTimerModel>()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        title = "计时器"
        createBase()
    }
    
    func createBase() {
        
        let rightBarItem = UIBarButtonItem(customView: addButton)
        navigationItem.rightBarButtonItem = rightBarItem
        
//        view.addSubview(addButton)
        view.addSubview(tableView)
        tableView.register(LKTimerCell.self, forCellReuseIdentifier: LKTimerCell.identifier())
        
//        addButton.snp.makeConstraints { (make) in
//            make.top.equalTo(view.snp.bottom).offset(-20.0)
//            make.right.equalTo(view.snp.right).offset(-20.0)
//            make.width.height.equalTo(44.0)
//        }
        
        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(view.snp.top)
            make.left.equalTo(view.snp.left)
            make.right.equalTo(view.snp.right)
            make.bottom.equalTo(view.snp.bottom)
        }
    }
    
    @objc func clickAdd() {
        
        print("点击了添加按钮")
        let model = LKTimerModel()
        dataArr.append(model)
        tableView.reloadData()
    }
    
    // MARK: - Lazy
    lazy var tableView: LKTableView = {
        let tableView = LKTableView(frame: CGRect.zero, style: .plain)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 60.0;
        //        tableView.setEditing(true, animated: true)
        //        tableView.allowsMultipleSelection = false;
        //        tableView.allowsSelectionDuringEditing = false;
        //        tableView.allowsMultipleSelectionDuringEditing = false;
        return tableView
    }()
    
    lazy var addButton: UIButton = {
        let addButton = UIButton(type: .custom)
//        addButton.backgroundColor = UIColor.appWhite
        addButton.setImage(UIImage(named: "timer_add"), for: .normal)
        addButton.setImage(UIImage(named: "timer_add"), for: .highlighted)
//        addButton.setBackgroundImage(UIImage(named: "timer_add"), for: .normal)
//        addButton.setBackgroundImage(UIImage(named: "timer_add"), for: .highlighted)
//        addButton.layer.cornerRadius = 22.0
//        addButton.layer.masksToBounds = true
        addButton.addTarget(self, action: #selector(clickAdd), for: .touchUpInside)
        return addButton
    }()
    
    
    
}

extension LKTimerViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:LKTimerCell = tableView.dequeueReusableCell(withIdentifier: LKTimerCell.identifier(), for: indexPath) as! LKTimerCell
        //        cell.textLabel?.text = "hello,world!"
        cell.model = dataArr[indexPath.row]
        cell.currentIndexPath = indexPath
        return cell
    }
    
}

extension LKTimerViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        
        return UITableViewCell.EditingStyle.delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        //删除
        if editingStyle == .delete {
            print("删除成功")
        }
    }
    
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "删除"
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let deleteAction = UITableViewRowAction(style: .destructive, title: "删除") { (action, indexPath) in
            print("删除成功")
            self.dataArr.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .left)
        }
        
        return [deleteAction]
    }
}

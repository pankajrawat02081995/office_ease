//
//  StaffListVC.swift
//  OfficeEase
//
//  Created by Pankaj Rawat on 03/04/25.
//

import UIKit

// MARK: - ViewController
class StaffListVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var selectedIndex = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        tableView.registerNib(nib: StaffListXIB.identifier)
    }
    
    @IBAction func nextOnPress(_ sender: UIButton) {
        pushViewController(ofType: CustomAlertVC.self, fromStoryboard: .main)
    }
}

// MARK: - TableView Delegate
extension StaffListVC: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: StaffListXIB.identifier, for: indexPath) as! StaffListXIB
        
        if self.selectedIndex.contains(indexPath.row){
            cell.imgCheck.image = UIImage(named: "ic_check")
        }else{
            cell.imgCheck.image = UIImage(named: "ic_uncheck")
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if self.selectedIndex.contains(indexPath.row){
            let index = self.selectedIndex.firstIndex(of: indexPath.row) ?? 0
            self.selectedIndex.remove(at: index)
        }else{
            self.selectedIndex.append(indexPath.row)
        }
        self.tableView.reloadData()
    }
}


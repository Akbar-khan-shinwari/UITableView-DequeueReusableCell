//
//  ViewController.swift
//  DequeueReusableCell
//
//  Created by Akbar Khan on 02/08/2022.
//

import UIKit

class UserViewController: UIViewController {

    // MARK: - IBOutlets, Variables & Constants
    
    @IBOutlet weak var tableView: UITableView!
    
    var data = ["Usman", "Asad", "Abdul Rahman", "Ali", "Mubashir", "Rohail", "Arooj"]
    
    // MARK: - UIViewController Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

// MARK: - UITableViewDelegate
extension UserViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UserTableViewCell.cellForTableView(tableView: tableView)
        cell.configureCell(data: data[indexPath.row])
        cell.delegate = self
        return cell
    }
}

// MARK: - UserTableViewCellDelegate
extension UserViewController: UserTableViewCellDelegate {
    
    func didTapAddFriendButton(cell: UserTableViewCell) {
        let indexPath = tableView.indexPath(for: cell)
        print("did tap on row number \(String(describing: indexPath?.row))")
    }
    
    func didTapRemoveButton(cell: UserTableViewCell) {
        let indexPath = tableView.indexPath(for: cell)
        print("did tap on row number \(String(describing: indexPath?.row))")
    }
}




//
//  UserTableViewCell.swift
//  DequeueReusableCell
//
//  Created by Akbar Khan on 02/08/2022.
//

import UIKit

protocol UserTableViewCellDelegate {
    func didTapAddFriendButton(cell: UserTableViewCell)
    func didTapRemoveButton(cell: UserTableViewCell)
}

class UserTableViewCell: UITableViewCell {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var mutualFriendsLabel: UILabel!
    
    var delegate: UserTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
        selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    class func cellForTableView(tableView: UITableView) -> UserTableViewCell {
        let kUserTableViewCell = "kUserTableViewCell"
        tableView.register(UINib(nibName: "UserTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: kUserTableViewCell)
        let cell = tableView.dequeueReusableCell(withIdentifier: kUserTableViewCell) as! UserTableViewCell
        return cell
    }
    func configureCell(data: String) {
        nameLabel.text = data
    }
    

    @IBAction func addFriendButtonTapped(_ sender: UIButton) {
        delegate?.didTapAddFriendButton(cell: self)
    }
    
    @IBAction func removeButtonTapped(_ sender: UIButton) {
        delegate?.didTapRemoveButton(cell: self)
    }
    
}

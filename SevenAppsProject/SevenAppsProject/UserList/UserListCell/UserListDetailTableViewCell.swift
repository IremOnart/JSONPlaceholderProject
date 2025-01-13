//
//  UserListDetailTableViewCell.swift
//  SevenAppsProject
//
//  Created by İrem Onart on 13.01.2025.
//

import UIKit

class UserListDetailTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var userNameLabel: UILabel!
    @IBOutlet private weak var userEmailLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func arrangeCell(userName: String, userEmail: String) {
        userNameLabel.text = userName
        userEmailLabel.text = userEmail
    }
    
}

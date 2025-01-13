//
//  UserListDetailViewController.swift
//  SevenAppsProject
//
//  Created by İrem Onart on 13.01.2025.
//

import UIKit

class UserListDetailViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var mailLabel: UILabel!
    @IBOutlet weak var phoneNumLabel: UILabel!
    @IBOutlet weak var websiteLabel: UILabel!
    
    var viewModel: UserListDetailViewModelProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpUI()
    }

    // UI elemanlarını yapılandır
    func setUpUI() {
        title = "Kullanıcı Detay Sayfası"
        
        nameLabel.text = viewModel?.userInfos?.name
        mailLabel.text = viewModel?.userInfos?.email
        phoneNumLabel.text = viewModel?.userInfos?.phone
        websiteLabel.text = viewModel?.userInfos?.website
    }

}

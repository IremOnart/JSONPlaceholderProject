//
//  UserListViewModelProtocol.swift
//  SevenAppsProject
//
//  Created by İrem Onart on 13.01.2025.
//

import Foundation
import SevenAppsAPI

enum UserListViewModelChange {
    case didError(String)
    case success
}

protocol UserListViewModelProtocol {
    var changeHandler: ((UserListViewModelChange) -> Void)? {get set}
    var service: SevenAppsServiceProtocol { get }
    var userInfos: [UserInfo] { get set }
    var numUserInfo: Int? { get }
    
    func fetchUserInfos()
    func numberOfUsers(for indexPath: IndexPath) -> UserInfo
}

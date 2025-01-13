//
//  UserListDetailViewModelProtocol.swift
//  SevenAppsProject
//
//  Created by İrem Onart on 13.01.2025.
//

import Foundation
import SevenAppsAPI

enum UserListDetailViewModelChange {
    case didError(String)
    case success
}

protocol UserListDetailViewModelProtocol {
    var changeHandler: ((UserListDetailViewModelChange) -> Void)? {get set}
    var userInfos: UserInfo? {get set}
}

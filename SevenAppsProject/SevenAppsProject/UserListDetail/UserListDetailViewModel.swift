//
//  UserListDetailViewModel.swift
//  SevenAppsProject
//
//  Created by İrem Onart on 13.01.2025.
//

import Foundation
import SevenAppsAPI

class UserListDetailViewModel: UserListDetailViewModelProtocol {
    var changeHandler: ((UserListDetailViewModelChange) -> Void)?
    var userInfos: UserInfo?
    
    init(userInfo: UserInfo?) {
        self.userInfos = userInfo
    }
    
    func emitChange(_ change: UserListDetailViewModelChange) {
        changeHandler?(change)
    }
}

//
//  UserListViewModel.swift
//  SevenAppsProject
//
//  Created by İrem Onart on 13.01.2025.
//

import Foundation
import SevenAppsAPI

class UserListViewModel: UserListViewModelProtocol {
    var changeHandler: ((UserListViewModelChange) -> Void)?
    var service: SevenAppsServiceProtocol = SevenAppsService()
    var userInfos: [UserInfo] = []
    var numUserInfo: Int? { userInfos.count }
    
    func fetchUserInfos() {
        service.fetchUsers { [weak self] userInfo, error in
            guard let self = self else { return }
            
            if let error = error {
                self.emit(change: .didError("Bir hata oluştu. Lütfen tekrar deneyin."))
            }
            
            if let userInfo = userInfo {
                self.userInfos = userInfo
                print(userInfos)
                self.emit(change: .success)
            }
        }
    }
    
    func numberOfUsers(for indexPath: IndexPath) -> UserInfo {
        return userInfos[indexPath.row]
    }
    
    private func emit(change: UserListViewModelChange) {
        changeHandler?(change)
    }
}

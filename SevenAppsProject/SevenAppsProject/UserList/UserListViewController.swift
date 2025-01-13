//
//  UserListViewController.swift
//  SevenAppsProject
//
//  Created by İrem Onart on 13.01.2025.
//

import UIKit

class UserListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: UserListViewModelProtocol = UserListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        attachViewModel()  // ViewModel'i bağla
        setupUI()  // UI yapılandırmasını yap
    }

    // ViewModel'e changeHandler ekleyerek verilerdeki değişiklikleri dinle
    private func attachViewModel() {
        viewModel.changeHandler = { [weak self] change in
            guard let self else { return }
            switch change  {
            case .didError(let message):
                showErrorPopup(message: message)
            case .success:
                print("success")
                DispatchQueue.main.async {
                    self.tableView.reloadData()  // Ana thread üzerinde tabloyu yeniden yükle
                }
            default:
                return
            }
        }
    }
    
    // UI elemanlarını yapılandır
    func setupUI() {
        tableView.delegate = self
        tableView.dataSource = self
        
        title = "Kullanıcı Listesi"
        viewModel.fetchUserInfos()
        let nib = UINib(nibName: "UserListDetailTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "UserListDetailTableViewCell")
    }
    
    // Hata mesajını gösteren popup
    func showErrorPopup(message: String, title: String = "Hata") {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Tamam", style: .default)
        alertController.addAction(okAction)
        
        self.present(alertController, animated: true, completion: nil)
    }

}

// TableView Delegate ve DataSource metodları
extension UserListViewController: UITableViewDelegate, UITableViewDataSource {
    
    // Kaç satır olacak?
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numUserInfo ?? 0  // ViewModel'den gelen kullanıcı sayısına göre satır sayısını döndür
    }
    
    // Her bir hücreyi yapılandır
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Hücreyi yeniden kullan
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "UserListDetailTableViewCell", for: indexPath) as? UserListDetailTableViewCell else {
            fatalError("UserListDetailTableViewCell is failed")
        }
        
        let userInfo = viewModel.userInfos[indexPath.row]
        cell.arrangeCell(userName: userInfo.name ?? "", userEmail: userInfo.email ?? "")
        return cell
    }
    
    // Hücreye tıklanıldığında yapılacak işlemi belirt
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Detaylı kullanıcı ekranına geçiş
        let vc = UserListDetailViewController()
        let vm = UserListDetailViewModel(userInfo: viewModel.userInfos[indexPath.row])  // Seçilen kullanıcı bilgilerini içeren ViewModel oluştur
        vc.viewModel = vm  // ViewController'a ViewModel'i ata
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

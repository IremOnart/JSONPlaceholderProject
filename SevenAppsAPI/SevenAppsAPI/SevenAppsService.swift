//
//  SevenAppsService.swift
//  SevenAppsAPI
//
//  Created by İrem Onart on 13.01.2025.
//

import Foundation

public protocol SevenAppsServiceProtocol {
    func fetchUsers(completion: @escaping ([UserInfo]?, Error?) -> Void)
}

public final class SevenAppsService: SevenAppsServiceProtocol {
    
    private var session: URLSession
    
    // `URLSession`'ı parametre olarak alacak yapıcı metod
    public init(session: URLSession = URLSession.shared) {
        self.session = session
    }
    
    // Kullanıcı listesini getiren servis fonksiyon
    public func fetchUsers(completion: @escaping ([UserInfo]?, Error?) -> Void) {
        let urlString = "https://jsonplaceholder.typicode.com/users"
        
        guard let url = URL(string: urlString) else {
            print("Geçersiz URL")
            completion(nil, nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Hata oluştu: \(error.localizedDescription)")
                completion(nil, error)
                return
            }
            
            guard let data = data else {
                print("Veri alınamadı")
                completion(nil, nil)
                return
            }
            
            do {
                let users = try JSONDecoder().decode([UserInfo].self, from: data)
                completion(users, nil)
            } catch let decodingError {
                print("Decode hatası: \(decodingError.localizedDescription)")
                completion(nil, decodingError)
            }
        }
        
        task.resume()
    }
}

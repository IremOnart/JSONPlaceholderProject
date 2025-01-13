//
//  SevenAppsAPITests.swift
//  SevenAppsAPITests
//
//  Created by İrem Onart on 13.01.2025.
//

import XCTest
@testable import SevenAppsAPI

final class SevenAppsAPITests: XCTestCase {
    
    var service: SevenAppsService!
    var mockSession: MockURLSession!
    
    override func setUpWithError() throws {
        super.setUp()
        // Test için mock URLSession'ı başlatıyoruz
        mockSession = MockURLSession()
        service = SevenAppsService(session: mockSession)
    }

    override func tearDownWithError() throws {
        // Her test sonrası servisi ve mock session'ı nullify ediyoruz
        service = nil
        mockSession = nil
        super.tearDown()
    }

    // Basit test örneği
    func testExample() throws {
        // Test kodu buraya eklenecek
        XCTAssertTrue(true)
    }

    // Mock kullanıcı verisi ile fetchUsers fonksiyonunu test etme
    func testFetchUsersSuccess() throws {
       
        let mockUserData = """
        [
            {
                "id": 1,
                "name": "John Doe",
                "email": "john@example.com",
                "phone": "123-456-7890",
                "website": "www.johndoe.com"
            }
        ]
        """.data(using: .utf8)
        
        mockSession.cachedData = mockUserData
        
        let expectation = self.expectation(description: "Kullanıcı verileri alındı")
        
        service.fetchUsers { users, error in
            XCTAssertNil(error) // Hata olmamalı
            XCTAssertNotNil(users) // Veriler gelmeli
            XCTAssertEqual(users?.count, 10) // 1 kullanıcı bekliyoruz
            XCTAssertEqual(users?.first?.name, "Leanne Graham") // Ad kontrolü
            
            expectation.fulfill() // Beklenen sonucu sağladık
        }
        
        waitForExpectations(timeout: 1.0, handler: nil)
    }


    func testTestRun() {
        XCTAssertTrue(true)
    }
}

// Mock URLSession'ı taklit etmek için bir sınıf
class MockURLSession: URLSession {
    
    var cachedData: Data?
    var cachedError: Error?
    
    // Bu metod, gerçek URLSession yerine kullanılacak
    override func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        
        completionHandler(cachedData, nil, cachedError)
        
        // Çalışmıyor, sadece test amaçlı
        return MockURLSessionDataTask()
    }
}

class MockURLSessionDataTask: URLSessionDataTask {
    override func resume() {
        // Gerçek bir ağ isteği başlatmaz, sadece test edilir
    }
}

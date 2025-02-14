//
//  GiveawaysRepositoryTests.swift
//  Data
//
//  Created by Mostafa Mahmoud on 14/02/2025.
//

import XCTest
@testable import Data

final class GiveawaysRepositoryTest: XCTestCase {

    var repository: DefaultGetGiveawaysRepository!
    var mockRemoteAPI: MockGetGiveawaysRemoteAPI!
    
    override func setUp() {
        super.setUp()
        mockRemoteAPI = MockGetGiveawaysRemoteAPI()
        repository = DefaultGetGiveawaysRepository(remote: mockRemoteAPI)
    }
    
    override func tearDown() {
        repository = nil
        mockRemoteAPI = nil
        super.tearDown()
    }
    
    func testFetchGetGiveaways_Success() async throws {
        
        let result = try await repository.fetchGetGiveaways(queryParameter: "PC")
        
        XCTAssertEqual(result.count, 1)
    }
    
    func testFetchGetGiveaways_Failure() async {
        mockRemoteAPI.shouldThrowError = true
        
        do {
            _ = try await repository.fetchGetGiveaways(queryParameter: "PC")
            XCTFail("Expected an error but got success")
        } catch {
            XCTAssertNotNil(error)
        }
    }
}

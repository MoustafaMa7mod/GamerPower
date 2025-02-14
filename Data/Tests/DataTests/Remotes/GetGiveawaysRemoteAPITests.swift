//
//  GetGiveawaysRemoteAPITests.swift
//  Data
//
//  Created by Mostafa Mahmoud on 14/02/2025.
//

import XCTest
import Moya
@testable import Data

final class GetGiveawaysRemoteAPITests: XCTestCase {

    var remoteAPI: DefaultGetGiveawaysRemoteAPI!
    var mockNetworkService: MockNetworkService!
    
    override func setUp() {
        super.setUp()
        mockNetworkService = MockNetworkService()
        remoteAPI = DefaultGetGiveawaysRemoteAPI(networkService: mockNetworkService)
    }
    
    override func tearDown() {
        remoteAPI = nil
        mockNetworkService = nil
        super.tearDown()
    }
    
    func testFetchGetGiveaways_Success() async throws {

        mockNetworkService.mockResponse = mockNetworkService?.makeMockResponse()
        
        let result = try await remoteAPI.fetchGetGiveaways(queryParameter: nil)
        
        XCTAssertEqual(result.count, 2)
    }
    
    func testFetchGetGiveaways_Failure() async {
          mockNetworkService.mockError = NSError(
            domain: "TestError",
            code: 0, userInfo: nil
          )
          
          do {
              let _ = try await remoteAPI.fetchGetGiveaways(queryParameter: "pc")
              XCTFail("Expected error but got success")
          } catch {
              XCTAssertNotNil(error, "Error should not be nil")
          }
      }
    
    func testFetchGetGiveawaysFailure_WhenQueryParameterNotValid() async {
          mockNetworkService.mockError = NSError(
            domain: "TestError",
            code: 0, userInfo: nil
          )
          
          do {
              let _ = try await remoteAPI.fetchGetGiveaways(
                queryParameter: "epicgamesstore"
              )
              XCTFail("Expected error but got success")
          } catch {
              XCTAssertNotNil(error, "Error should not be nil")
          }
      }
}

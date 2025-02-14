

import XCTest
import Moya
@testable import NetworkLayer

final class NetworkServiceTests: XCTestCase {
  
    var networkService: NetworkService!
    var mockProvider: MoyaProvider<API>!
    
    override func setUp() {
        super.setUp()
        
        mockProvider = MoyaProvider<API>(
            endpointClosure: mockEndpointClosure(),
            stubClosure: MoyaProvider.immediatelyStub
        )
        networkService = NetworkService(baseURL: "https://example.com")
        networkService.provider = mockProvider
    }
    
    override func tearDown() {
        networkService = nil
        mockProvider = nil
        super.tearDown()
    }
    
    func testFetchData_Success() async throws {
        let parameters: [String: Any] = [:]
        
        do {
            let response: MockResponse = try await networkService.fetchData(requestParameters: parameters)
            XCTAssertEqual(response.id, 1)
        } catch {
            XCTFail("Expected success but got error: \(error)")
        }
    }
    
    func testFetchData_Failure() async {
        networkService.provider = mockFailingProvider()
        
        let parameters: [String: Any] = [:]
        
        do {
            let _: MockResponse = try await networkService.fetchData(requestParameters: parameters)
            XCTFail("Expected failure but got success")
        } catch {
            XCTAssertNotNil(error, "Error should not be nil")
        }
    }

}

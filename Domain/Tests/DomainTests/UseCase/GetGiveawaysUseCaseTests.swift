//
//  GetGiveawaysUseCaseTests.swift
//  Domain
//
//  Created by Mostafa Mahmoud on 15/02/2025.
//

import XCTest
@testable import Domain

final class GetGiveawaysUseCaseTests: XCTestCase {

    var useCase: DefaultGetGiveawaysUseCase!
    var mockRepository: MockGiveawaysRepository!
    
    override func setUp() {
        super.setUp()
        mockRepository = MockGiveawaysRepository()
        useCase = DefaultGetGiveawaysUseCase(repository: mockRepository)
    }
    
    override func tearDown() {
        useCase = nil
        mockRepository = nil
        super.tearDown()
    }
    
    func testExecute_Success() async throws {

        let result = try await useCase.execute(queryParameter: "PC")
        XCTAssertEqual(result.count, 2)
    }
    
    func testExecute_Failure() async {
        
        mockRepository.shouldThrowError = true
        
        do {
            _ = try await useCase.execute(queryParameter: "PC")
            XCTFail("Expected an error but got success")
        } catch {
            XCTAssertNotNil(error)
        }
    }
}

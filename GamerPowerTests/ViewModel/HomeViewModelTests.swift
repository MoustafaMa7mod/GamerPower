//
//  HomeViewModelTests.swift
//  GamerPowerTests
//
//  Created by Mostafa Mahmoud on 15/02/2025.
//

import XCTest
@testable import GamerPower

final class HomeViewModelTests: XCTestCase {

    private var viewModel: DefaultHomeViewModel!
    private var mockUseCase: MockGetGiveawaysUseCase!
    
    override func setUp() {
        super.setUp()
        mockUseCase = MockGetGiveawaysUseCase()
        viewModel = DefaultHomeViewModel(useCase: mockUseCase, coordinator: nil)
    }
    
    override func tearDown() {
        viewModel = nil
        mockUseCase = nil
        super.tearDown()
    }
    
    func testFetchHomeData_Success() async {
        do {
            try await viewModel.fetchHomeData(filterData: false)
            
            XCTAssertFalse(viewModel.giveawayItems.isEmpty)
        } catch {
            XCTFail("Unexpected error: \(error)")
        }
    }
    
    func testFetchHomeData_Failure() async {
        mockUseCase.shouldThrowError = true
        
        do {
            try await viewModel.fetchHomeData(
                filterData: false,
                queryParameter: "epicgamesstore"
            )
            
            XCTFail("Expected an error but got success")
        } catch let error {
            XCTAssertEqual(error.localizedDescription, "Failed to fetch giveaways")
        }
    }
    
    func testLoadHomeCategories_FilterDataTrue_ShouldDoNothing() {
        let initialCategories = viewModel.homeCategories

        viewModel.loadHomeCategories(filterData: true)
        
        XCTAssertEqual(viewModel.homeCategories, initialCategories)
    }
    
    func testLoadHomeCategories_NotAddedMoreCategories_WhenFetchDataAgain() async {
        do {
            try await viewModel.fetchHomeData(filterData: false)
            XCTAssertTrue(viewModel.homeCategories.contains("PC"))
            
            try await viewModel.fetchHomeData(filterData: true)
            XCTAssertTrue(viewModel.homeCategories.count == 4)
        } catch {
            XCTFail("Unexpected error: \(error)")
        }
    }
    
    func testLoadHomeCategories_LessThanMaxCategories_ShouldAddAll() async {
        do {
            try await viewModel.fetchHomeData(filterData: false)
            
            XCTAssertTrue(viewModel.homeCategories.contains("PC"))
            XCTAssertTrue(viewModel.homeCategories.contains("Steam"))

        } catch {
            XCTFail("Unexpected error: \(error)")
        }
    }
    
    
    private func mockGiveawayItemPresentationModel() -> [GiveawayItemPresentationModel] {
        mockUseCase.makeMockResponse().map { GiveawayItemPresentationModel(model: $0) }
    }
}

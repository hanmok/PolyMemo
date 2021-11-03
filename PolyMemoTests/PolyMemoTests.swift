//
//  PolyMemoTests.swift
//  PolyMemoTests
//
//  Created by Mac mini on 2021/11/02.
//

import XCTest
import CoreData
@testable import PolyMemo

class PolyMemoTests: XCTestCase {

    var coreDataStack: CoreDataTestStack!
    var polyMemoManager: PolyMemoManager!
    
    
    override func setUp() {
        super.setUp()
        
        coreDataStack = CoreDataTestStack()
        polyMemoManager = PolyMemoManager(mainContext: coreDataStack.mainContext)
    }
    
    func test_create_category() {
        polyMemoManager.createCategory(with: "House")
        let category = polyMemoManager.fetchCategory(with: "House")!
        
        XCTAssertEqual("House", category.title)
    }
    
    func test_update_category() {
        let category = polyMemoManager.createCategory(with: "House")!
        category.title = "MyHouse"
        
        polyMemoManager.updateCategory(category: category)
        let updated = polyMemoManager.fetchCategory(with: "MyHouse")!
        
        XCTAssertNil(polyMemoManager.fetchCategory(with:"House"))
        XCTAssertEqual("MyHouse", updated.title)
    }
    
    func test_delete_category() {
        let categoryA = polyMemoManager.createCategory(with: "A")!
        let categoryB = polyMemoManager.createCategory(with: "B")!
        let categoryC = polyMemoManager.createCategory(with: "C")!
        
        polyMemoManager.deleteCategory(category: categoryB)
        
        let categories = polyMemoManager.fetchCategories()!
        
        XCTAssertEqual(categories.count, 2)
        XCTAssertTrue(categories.contains(categoryA))
        XCTAssertTrue(categories.contains(categoryB))
    }
    
    
    
    
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

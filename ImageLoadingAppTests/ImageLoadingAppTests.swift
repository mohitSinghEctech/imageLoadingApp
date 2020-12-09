//
//  ImageLoadingAppTests.swift
//  ImageLoadingAppTests
//
//  Created by Mohit Kumar Singh on 08/12/20.
//

import XCTest
@testable import ImageLoadingApp

class ImageLoadingAppTests: XCTestCase {
    var sut: PhotosInteractor!

    override func setUpWithError() throws {
        super.setUp()
        sut = PhotosInteractor()
    }

    override func tearDownWithError() throws {
        sut = nil
        super.tearDown()
    }
    
    // Sample Test succeeds when target is given 10 otherwise fails
    
    func testSumIsCalculated() {
        // 1. given
        let target = 10
        
        // 2. when
        sut.calculateSum(a: 4, b: 6)
        
        // 3. then
        XCTAssertEqual(target, sut.total, "Incorrect Answer")
    }

}

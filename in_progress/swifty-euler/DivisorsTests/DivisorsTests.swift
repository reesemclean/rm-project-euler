//
//  DivisorsTests.swift
//  DivisorsTests
//
//  Created by Reese McLean on 12/13/15.
//  Copyright © 2015 Reese McLean. All rights reserved.
//

import XCTest
@testable import Divisors

class DivisorsTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testDivisorsOfPerfectSquare() {
        
        let list = listDivisors(16)
        XCTAssertEqual(list, [1, 2, 4, 8, 16])

    }
    
    func testDivisorsOfOne() {
        let list = listDivisors(1)
        XCTAssertEqual(list, [1])
    }
    
    func testDivisorsOfTwo() {
        let list = listDivisors(2)
        XCTAssertEqual(list, [1, 2])
    }
    
    func testDivisorOf17() {
        let list = listDivisors(17)
        XCTAssertEqual(list, [1, 17])
    }
    
    func testProperDivisorsOf17() {
        let list = listProperDivisors(17)
        XCTAssertEqual(list, [1])
    }
    
    func testProperDivisorsOf16() {
        let list = listProperDivisors(16)
        XCTAssertEqual(list, [1, 2, 4, 8])
    }
}

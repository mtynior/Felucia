//
//  FeluciaTestRGBAFloat.swift
//  Felucia
//
//  Created by Michał Tynior on 20/10/15.
//  Copyright © 2015 Michał Tynior. All rights reserved.
//

import XCTest
@testable import Felucia

class FeluciaTestsRGBAFloat: XCTestCase {
    
    func test_ShouldReturnTupleWithRGBACompoments() {
        let expectedTuple: (r: Float, g: Float, b: Float, a: Float) = (1.0, 0.75, 0.5, 0.25)
        let color = UIColor(red: 1.0, green: 0.75, blue: 0.5, alpha: 0.25)
        
        let actualTuple = color.rgbaf()
        
        let areTuplesEquels = actualTuple == expectedTuple
        XCTAssertTrue(areTuplesEquels, "Should return touple with float rgba components")
    }
    
    func test_ShouldReturnArrayWithRGBACompoments() {
        let expectedArray: [Float] = [1.0, 0.75, 0.5, 0.25]
        let color = UIColor(red: 1.0, green: 0.75, blue: 0.5, alpha: 0.25)
        
        let actualArray = color.rgbafArray()
        XCTAssertEqual(actualArray, expectedArray, "Should return array with color components")
    }

}

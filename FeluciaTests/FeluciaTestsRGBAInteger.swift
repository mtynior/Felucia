//
//  FeluciaTests.swift
//  FeluciaTests
//
//  Created by Michał Tynior on 19/10/15.
//  Copyright © 2015 Michał Tynior. All rights reserved.
//

import XCTest
@testable import Felucia

class FeluciaTestsRGBAInteger: XCTestCase {
    
    func test_ShouldCreateFromIntegerRGBA() {
        let expectedColor = UIColor(red: 1.0, green: 0.5, blue: 0.25, alpha: 0.125)
        
        let actualColor = UIColor(r: 255, g: 128, b: 64, a: 32)
                
        // we can't use standard NSObject's isEqual() because it is using floats for comaprison and we cannot set accuracy :(
        let areColorEqual = (actualColor == expectedColor)
        XCTAssertTrue(areColorEqual, "Should create from Integer RGBA")
    }
    
    func test_ComponentsShoulfFallbackToZeroWheCreatingWithNegativeParameters() {
        let expectedColor = UIColor(r: 0, g: 0, b: 0, a: 0)

        let actualColor = UIColor(r: -90, g: -128, b: -64, a: -32)
        
        XCTAssertEqual(actualColor, expectedColor, "omponent should be trucanted to value between <0, 255>")
    }
    
    func test_ComponentsShouldFallbackToMaxValueWheCreatingWithBiggerParameters() {
        let expectedColor = UIColor(r: 255, g: 255, b: 255, a: 255)
        
        let actualColor = UIColor(r: 300, g: 256, b: 290, a: 1000)
        
        XCTAssertEqual(actualColor, expectedColor, "omponent should be trucanted to value between <0, 255>")
    }
    
    func test_ShouldReturnTupleWithRGBACompoments() {
        let expectedTuple = (r: 255, g: 128, b: 64, a: 32)
        let color = UIColor(r: 255, g: 128, b: 64, a: 32)
        
        let actualTuple = color.rgba()
        
        let areTuplesEquels = actualTuple == expectedTuple
        XCTAssertTrue(areTuplesEquels, "Should return touple with rgba components")
    }
    
    func test_ShouldReturnArrayWithRGBACompoments() {
        let expectedArray = [255, 128, 64, 32]
        let color = UIColor(r: 255, g: 128, b: 64, a: 32)
        
        let actualArray = color.rgbaArray()
        XCTAssertEqual(actualArray, expectedArray, "Should return array with color components")
    }
    
}

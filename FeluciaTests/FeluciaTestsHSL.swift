//
//  FeluciaTestsHSL.swift
//  Felucia
//
//  Created by Michał Tynior on 05/12/15.
//  Copyright © 2015 Michał Tynior. All rights reserved.
//

import Foundation

import XCTest
@testable import Felucia

class FeluciaTestsHSL: XCTestCase {
    
    func test_ShouldCreateColorFromNormalizedHSLCompoents() {
        
        let expectedColor = UIColor(hexARGBString: "#64A089")!
        
        let actualColor = UIColor(h: 157.0/360.0, s: 0.24, l: 0.51)
        
        let areColorEqual = actualColor == expectedColor
                
        XCTAssertTrue(areColorEqual, "Should create color from normalized HSL comeponents")
    }
    
    func test_ShouldCreateColorFromHSLCompoents() {
        
        let expectedColor = UIColor(hexARGBString: "#64A089")!
        
        let actualColor = UIColor(h: 157.0, s: 24, l: 51)
        
        let areColorEqual = actualColor == expectedColor
        
        XCTAssertTrue(areColorEqual, "Should create color from HSL comeponents")
    }
    
    
    func test_ShouldReturnHSLComponents() {
        let expectedComponents: (Float, Float, Float, Float) = (157.0/360.0, 0.24, 0.51, 1.0)
        
        let actualCompoents = UIColor(hexARGBString: "#64A089")!.hsla()
        
        AssertEqualWithAccuracy(actualCompoents, expectedComponents, 0.001, "Should return HSL components")
    }
    
    
    func test_ShouldReturnArrayOfHSLComponents() {
        let expectedComponents: [Float] = [157.0/360.0, 0.24, 0.51, 1.0]
        
        let actualCompoents = UIColor(hexARGBString: "#64A089")!.hslaArray()
        
        AssertEqualWithAccuracy(actualCompoents, expectedComponents, 0.001, "Should return HSL components")
    }
}

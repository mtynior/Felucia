//
//  FeluciaTestsHexColor.swift
//  Felucia
//
//  Created by Michał Tynior on 29/11/15.
//  Copyright © 2015 Michał Tynior. All rights reserved.
//

import XCTest
@testable import Felucia

class FeluciaTestsHexColor: XCTestCase {

    func test_ShouldCreateColorFromHex3String() {
        let expectedColor = UIColor(r: 255, g: 187, b: 204, a: 255)
        
        let actualColor = UIColor(hexARGBString: "#FBC")
        
        XCTAssertEqual(actualColor, expectedColor,  "Should create from hex3 ARGB String")
    }
    
    func test_ShouldCreateColorFromHex6String() {
        let expectedColor = UIColor(r: 255, g: 128, b: 64, a: 255)

        let actualColor = UIColor(hexARGBString: "#FF8040")
        
        XCTAssertEqual(actualColor, expectedColor,  "Should create from hex6 ARGB String")
    }
    
    func test_ShouldCreateColorFromHex8String() {
        let expectedColor = UIColor(r: 255, g: 187, b: 204, a: 128)

        let actualColor = UIColor(hexARGBString: "#80FFBBCC")
        
        XCTAssertEqual(actualColor, expectedColor,  "Should create from hex8 ARGB String")
    }
    
    func test_ShouldCreateColorForHexWithoutLeadingHash() {
        let expectedColor = UIColor(r: 255, g: 187, b: 204, a: 128)
        
        let actualColor = UIColor(hexARGBString: "80FFBBCC")
        
        XCTAssertEqual(actualColor, expectedColor,  "Should create color for hex without leading hash")
    }
    
    func test_ShouldReturnNilForInvalidHexString() {
        let actualColor = UIColor(hexARGBString: "#FBCFBCFBCFCB")
        
        XCTAssertNil(actualColor, "Should return black color from invalid ARGB String")
    }
    
}

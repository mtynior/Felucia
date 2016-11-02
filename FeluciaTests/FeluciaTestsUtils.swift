//
//  FeluciaTestsUtils.swift
//  Felucia
//
//  Created by Michał Tynior on 26/10/15.
//  Copyright © 2015 Michał Tynior. All rights reserved.
//

import XCTest
@testable import Felucia


class FeluciaTestsUtils: XCTestCase {
    
    func test_ShouldCreateGrayscaleFromOtherColor() {
        let expectedComponents: (r: Int, g: Int, b: Int, a: Int) = (106, 106, 106, 255)
        
        let grayscaleColor = UIColor(r: 67, g: 122, b: 134).grayscale()
        let actualComponents = grayscaleColor.rgba()

        let areTuplesEquels = actualComponents == expectedComponents
        XCTAssertTrue(areTuplesEquels, "Should create grayscale color from other one")
    }
    
    func test_ShouldReturnsRandomColor() {
        let color1 = UIColor.randomColor().rgba()
        let color2 = UIColor.randomColor().rgba()
        
        let areColorsDifferent = color1 != color2
        XCTAssertTrue(areColorsDifferent, "Should return different colors")
    }
}


extension FeluciaTestsUtils {
    
    func test_ShouldLightenColorWithDefaultValue() {
        let expectedColor = UIColor(hexARGB: "#ff3333")!
        
        let lightenColor = UIColor(hexARGB:"#f00")!.lighten()
        
        let areEqual = expectedColor == lightenColor
        
        XCTAssertTrue(areEqual, "Shoud lighten color by default value")
    }
    
    func test_ColorLightenBy100PercentShouldBecomeWhite() {
        let expectedColor = UIColor.white
        
        let lightenColor = UIColor(hexARGB:"#f00")!.lighten(1.0)
        
        let areEqual = expectedColor == lightenColor
        
        XCTAssertTrue(areEqual, "Color lightened by 100% should become white")
    }
    
    func test_ShouldDarkenColorWithDefaultValue() {
        let expectedColor = UIColor(hexARGB: "#cc0000")!
        
        let darkenColor = UIColor(hexARGB:"#f00")!.darken()
        
        let areEqual = expectedColor == darkenColor
        
        XCTAssertTrue(areEqual, "Shoud darken color by default value")
    }
    
    func test_ColorDarkenBy100PercentShouldBecomeBlack() {
        let expectedColor = UIColor.black
        
        let darkenColor = UIColor(hexARGB:"#f00")!.darken(1.0)
        
        let areEqual = expectedColor == darkenColor
        
        XCTAssertTrue(areEqual, "Color darken by 100% should become white")
    }
    
}

extension FeluciaTestsUtils {
    
    func test_ShouldReturnWhiteAsComplementaryColorToBlack() {
        let expectedComponents = (r: 255, g: 255, b: 255, a: 255) // expected color is white
        
        let invertedColor = UIColor.black.complementaryColor()
        let actualComponents = invertedColor.rgba()
        
        let areTuplesEquels = actualComponents == expectedComponents
        XCTAssertTrue(areTuplesEquels, "Should return #FFFFFF as complementary color to #000000")
    }
    
    func test_ShouldReturnBlackAsComplementaryColorToWhite() {
        let expectedComponents = (r: 0, g: 0, b: 0, a: 255) // expected color is black
        
        let invertedColor = UIColor.white.complementaryColor()
        let actualComponents = invertedColor.rgba()
        
        let areTuplesEquels = actualComponents == expectedComponents
        XCTAssertTrue(areTuplesEquels, "Should return #000000 as complementary color to #FFFFFF")
    }
    
}

extension FeluciaTestsUtils {
    
    func test_IsLightShouldReturnTrueForWhiteColor() {
        let color = UIColor.white
        
        let actualResult = color.isLight()
        
        XCTAssertTrue(actualResult, "isLight() should return true for white color")
    }
    
    func test_IsLightShouldReturnFalseForBlackColor() {
        let color = UIColor.black
        
        let actualResult = color.isLight()
        
        XCTAssertFalse(actualResult, "isLight() should return false for white color")
    }
    
    func test_IsDarkShouldReturnTrueForBlackColor() {
        let color = UIColor.black
        
        let actualResult = color.isDark()
        
        XCTAssertTrue(actualResult, "isDark() should return true for black color")
    }
    
    func test_IsDarkShouldReturnFalseForWhiteColor() {
        let color = UIColor.white
        
        let actualResult = color.isDark()
        
        XCTAssertFalse(actualResult, "isDark() should return false for white color")
    }
    
}

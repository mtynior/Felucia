//
//  FeluciaTestsCMYK.swift
//  Felucia
//
//  Created by Michał Tynior on 26/10/15.
//  Copyright © 2015 Michał Tynior. All rights reserved.
//

import XCTest
@testable import Felucia

class FeluciaTestsCMYK: XCTestCase {
    
    func test_ShouldCreateColorFromCMYK() {
        let expectedTuple : (r: Float, g: Float, b: Float, a: Float) = (0.5, 0.25, 0.125, 1.0)
        let accuracy: Float = 0.005
        
        let color = UIColor(cyan: 0, magneta: 0.5, yellow: 0.75, black: 0.498)
        
        let actualTuple = color.rgbaf()
        
        AssertEqualWithAccuracy(actualTuple, expectedTuple, accuracy, "Should rcreate color from cmyk compnents")
    }
    
    func test_ShouldReturnTupleWithCMYKCompoments() {
        let expectedTuple : (c: Float, m: Float, y: Float, k: Float) = (0, 0.5, 0.75, 0.498)
        let accuracy: Float = 0.001
        
        let color = UIColor(cyan: 0, magneta: 0.5, yellow: 0.75, black: 0.498)
        
        let actualTuple = color.cmyk()
        
        AssertEqualWithAccuracy(actualTuple, expectedTuple, accuracy, "Should return touple with cmyk components")
    }
    
    func test_ShouldReturnTupleWithCMYKCompomentsFromRGBAColor() {
        let expectedTuple : (c: Float, m: Float, y: Float, k: Float) = (0.711, 0.533, 0.0, 0.118)
        let accuracy: Float = 0.001
        
        let color = UIColor(r: 65, g: 105, b: 225, a: 255)
        
        let actualTuple = color.cmyk()
        
        AssertEqualWithAccuracy(actualTuple, expectedTuple, accuracy, "Should return touple with cmyk components from rgba color")
    }
    
    func test_ShouldReturnArrayWithCMYKCompoments() {
        let expectedArray: [Float] = [0, 0.5, 0.75, 0.498]
        let accuracy: Float = 0.001
        
        let color = UIColor(cyan: 0, magneta: 0.5, yellow: 0.75, black: 0.498)
        
        let actualArray = color.cmykArray()
        
        AssertEqualWithAccuracy(actualArray, expectedArray, accuracy, "Should return array with cmyk compoments")
    }
    
}

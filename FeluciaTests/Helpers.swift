//
//  Helpers.swift
//  Felucia
//
//  Created by Michał Tynior on 01/12/15.
//  Copyright © 2015 Michał Tynior. All rights reserved.
//

import Foundation
import XCTest

public func AssertEqualWithAccuracy<T:FloatingPoint>(_ expression1:(T, T, T, T), _ expression2:(T, T, T, T), _ accuracy: T, _ message: String = "", _ file: StaticString =  #file, _ line: UInt = #line) {
    
    XCTAssertEqualWithAccuracy(expression1.0, expression2.0, accuracy: accuracy, message, file:file, line:line)
    XCTAssertEqualWithAccuracy(expression1.1, expression2.1, accuracy: accuracy, message, file:file, line:line)
    XCTAssertEqualWithAccuracy(expression1.2, expression2.2, accuracy: accuracy, message, file:file, line:line)
    XCTAssertEqualWithAccuracy(expression1.3, expression2.3, accuracy: accuracy, message, file:file, line:line)
}

public func AssertEqualWithAccuracy<T:FloatingPoint>(_ expression1:[T], _ expression2:[T], _ accuracy: T, _ message: String = "", _ file: StaticString =  #file, _ line: UInt = #line) {
    
    guard expression1.count == expression2.count else {
        XCTFail(message)
        return
    }
    
    for i in 0..<expression1.count {
        XCTAssertEqualWithAccuracy(expression1[i], expression2[i], accuracy: accuracy, message,file:file, line:line)
    }
}

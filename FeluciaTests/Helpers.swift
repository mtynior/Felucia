//
//  Helpers.swift
//  Felucia
//
//  Created by Michał Tynior on 01/12/15.
//  Copyright © 2015 Michał Tynior. All rights reserved.
//

import Foundation
import XCTest

func == <A : Equatable, B : Equatable>(lhs: (A, B), rhs: (A, B)) -> Bool {
    return (lhs.0 == rhs.0) && (lhs.1 == rhs.1)
}

func != <A : Equatable, B : Equatable>(lhs: (A, B), rhs: (A, B)) -> Bool {
    return !(lhs == rhs)
}

func == <A : Equatable, B : Equatable, C : Equatable>(lhs: (A, B, C), rhs: (A, B, C)) -> Bool {
    return (lhs.0 == rhs.0) && (lhs.1 == rhs.1) && (lhs.2 == rhs.2)
}

func != <A : Equatable, B : Equatable, C : Equatable>(lhs: (A, B, C), rhs: (A, B, C)) -> Bool {
    return !(lhs == rhs)
}


func == <A : Equatable, B : Equatable, C : Equatable, D : Equatable>(lhs: (A, B, C, D), rhs: (A, B, C, D)) -> Bool {
    return (lhs.0 == rhs.0) && (lhs.1 == rhs.1) && (lhs.2 == rhs.2) && (lhs.3 == rhs.3)
}

func != <A : Equatable, B : Equatable, C : Equatable, D : Equatable>(lhs: (A, B, C, D), rhs: (A, B, C, D)) -> Bool {
    return !(lhs == rhs)
}


func AssertEqualWithAccuracy<T:FloatingPointType>(expression1:(T, T, T, T), _ expression2:(T, T, T, T), _ accuracy: T, _ message: String = "", file: String =  __FILE__, line: UInt = __LINE__) {
    
    XCTAssertEqualWithAccuracy(expression1.0, expression2.0, accuracy: accuracy, message,file:file, line:line)
    XCTAssertEqualWithAccuracy(expression1.1, expression2.1, accuracy: accuracy, message,file:file, line:line)
    XCTAssertEqualWithAccuracy(expression1.2, expression2.2, accuracy: accuracy, message,file:file, line:line)
    XCTAssertEqualWithAccuracy(expression1.3, expression2.3, accuracy: accuracy, message,file:file, line:line)
}

func AssertEqualWithAccuracy<T:FloatingPointType>(expression1:[T], _ expression2:[T], _ accuracy: T, _ message: String = "", file: String =  __FILE__, line: UInt = __LINE__) {
    
    guard expression1.count == expression2.count else {
        XCTFail(message)
        return
    }
    
    for(var i = 0; i < expression1.count; ++i){
        XCTAssertEqualWithAccuracy(expression1[i], expression2[i], accuracy: accuracy, message,file:file, line:line)
    }
}
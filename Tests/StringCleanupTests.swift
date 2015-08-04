//
//  StringCleanupTests.swift
//  EPICStringCleanups
//
//  Created by Danny Bravo on 04/08/2015.
//  Copyright © 2015 EPIC. All rights reserved.
//

import XCTest

class StringCleanupTests: XCTestCase {

    func testTrimmedString() {
        let string1 = "hello world"
        let string2 = " hello world"
        let string3 = "hello world "
        let string4 = "\n  hello world"
        let string5 = "\nhello world  "
        let string6 = "   hello world"
        let string7 = "hello world   "
        let string8 = " hello world\n   "
        let string9 = "   hello world\n "
        
        XCTAssertEqual(string1.trimmedString, "hello world")
        XCTAssertEqual(string2.trimmedString, "hello world")
        XCTAssertEqual(string3.trimmedString, "hello world")
        XCTAssertEqual(string4.trimmedString, "hello world")
        XCTAssertEqual(string5.trimmedString, "hello world")
        XCTAssertEqual(string6.trimmedString, "hello world")
        XCTAssertEqual(string7.trimmedString, "hello world")
        XCTAssertEqual(string8.trimmedString, "hello world")
        XCTAssertEqual(string9.trimmedString, "hello world")
    }
    
    func testNormalizedString() {
        let string1 = "Alpha"
        let string2 = "omega"
        let string3 = "įNDigo"
        let string4 = "2 two"
        let string5 = "    3 three\n  "
        let string6 = " 13 thirteen\n"
        let string7 = "êcho"
        let string8 = "Ècho"
        let string9 = "   echo"
        let string10 = "@lpha"
        let string11 = "+ plus"
        let string12 = " + plus"
        let string13 = "  + plus"
        let string14 = ""
        
        XCTAssertEqual(string1.normalizedString, "alpha")
        XCTAssertEqual(string2.normalizedString, "omega")
        XCTAssertEqual(string3.normalizedString, "indigo")
        XCTAssertEqual(string4.normalizedString, "2 two")
        XCTAssertEqual(string5.normalizedString, "3 three")
        XCTAssertEqual(string6.normalizedString, "13 thirteen")
        XCTAssertEqual(string7.normalizedString, "echo")
        XCTAssertEqual(string8.normalizedString, "echo")
        XCTAssertEqual(string9.normalizedString, "echo")
        XCTAssertEqual(string10.normalizedString, "@lpha")
        XCTAssertEqual(string11.normalizedString, "+ plus")
        XCTAssertEqual(string12.normalizedString, "+ plus")
        XCTAssertEqual(string13.normalizedString, "+ plus")
        XCTAssertEqual(string14.normalizedString, "")
    }
    
    func testCleanString() {
        var string = "\n\n This   is   a     string with  lots of    double spaces.    \n\n   And a newline.\n  Or two.    \n"
        XCTAssertEqual(string.cleanString, "This is a string with lots of double spaces.\nAnd a newline.\nOr two.")
    }
    
    func testStringContainingOnlyCharactersInSet() {
        let string1 = "this contains letters and numbers 1234567890."
        let string2 = "This Contains Only Letters."
        let string3 = "TCOL"

        XCTAssertEqual(string1.stringContainingOnlyCharactersInSet(NSCharacterSet.decimalDigitCharacterSet()), "1234567890")
        XCTAssertEqual(string2.stringContainingOnlyCharactersInSet(NSCharacterSet.uppercaseLetterCharacterSet()), "TCOL")
        XCTAssertEqual(string3.stringContainingOnlyCharactersInSet(NSCharacterSet.uppercaseLetterCharacterSet()), "TCOL")

    }
    
    func testTrim() {
        var string1 = "hello world"
        var string2 = " hello world"
        var string3 = "hello world "
        var string4 = "\n  hello world"
        var string5 = "\nhello world  "
        var string6 = "   hello world"
        var string7 = "hello world   "
        var string8 = " hello world\n   "
        var string9 = "   hello world\n "
        
        string1.trim()
        string2.trim()
        string3.trim()
        string4.trim()
        string5.trim()
        string6.trim()
        string7.trim()
        string8.trim()
        string9.trim()
        
        XCTAssertEqual(string1, "hello world")
        XCTAssertEqual(string2, "hello world")
        XCTAssertEqual(string3, "hello world")
        XCTAssertEqual(string4, "hello world")
        XCTAssertEqual(string5, "hello world")
        XCTAssertEqual(string6, "hello world")
        XCTAssertEqual(string7, "hello world")
        XCTAssertEqual(string8, "hello world")
        XCTAssertEqual(string9, "hello world")
    }
    
    func testNormalize() {
        var string1 = "Alpha"
        var string2 = "omega"
        var string3 = "įNDigo"
        var string4 = "2 two"
        var string5 = "    3 three\n  "
        var string6 = " 13 thirteen\n"
        var string7 = "êcho"
        var string8 = "Ècho"
        var string9 = "   echo"
        var string10 = "@lpha"
        var string11 = "+ plus"
        var string12 = " + plus"
        var string13 = "  + plus"
        var string14 = ""
        
        string1.normalize()
        string2.normalize()
        string3.normalize()
        string4.normalize()
        string5.normalize()
        string6.normalize()
        string7.normalize()
        string8.normalize()
        string9.normalize()
        string10.normalize()
        string11.normalize()
        string12.normalize()
        string13.normalize()
        string14.normalize()
        
        XCTAssertEqual(string1, "alpha")
        XCTAssertEqual(string2, "omega")
        XCTAssertEqual(string3, "indigo")
        XCTAssertEqual(string4, "2 two")
        XCTAssertEqual(string5, "3 three")
        XCTAssertEqual(string6, "13 thirteen")
        XCTAssertEqual(string7, "echo")
        XCTAssertEqual(string8, "echo")
        XCTAssertEqual(string9, "echo")
        XCTAssertEqual(string10, "@lpha")
        XCTAssertEqual(string11, "+ plus")
        XCTAssertEqual(string12, "+ plus")
        XCTAssertEqual(string13, "+ plus")
        XCTAssertEqual(string14, "")
    }
    
    func testCleanupToContainOnlyCharactersInSet() {
        var string1 = "this contains letters and numbers 1234567890."
        var string2 = "This Contains Only Letters."
        
        string1.cleanupToContainOnlyCharactersInSet(NSCharacterSet.decimalDigitCharacterSet())
        string2.cleanupToContainOnlyCharactersInSet(NSCharacterSet.uppercaseLetterCharacterSet())

        XCTAssertEqual(string1, "1234567890")
        XCTAssertEqual(string2, "TCOL")
    }
    
    func testCleanup() {
        var string = "\n\n This   is   a     string with  lots of    double spaces.    \n\n   And a newline.\n  Or two.    \n"
        string.cleanup()
        XCTAssertEqual(string, "This is a string with lots of double spaces.\nAnd a newline.\nOr two.")
    }
    
    func testContainsOnlyCharactersInSet() {
        let string1 = "1234567890"
        let string2 = "This Contains Only Letters."
        
        XCTAssertTrue(string1.containsOnlyCharactersInSet(NSCharacterSet.decimalDigitCharacterSet()))
        XCTAssertFalse(string1.containsOnlyCharactersInSet(NSCharacterSet.uppercaseLetterCharacterSet()))
        
        var set = NSMutableCharacterSet.alphanumericCharacterSet()
        set.formUnionWithCharacterSet(NSCharacterSet.punctuationCharacterSet())
        set.formUnionWithCharacterSet(NSCharacterSet.whitespaceCharacterSet())
        XCTAssertTrue(string2.containsOnlyCharactersInSet(set))
        
        set = NSMutableCharacterSet.letterCharacterSet()
        set.formUnionWithCharacterSet(NSCharacterSet.punctuationCharacterSet())
        set.formUnionWithCharacterSet(NSCharacterSet.whitespaceCharacterSet())
        XCTAssertTrue(string2.containsOnlyCharactersInSet(set))
        
        set = NSMutableCharacterSet.decimalDigitCharacterSet()
        set.formUnionWithCharacterSet(NSCharacterSet.punctuationCharacterSet())
        set.formUnionWithCharacterSet(NSCharacterSet.whitespaceCharacterSet())
        XCTAssertFalse(string2.containsOnlyCharactersInSet(set))
    }


}

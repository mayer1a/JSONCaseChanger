//
//  JSONCaseChangerToCamelTests.swift
//  
//
//  Created by Artem Mayer on 02.02.2023.
//

import XCTest
@testable import JSONCaseChanger

final class JSONCaseChangerToCamelTests: XCTestCase {
    func testSnakeToCamel() throws {
        @JSONCaseChanger(changeTo: .toCamelCase) var testSnakeToCamel1 = "json_123"
        @JSONCaseChanger(changeTo: .toCamelCase) var testSnakeToCamel2 = "json_123_test"
        @JSONCaseChanger(changeTo: .toCamelCase) var testSnakeToCamel3 = "this_is_an_ai_test"
        @JSONCaseChanger(changeTo: .toCamelCase) var testSnakeToCamel4 = "this_is_a_test"
        @JSONCaseChanger(changeTo: .toCamelCase) var testSnakeToCamel5 = "1234_this_is_a_test"

        XCTAssertEqual(testSnakeToCamel1, "json123")
        XCTAssertEqual(testSnakeToCamel2, "json123Test")
        XCTAssertEqual(testSnakeToCamel3, "thisIsAnAiTest")
        XCTAssertEqual(testSnakeToCamel4, "thisIsATest")
        XCTAssertEqual(testSnakeToCamel5, "1234ThisIsATest")
    }

    func testKebabToCamel() throws {
        @JSONCaseChanger(changeTo: .toCamelCase) var testKebabToCamel1 = "JSON-123"
        @JSONCaseChanger(changeTo: .toCamelCase) var testKebabToCamel2 = "JSON-123-Test"
        @JSONCaseChanger(changeTo: .toCamelCase) var testKebabToCamel3 = "This-Is-An-AI-Test"
        @JSONCaseChanger(changeTo: .toCamelCase) var testKebabToCamel4 = "This-Is-A-Test"
        @JSONCaseChanger(changeTo: .toCamelCase) var testKebabToCamel5 = "1234-This-Is-A-Test"
        @JSONCaseChanger(changeTo: .toCamelCase) var testKebabToCamel6 = "1234-This-Is-a-test"
        @JSONCaseChanger(changeTo: .toCamelCase) var testKebabToCamel7 = "12-34-This-Is-A-Test"

        XCTAssertEqual(testKebabToCamel1, "json123")
        XCTAssertEqual(testKebabToCamel2, "json123Test")
        XCTAssertEqual(testKebabToCamel3, "thisIsAnAiTest")
        XCTAssertEqual(testKebabToCamel4, "thisIsATest")
        XCTAssertEqual(testKebabToCamel5, "1234ThisIsATest")
        XCTAssertEqual(testKebabToCamel6, "1234ThisIsATest")
        XCTAssertEqual(testKebabToCamel7, "1234ThisIsATest")
    }

    func testMixCasesToCamel() throws {
        @JSONCaseChanger(changeTo: .toCamelCase) var testMixToCamel1 = "JSON-12 3"
        @JSONCaseChanger(changeTo: .toCamelCase) var testMixToCamel2 = "JSON-123_Test"
        @JSONCaseChanger(changeTo: .toCamelCase) var testMixToCamel3 = "This-is-AnAI-test"
        @JSONCaseChanger(changeTo: .toCamelCase) var testMixToCamel4 = "This-Is_A-test"
        @JSONCaseChanger(changeTo: .toCamelCase) var testMixToCamel5 = "1234-this_Is_A Test"
        @JSONCaseChanger(changeTo: .toCamelCase) var testMixToCamel6 = "1234-This-Is-a-test"
        @JSONCaseChanger(changeTo: .toCamelCase) var testMixToCamel7 = "12 34_This_isATest"

        XCTAssertEqual(testMixToCamel1, "json123")
        XCTAssertEqual(testMixToCamel2, "json123Test")
        XCTAssertEqual(testMixToCamel3, "thisIsAnAiTest")
        XCTAssertEqual(testMixToCamel4, "thisIsATest")
        XCTAssertEqual(testMixToCamel5, "1234ThisIsATest")
        XCTAssertEqual(testMixToCamel6, "1234ThisIsATest")
        XCTAssertEqual(testMixToCamel7, "1234ThisIsATest")
    }
}



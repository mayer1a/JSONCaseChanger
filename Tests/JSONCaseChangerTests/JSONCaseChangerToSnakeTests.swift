//
//  JSONCaseChangerToSnakeTests.swift
//
//
//  Created by Artem Mayer on 02.02.2023.
//

import XCTest
@testable import JSONCaseChanger

final class JSONCaseChangerToSnakeTests: XCTestCase {
    func testCamelToSnake() throws {
        @JSONCaseChanger(changeTo: .toSnakeCase) var testCamelToSnake1 = "JSON123"
        @JSONCaseChanger(changeTo: .toSnakeCase) var testCamelToSnake2 = "JSON123Test"
        @JSONCaseChanger(changeTo: .toSnakeCase) var testCamelToSnake3 = "ThisIsAnAITest"
        @JSONCaseChanger(changeTo: .toSnakeCase) var testCamelToSnake4 = "ThisIsATest"
        @JSONCaseChanger(changeTo: .toSnakeCase) var testCamelToSnake5 = "1234ThisIsATest"

        XCTAssertEqual(testCamelToSnake1, "json_123")
        XCTAssertEqual(testCamelToSnake2, "json_123_test")
        XCTAssertEqual(testCamelToSnake3, "this_is_an_ai_test")
        XCTAssertEqual(testCamelToSnake4, "this_is_a_test")
        XCTAssertEqual(testCamelToSnake5, "1234_this_is_a_test")
    }

    func testKebabToSnake() throws {
        @JSONCaseChanger(changeTo: .toSnakeCase) var testCamelToSnake1 = "JSON-123"
        @JSONCaseChanger(changeTo: .toSnakeCase) var testCamelToSnake2 = "JSON-123-Test"
        @JSONCaseChanger(changeTo: .toSnakeCase) var testCamelToSnake3 = "This-Is-An-AI-Test"
        @JSONCaseChanger(changeTo: .toSnakeCase) var testCamelToSnake4 = "This-Is-A-Test"
        @JSONCaseChanger(changeTo: .toSnakeCase) var testCamelToSnake5 = "1234-This-Is-A-Test"
        @JSONCaseChanger(changeTo: .toSnakeCase) var testCamelToSnake6 = "12 34-This-Is-a-test"
        @JSONCaseChanger(changeTo: .toSnakeCase) var testCamelToSnake7 = "12-34-This-Is-A-Test"

        XCTAssertEqual(testCamelToSnake1, "json_123")
        XCTAssertEqual(testCamelToSnake2, "json_123_test")
        XCTAssertEqual(testCamelToSnake3, "this_is_an_ai_test")
        XCTAssertEqual(testCamelToSnake4, "this_is_a_test")
        XCTAssertEqual(testCamelToSnake5, "1234_this_is_a_test")
        XCTAssertEqual(testCamelToSnake6, "12_34_this_is_a_test")
        XCTAssertEqual(testCamelToSnake7, "12_34_this_is_a_test")
    }

    func testMixCasesToSnake() throws {
        @JSONCaseChanger(changeTo: .toSnakeCase) var testCamelToSnake1 = "JSON-12 3"
        @JSONCaseChanger(changeTo: .toSnakeCase) var testCamelToSnake2 = "JSON-123_Test"
        @JSONCaseChanger(changeTo: .toSnakeCase) var testCamelToSnake3 = "This-is-AnAI-test"
        @JSONCaseChanger(changeTo: .toSnakeCase) var testCamelToSnake4 = "This-Is_A-test"
        @JSONCaseChanger(changeTo: .toSnakeCase) var testCamelToSnake5 = "1234 a-this_Is_A Test"
        @JSONCaseChanger(changeTo: .toSnakeCase) var testCamelToSnake6 = "1234a-This-Is-a-test"
        @JSONCaseChanger(changeTo: .toSnakeCase) var testCamelToSnake7 = "12 34_This_isATest"
        @JSONCaseChanger(changeTo: .toSnakeCase) var testCamelToSnake8 = "A1234test"
        @JSONCaseChanger(changeTo: .toSnakeCase) var testCamelToSnake9 = "a1234test"

        XCTAssertEqual(testCamelToSnake1, "json_12_3")
        XCTAssertEqual(testCamelToSnake2, "json_123_test")
        XCTAssertEqual(testCamelToSnake3, "this_is_an_ai_test")
        XCTAssertEqual(testCamelToSnake4, "this_is_a_test")
        XCTAssertEqual(testCamelToSnake5, "1234_a_this_is_a_test")
        XCTAssertEqual(testCamelToSnake6, "1234_a_this_is_a_test")
        XCTAssertEqual(testCamelToSnake7, "12_34_this_is_a_test")
        XCTAssertEqual(testCamelToSnake8, "a_1234_test")
        XCTAssertEqual(testCamelToSnake9, "a_1234_test")
    }
}


//
//  JSONCaseChangerToKebabTests.swift
//  
//
//  Created by Artem Mayer on 02.02.2023.
//

import XCTest
@testable import JSONCaseChanger

final class JSONCaseChangerToKebabTests: XCTestCase {
    func testCamelToKebab() throws {
        @JSONCaseChanger(changeTo: .toKebabCase) var testCamelToKebab1 = "JSON123"
        @JSONCaseChanger(changeTo: .toKebabCase) var testCamelToKebab2 = "JSON123Test"
        @JSONCaseChanger(changeTo: .toKebabCase) var testCamelToKebab3 = "ThisIsAnAITest"
        @JSONCaseChanger(changeTo: .toKebabCase) var testCamelToKebab4 = "ThisIsATest"
        @JSONCaseChanger(changeTo: .toKebabCase) var testCamelToKebab5 = "1234ThisIsATest"
        @JSONCaseChanger(changeTo: .toKebabCase) var testCamelToKebab6 = "A1234ThisIsATest"
        @JSONCaseChanger(changeTo: .toKebabCase) var testCamelToKebab7 = "As1234ThisIsATest"

        XCTAssertEqual(testCamelToKebab1, "json-123")
        XCTAssertEqual(testCamelToKebab2, "json-123-test")
        XCTAssertEqual(testCamelToKebab3, "this-is-an-ai-test")
        XCTAssertEqual(testCamelToKebab4, "this-is-a-test")
        XCTAssertEqual(testCamelToKebab5, "1234-this-is-a-test")
        XCTAssertEqual(testCamelToKebab6, "a-1234-this-is-a-test")
        XCTAssertEqual(testCamelToKebab7, "as-1234-this-is-a-test")
    }

    func testSnakeToKebab() throws {
        @JSONCaseChanger(changeTo: .toKebabCase) var testSnakeToKebab1 = "JSON_123"
        @JSONCaseChanger(changeTo: .toKebabCase) var testSnakeToKebab2 = "JSON_123_Test"
        @JSONCaseChanger(changeTo: .toKebabCase) var testSnakeToKebab3 = "This_Is_An_AI_Test"
        @JSONCaseChanger(changeTo: .toKebabCase) var testSnakeToKebab4 = "This_Is_A_Test"
        @JSONCaseChanger(changeTo: .toKebabCase) var testSnakeToKebab5 = "1234_This_Is_A_Test"
        @JSONCaseChanger(changeTo: .toKebabCase) var testSnakeToKebab6 = "1234_This_Is_a_test"
        @JSONCaseChanger(changeTo: .toKebabCase) var testSnakeToKebab7 = "12_34_This_Is_A_Test"

        XCTAssertEqual(testSnakeToKebab1, "json-123")
        XCTAssertEqual(testSnakeToKebab2, "json-123-test")
        XCTAssertEqual(testSnakeToKebab3, "this-is-an-ai-test")
        XCTAssertEqual(testSnakeToKebab4, "this-is-a-test")
        XCTAssertEqual(testSnakeToKebab5, "1234-this-is-a-test")
        XCTAssertEqual(testSnakeToKebab6, "1234-this-is-a-test")
        XCTAssertEqual(testSnakeToKebab7, "12-34-this-is-a-test")
    }

    func testMixCasesToKebab() throws {
        @JSONCaseChanger(changeTo: .toKebabCase) var testMixToKebab1 = "JSON-12 3"
        @JSONCaseChanger(changeTo: .toKebabCase) var testMixToKebab2 = "JSON-123_Test"
        @JSONCaseChanger(changeTo: .toKebabCase) var testMixToKebab3 = "This-is-AnAI-test"
        @JSONCaseChanger(changeTo: .toKebabCase) var testMixToKebab4 = "This-Is_A-test"
        @JSONCaseChanger(changeTo: .toKebabCase) var testMixToKebab5 = "1234-this_Is_A Test"
        @JSONCaseChanger(changeTo: .toKebabCase) var testMixToKebab6 = "1234-This-Is-a-test"
        @JSONCaseChanger(changeTo: .toKebabCase) var testMixToKebab7 = "12 34_This_isATest"

        XCTAssertEqual(testMixToKebab1, "json-12-3")
        XCTAssertEqual(testMixToKebab2, "json-123-test")
        XCTAssertEqual(testMixToKebab3, "this-is-an-ai-test")
        XCTAssertEqual(testMixToKebab4, "this-is-a-test")
        XCTAssertEqual(testMixToKebab5, "1234-this-is-a-test")
        XCTAssertEqual(testMixToKebab6, "1234-this-is-a-test")
        XCTAssertEqual(testMixToKebab7, "12-34-this-is-a-test")
    }
}

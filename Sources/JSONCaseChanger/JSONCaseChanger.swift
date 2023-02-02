// MARK: - ChangerCase

import Foundation

public enum ChangerCase {
    case toCamelCase
    case toSnakeCase
    case toKebabCase
}

// MARK: - JSONCaseChanger

@propertyWrapper
public struct JSONCaseChanger {

    // MARK: - Public properties

    public var wrappedValue: String {
        get {
            self.resultString
        }
        set {
            self.resultString = self.changeCase(for: newValue)
        }
    }

    // MARK: - Private properties

    private var resultString: String = ""
    private let choosenCase: ChangerCase

    // MARK: - Public constructions

    public init(wrappedValue inputString: String, changeTo choosenCase: ChangerCase) {
        self.choosenCase = choosenCase
        self.wrappedValue = inputString
    }

    // MARK: - Private functions

    private func changeCase(for inputString: String) -> String {
        switch self.choosenCase {

        case .toCamelCase:
            return ""

        case .toSnakeCase:
            return ""

        case .toKebabCase:
            return ""
        }
    }
    
}

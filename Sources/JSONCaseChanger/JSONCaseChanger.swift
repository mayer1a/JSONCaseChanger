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
            return inputString.toCamelCase()

        case .toSnakeCase:
            return ""

        case .toKebabCase:
            return ""
        }
    }
    
}

// MARK: - Extensions

fileprivate extension String {

    func toCamelCase() -> Self {
        let toCamelNormalPattern = "([A-Z]+|[a-z])([A-Z][a-z]|[0-9])"
        let toCamelAcronymPattern = "([a-z])([A-Z]|[0-9])"
        let unionTemplate = " "

        let partialResultString = self
            .processCaseRegex(pattern: toCamelNormalPattern, with: unionTemplate)?
            .processCaseRegex(pattern: toCamelAcronymPattern, with: unionTemplate) ?? self

        return partialResultString
            .components(separatedBy: CharacterSet.alphanumerics.inverted)
            .filter { !$0.isEmpty }
            .enumerated()
            .map { $0.offset == 0 ? $0.element.lowercased() : $0.element.capitalized }
            .joined()
    }

    private func processCaseRegex(pattern: String, with unionTemplate: String) -> Self? {
        let regex = try? NSRegularExpression(pattern: pattern, options: [])
        let range = NSRange(location: 0, length: count)

        return regex?.stringByReplacingMatches(in: self, range: range,
                                               withTemplate: "$1\(unionTemplate)$2")
    }
}

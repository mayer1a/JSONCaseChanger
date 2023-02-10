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
            return inputString.toSnakeCase()

        case .toKebabCase:
            return inputString.toKebabCase()
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

    func toSnakeCase() -> Self {
        let charSetForRemove = CharacterSet([" ", "-"])
        let unionTemplate = "_"

        return self
            .getStringFromCamel(with: unionTemplate)
            .getStringWithReplaced(charset: charSetForRemove, to: unionTemplate)
    }

    func toKebabCase() -> Self {
        let charSetForRemove = CharacterSet([" ", "_"])
        let unionTemplate = "-"

        return self
            .getStringFromCamel(with: unionTemplate)
            .getStringWithReplaced(charset: charSetForRemove, to: unionTemplate)
    }

    private func getStringWithReplaced(charset: CharacterSet, to separator: String) -> Self {
        return self
            .components(separatedBy: charset)
            .filter { !$0.isEmpty }
            .joined(separator: separator)
    }

    private func getStringFromCamel(with unionTemplate: String) -> Self {
        let fromCamelAcronymPattern = "([A-Z]+|[a-z])([A-Z][a-z]|[0-9])"
        let fromCamelNormalPattern = "([a-z])([A-Z]|[0-9])"
        let fromCamelDigitPattern = "([0-9])([A-Z]|[a-z])"

        return self
            .processCaseRegex(pattern: fromCamelAcronymPattern, with: unionTemplate)?
            .processCaseRegex(pattern: fromCamelNormalPattern, with: unionTemplate)?
            .processCaseRegex(pattern: fromCamelDigitPattern, with: unionTemplate)?
            .lowercased() ?? self.lowercased()
    }

    private func processCaseRegex(pattern: String, with unionTemplate: String) -> Self? {
        let regex = try? NSRegularExpression(pattern: pattern, options: [])
        let range = NSRange(location: 0, length: count)

        return regex?.stringByReplacingMatches(in: self, range: range,
                                               withTemplate: "$1\(unionTemplate)$2")
    }
}

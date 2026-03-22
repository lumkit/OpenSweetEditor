import Foundation

struct TextChangeData: Codable {
    let range: TextRangeData
    let new_text: String
}

struct TextEditResultData: Codable {
    let changed: Bool
    let changes: [TextChangeData]
    let cursor_before: TextPositionData
    let cursor_after: TextPositionData
}

struct TextEditResultLite: Codable {
    let changes: [TextChangeData]
}

struct KeyEventResultData: Codable {
    let handled: Bool
    let content_changed: Bool
    let cursor_changed: Bool
    let selection_changed: Bool
    let edit_result: TextEditResultData
}

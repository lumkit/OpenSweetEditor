import Foundation

struct VisualLine: Codable {
    let logical_line: Int
    let wrap_index: Int
    let line_number_position: PointData
    let runs: [VisualRun]
    let is_phantom_line: Bool
    let gutter_icon_ids: [Int32]
    let fold_state: FoldState

    init(logical_line: Int, wrap_index: Int, line_number_position: PointData, runs: [VisualRun], is_phantom_line: Bool, gutter_icon_ids: [Int32], fold_state: FoldState) {
        self.logical_line = logical_line
        self.wrap_index = wrap_index
        self.line_number_position = line_number_position
        self.runs = runs
        self.is_phantom_line = is_phantom_line
        self.gutter_icon_ids = gutter_icon_ids
        self.fold_state = fold_state
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        logical_line = try container.decode(Int.self, forKey: .logical_line)
        wrap_index = try container.decode(Int.self, forKey: .wrap_index)
        line_number_position = try container.decode(PointData.self, forKey: .line_number_position)
        runs = try container.decode([VisualRun].self, forKey: .runs)
        is_phantom_line = try container.decode(Bool.self, forKey: .is_phantom_line)
        gutter_icon_ids = try container.decode([Int32].self, forKey: .gutter_icon_ids)
        fold_state = try container.decodeIfPresent(FoldState.self, forKey: .fold_state) ?? .NONE
    }
}

enum FoldState: String, Codable {
    case NONE
    case EXPANDED
    case COLLAPSED
}

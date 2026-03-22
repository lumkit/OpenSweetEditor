import Foundation

struct EditorRenderModel: Codable {
    let split_x: Float
    let scroll_x: Float
    let scroll_y: Float
    let viewport_width: Float
    let viewport_height: Float
    let current_line: PointData
    let lines: [VisualLine]
    let cursor: Cursor
    let selection_rects: [SelectionRect]
    let selection_start_handle: SelectionHandle
    let selection_end_handle: SelectionHandle
    let composition_decoration: CompositionDecoration
    let guide_segments: [GuideSegment]
    let diagnostic_decorations: [DiagnosticDecoration]
    let max_gutter_icons: UInt32
    let fold_arrow_x: Float
    let linked_editing_rects: [LinkedEditingRect]
    let bracket_highlight_rects: [BracketHighlightRect]
    let vertical_scrollbar: ScrollbarModel
    let horizontal_scrollbar: ScrollbarModel
}

struct PointData: Codable {
    let x: Float
    let y: Float
}

struct TextPositionData: Codable {
    let line: Int
    let column: Int
}

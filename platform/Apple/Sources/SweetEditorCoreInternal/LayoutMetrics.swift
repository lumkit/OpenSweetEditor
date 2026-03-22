import Foundation

struct LayoutMetrics: Codable {
    let font_height: Float
    let font_ascent: Float
    let line_spacing_add: Float
    let line_spacing_mult: Float
    let line_number_margin: Float
    let line_number_width: Float
    let max_gutter_icons: UInt32
    let inlay_hint_padding: Float
    let inlay_hint_margin: Float
    let fold_arrow_mode: String
    let has_fold_regions: Bool
}

import Foundation

public enum FoldArrowMode: Int32, Equatable {
    case auto = 0
    case always = 1
    case hidden = 2
}

public enum WrapMode: Int32, Equatable {
    case none = 0
    case charBreak = 1
    case wordBreak = 2
}

public enum CurrentLineRenderMode: Int32, Equatable {
    case background = 0
    case border = 1
    case none = 2
}

public enum AutoIndentMode: Int32, Equatable {
    case none = 0
    case keepIndent = 1
}

protocol EditorSettingsHost: AnyObject {
    func applyEditorSettings(_ settings: EditorSettings)
}

public final class EditorSettings {
    private weak var host: EditorSettingsHost?

    public private(set) var editorTextSize: Float = 14.0
    public private(set) var typeface: String = "Menlo"
    public private(set) var scale: Float = 1.0
    public private(set) var foldArrowMode: FoldArrowMode = .always
    public private(set) var wrapMode: WrapMode = .none
    public private(set) var lineSpacingAdd: Float = 0.0
    public private(set) var lineSpacingMult: Float = 1.0
    public private(set) var contentStartPadding: Float = 0.0
    public private(set) var showSplitLine = true
    public private(set) var currentLineRenderMode: CurrentLineRenderMode = .background
    public private(set) var autoIndentMode: AutoIndentMode = .keepIndent
    public private(set) var readOnly = false
    public private(set) var maxGutterIcons: UInt32 = 0
    public private(set) var decorationScrollRefreshMinIntervalMs: Int64 = 16
    public private(set) var decorationOverscanViewportMultiplier: Float = 1.5

    init(host: EditorSettingsHost?) {
        self.host = host
    }

    func attachHost(_ host: EditorSettingsHost) {
        self.host = host
    }

    public func setEditorTextSize(_ textSize: Float) {
        editorTextSize = textSize
        apply()
    }

    public func setTypeface(_ typeface: String) {
        self.typeface = typeface
        apply()
    }

    public func setScale(_ scale: Float) {
        self.scale = scale
        apply()
    }

    public func setFoldArrowMode(_ mode: FoldArrowMode) {
        foldArrowMode = mode
        apply()
    }

    public func setWrapMode(_ mode: WrapMode) {
        wrapMode = mode
        apply()
    }

    public func setLineSpacing(add: Float, mult: Float) {
        lineSpacingAdd = add
        lineSpacingMult = mult
        apply()
    }

    public func setContentStartPadding(_ padding: Float) {
        contentStartPadding = max(0, padding)
        apply()
    }

    public func setShowSplitLine(_ show: Bool) {
        showSplitLine = show
        apply()
    }

    public func setCurrentLineRenderMode(_ mode: CurrentLineRenderMode) {
        currentLineRenderMode = mode
        apply()
    }

    public func setAutoIndentMode(_ mode: AutoIndentMode) {
        autoIndentMode = mode
        apply()
    }

    public func setReadOnly(_ readOnly: Bool) {
        self.readOnly = readOnly
        apply()
    }

    public func setMaxGutterIcons(_ count: UInt32) {
        maxGutterIcons = count
        apply()
    }

    public func setDecorationScrollRefreshMinIntervalMs(_ intervalMs: Int64) {
        decorationScrollRefreshMinIntervalMs = max(0, intervalMs)
    }

    public func setDecorationOverscanViewportMultiplier(_ multiplier: Float) {
        decorationOverscanViewportMultiplier = max(0, multiplier)
    }

    private func apply() {
        host?.applyEditorSettings(self)
    }
}

extension SweetEditorCore.AutoIndentMode {
    init(_ mode: AutoIndentMode) {
        switch mode {
        case .none:
            self = .none
        case .keepIndent:
            self = .keepIndent
        }
    }
}

extension SweetEditorCore.FoldArrowMode {
    init(_ mode: FoldArrowMode) {
        switch mode {
        case .auto:
            self = .auto
        case .always:
            self = .always
        case .hidden:
            self = .hidden
        }
    }
}

extension SweetEditorCore.WrapMode {
    init(_ mode: WrapMode) {
        switch mode {
        case .none:
            self = .none
        case .charBreak:
            self = .charBreak
        case .wordBreak:
            self = .wordBreak
        }
    }
}

import Foundation

enum ScrollbarRefreshScheduler {
    static let transientRefreshInterval: TimeInterval = 1.0 / 60.0

    static func scheduleTransientRefreshTimer(_ timer: inout Timer?, action: @escaping () -> Void) {
        timer?.invalidate()
        let newTimer = Timer(timeInterval: transientRefreshInterval, repeats: false) { _ in
            action()
        }
        RunLoop.main.add(newTimer, forMode: .common)
        timer = newTimer
    }
}

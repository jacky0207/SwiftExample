import UIKit

class Logger {

    static var shared = Logger()

    private init() {}

    // MARK: Date

    private let dateFormat = "yyyy-MM-dd HH:mm:ss XXX"

    private var currentDateString: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        return dateFormatter.string(from: Date())
    }

    // MARK: Log

    enum LogLevel: String {

        case verbose = "Verbose"

        case error = "Error"

        case warning = "Warning"

        case info = "Info"

        case debug = "Debug"
    }

    private func log(level: LogLevel, tag: String, message: String) {
        print("\(currentDateString) \(level.rawValue) | \(tag) | \(message)")
    }

    func verbose(tag: String, message: String) {
        log(level: .verbose, tag: tag, message: message)
    }

    func error(tag: String, message: String) {
        log(level: .error, tag: tag, message: message)
    }

    func warning(tag: String, message: String) {
        log(level: .warning, tag: tag, message: message)
    }

    func info(tag: String, message: String) {
        log(level: .info, tag: tag, message: message)
    }

    func debug(tag: String, message: String) {
        log(level: .debug, tag: tag, message: message)
    }

}

extension Logger {

    func verbose(src: Any, message: String) {
        verbose(tag: String(describing: type(of: src)), message: message)
    }

    func debug(src: Any, message: String) {
        debug(tag: String(describing: type(of: src)), message: message)
    }

    func info(src: Any, message: String) {
        info(tag: String(describing: type(of: src)), message: message)
    }

    func warning(src: Any, message: String) {
        warning(tag: String(describing: type(of: src)), message: message)
    }

    func error(src: Any, message: String) {
        error(tag: String(describing: type(of: src)), message: message)
    }

}

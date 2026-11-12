import ArgumentParser
import Logging
import Vapor

struct Migrate: AsyncParsableCommand {
    static let configuration = CommandConfiguration(abstract: "Prepare or revert your database migrations.")

    @Flag var revert = false

    /// Captures all unrecognized command-line arguments
    /// for compatibility with other libraries that use Swift Configuration.
    /// You don't need to pass them to your `ConfigReader`, it will automatically pick them up.
    @Argument(parsing: .allUnrecognized, help: .private)
    var other: [String] = []

    mutating func run() async throws {
        try await withLogger(.init(label: "vapor.logger.migrate")) { _ in
            let app = try appWithConfigReader
            print("🚧 Work in progress 🚧")
            try await app.shutdown()
        }
    }
}

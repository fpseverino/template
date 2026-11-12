import Configuration
import ConsoleLogger
import Vapor

/// Provides an `Application` instance configured with a `ConfigReader`
/// and bootstraps the console logger.
///
/// > Tip: Customize here the `ConfigReader` providers as needed for your app.
///
/// > Tip: If you use a `CommandLineArgumentsProvider`, there's no need to pass command-line arguments manually to it.
var appWithConfigReader: Application {
    get throws {
        let config = ConfigReader(providers: [
            CommandLineArgumentsProvider(),
            EnvironmentVariablesProvider(),
        ])
        ConsoleLogger.bootstrapWithConfigReader(config: config)
        return try Application(configReader: config)
    }
}

//
//  Constants.swift
//  swift-create-xcframework
//
//  Created by Rob Amos on 9/5/20.
//

import ArgumentParser
import PackageModel

enum TargetPlatform: String, ExpressibleByArgument, CaseIterable {
    case ios
    case iossimulator
    case macos
    case maccatalyst
    case tvos
    case tvossimulator
    case watchos
    case watchossimulator

    init?(argument: String) {
        self.init(rawValue: argument.lowercased())
    }


    var platformName: String {
        switch self {
        case .ios:               return "ios"
        case .iossimulator:      return "iossimulator"
        case .macos:             return "macos"
        case .maccatalyst:       return "macos"
        case .tvos:              return "tvos"
        case .tvossimulator:     return "tvossimulator"
        case .watchos:           return "watchos"
        case .watchossimulator:  return "watchossimulator"
        }
    }

    // MARK: - Target SDKs

    struct SDK {
        let destination: String
        let archiveName: String
        let releaseFolder: String
        let buildSettings: [String: String]?
    }

    var sdks: [SDK] {
        switch self {
        case .ios:
            return [
                SDK (
                    destination: "generic/platform=iOS",
                    archiveName: "iphoneos.xcarchive",
                    releaseFolder: "Release-iphoneos",
                    buildSettings: nil
                )
            ]

        case .iossimulator:
            return [
                SDK (
                    destination: "generic/platform=iOS Simulator",
                    archiveName: "iphonesimulator.xcarchive",
                    releaseFolder: "Release-iphonesimulator",
                    buildSettings: nil
                )
            ]

        case .macos:
            return [
                SDK (
                    destination: "generic/platform=macOS,name=Any Mac",
                    archiveName: "macos.xcarchive",
                    releaseFolder: "Release",
                    buildSettings: nil
                )
            ]

        case .maccatalyst:
            return [
                SDK (
                    destination: "generic/platform=macOS,variant=Mac Catalyst",
                    archiveName: "maccatalyst.xcarchive",
                    releaseFolder: "Release-maccatalyst",
                    buildSettings: [ "SUPPORTS_MACCATALYST": "YES" ]
                )
            ]

        case .tvos:
            return [
                SDK (
                    destination: "generic/platform=tvOS",
                    archiveName: "appletvos.xcarchive",
                    releaseFolder: "Release-appletvos",
                    buildSettings: nil
                )
            ]

        case .tvossimulator:
            return [
                SDK (
                    destination: "generic/platform=tvOS Simulator",
                    archiveName: "appletvsimulator.xcarchive",
                    releaseFolder: "Release-appletvsimulator",
                    buildSettings: nil
                )
            ]

        case .watchos:
            return [
                SDK (
                    destination: "generic/platform=watchOS",
                    archiveName: "watchos.xcarchive",
                    releaseFolder: "Release-watchos",
                    buildSettings: nil
                )
            ]

        case .watchossimulator:
            return [
                SDK (
                    destination: "generic/platform=watchOS Simulator",
                    archiveName: "watchsimulator.xcarchive",
                    releaseFolder: "Release-watchsimulator",
                    buildSettings: nil
                )
            ]
        }
    }
}

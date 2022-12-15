//
//  BuildConfig.swift
//  TWC
//
//  Created by Jacky on 11/10/2021.
//
import UIKit

struct BuildConfig {
    static var shared = BuildConfig()

    private init() {}

    enum Error: Swift.Error {
        case missingKey
        case invalidValue
    }

    func value<Value>(for key: String) throws -> Value {
        guard let object = Bundle.main.object(forInfoDictionaryKey: key) else {
            throw Error.missingKey
        }

        guard let value = object as? Value else {
            throw Error.invalidValue
        }

        return value
    }
}

// MARK: - Key

extension BuildConfig {
    var apiHost: String {
        return try! value(for: "API_HOST")
    }
}

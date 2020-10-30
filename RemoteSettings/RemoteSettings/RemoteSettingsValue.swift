//
//  RemoteSettingsValue.swift
//  RemoteSettings
//
//  Created by NGUYEN CHI CONG on 10/28/20.
//

import Foundation

public protocol RemoteSettingsValue {
    var data: Data? { get }
}

public struct DefaultSettingsValue: RemoteSettingsValue {
    public private(set) var data: Data?

    public init(data: Data? = nil) {
        self.data = data
    }

    public init(string: String? = nil) {
        self.data = string?.data(using: .utf8)
    }
}

extension RemoteSettingsValue {
    public var string: String {
        guard let data = self.data else { return "" }
        return String(data: data, encoding: .utf8) ?? ""
    }

    public var isValid: Bool { data != nil }
}

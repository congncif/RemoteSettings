//
//  RemoteSettings+Codable.swift
//  CoreRemoteSettings
//
//  Created by NGUYEN CHI CONG on 5/30/21.
//

import Foundation

extension RemoteSettings {
    public func value<Value: Decodable>(for key: String) -> Value? {
        let settingsValue = self.settingsValue(for: key)
        guard let data = settingsValue.data else { return nil }
        let decoder = JSONDecoder()
        let value = try? decoder.decode(Value.self, from: data)
        return value
    }
}

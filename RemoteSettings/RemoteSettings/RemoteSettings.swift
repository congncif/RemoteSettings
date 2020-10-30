//
//  RemoteSettings.swift
//  RemoteSettings
//
//  Created by NGUYEN CHI CONG on 10/28/20.
//

import Foundation

public protocol RemoteSettings {
    func settingsValue(for key: String) -> RemoteSettingsValue
}

public protocol RemoteSettingsProviding {
    func get() -> RemoteSettings
    func fetch(completion: @escaping (RemoteSettings) -> Void)
}

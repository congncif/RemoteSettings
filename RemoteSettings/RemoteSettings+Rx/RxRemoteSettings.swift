//
//  RxRemoteSettings.swift
//  RemoteSettings
//
//  Created by NGUYEN CHI CONG on 10/28/20.
//

import Foundation
import RxSwift

final class RxRemoteSettings {
    var valueObservable: Observable<RemoteSettings> {
        let internalSettings = settings
        provider.fetch { value in
            internalSettings.onNext(value)
        }
        return internalSettings.asObserver()
    }

    private let provider: RemoteSettingsProviding

    init(provider: RemoteSettingsProviding) {
        self.provider = provider
    }

    private lazy var settings = ReplaySubject<RemoteSettings>.create(bufferSize: 1)
}

extension RemoteSettingsProviding {
    public var rx: Reactive<RemoteSettingsProviding> {
        return Reactive(self)
    }
}

extension Reactive where Base == RemoteSettingsProviding {
    public var value: Observable<RemoteSettings> {
        RxRemoteSettings(provider: base).valueObservable
    }
}

extension Reactive where Base: RemoteSettingsProviding {
    public var value: Observable<RemoteSettings> {
        RxRemoteSettings(provider: base).valueObservable
    }
}

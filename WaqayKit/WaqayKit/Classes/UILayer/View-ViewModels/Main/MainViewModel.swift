//
//  MainViewModel.swift
//  Waqay
//
//  Created by Guillermo Andrés Sáenz Urday on 5/7/20.
//  Copyright © 2020 Property Atomic Strong SAC. All rights reserved.
//

import RxSwift

public class MainViewModel {
    
    public init() {}
    
    public var view: Observable<MainView> {
        return viewSubject.asObservable()
    }
    private let viewSubject = BehaviorSubject<MainView>(value: .launching)
}

// MARK: - NoRadiosSelectedResponder
extension MainViewModel: NoRadiosSelectedResponder {
    public func noRadiosSelected() {
        viewSubject.onNext(.onboarding)
    }
}

// MARK: - HasRadiosSelectedResponder
extension MainViewModel: HasRadiosSelectedResponder {
    public func hasRadiosSelected() {
        viewSubject.onNext(.player)
    }
}

// MARK: - GoToPlayerNavigator
extension MainViewModel: DidFinishAddingRadiosResponder {
    public func didFinishAddingRadios() {
        viewSubject.onNext(.player)
    }
}

// MARK: - GoToPlayerNavigator
extension MainViewModel: GoToPlayerNavigator {
    public func navigateToPlayer() {
        viewSubject.onNext(.player)
    }
}

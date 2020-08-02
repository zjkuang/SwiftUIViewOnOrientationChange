//
//  HomeViewModel.swift
//  SwiftUIViewOnOrientationChange
//
//  Created by Zhengqian Kuang on 2020-08-01.
//  Copyright © 2020 Kuang. All rights reserved.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var interfaceOrientation = ""
    private var uiKitBroker = UIKitBroker()
    
    init() {
        setObservation()
    }
    
    private func setObservation() {
        interfaceOrientation = uiKitBroker.interfaceOrientation.description()
        uiKitBroker.onInterfaceOrientationChange { (_) in
            self.interfaceOrientation = self.uiKitBroker.interfaceOrientation.description()
        }
    }
}

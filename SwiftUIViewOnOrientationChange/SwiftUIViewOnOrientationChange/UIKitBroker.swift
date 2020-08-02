//
//  UIKitBroker.swift
//  SwiftUIViewOnOrientationChange
//
//  Created by Zhengqian Kuang on 2020-08-01.
//  Copyright © 2020 Kuang. All rights reserved.
//

import UIKit

class UIKitBroker {
    var isPad: Bool {
        UIDevice.current.userInterfaceIdiom == .pad
    }
    var isPhone: Bool {
        UIDevice.current.userInterfaceIdiom == .phone
    }
    var interfaceOrientation: UIInterfaceOrientation {
        if let interfaceOrientation = UIApplication.shared.windows.first(where: { $0.isKeyWindow })?.windowScene?.interfaceOrientation {
            return interfaceOrientation
        }
        else {
            return .unknown
        }
    }
    var isPortrait: Bool {
        interfaceOrientation.isPortrait
    }
    var isLandscape: Bool {
        interfaceOrientation.isLandscape
    }
    
    private var onInterfaceOrientationChangeDelegate: ((UIInterfaceOrientation) -> ())? = nil
    
    init() {
        NotificationCenter.default.addObserver(self, selector: #selector(interfaceOrientationDidChange(notification:)), name: UIDevice.orientationDidChangeNotification, object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc private func interfaceOrientationDidChange(notification: Notification) {
        DispatchQueue.main.async {
            self.onInterfaceOrientationChangeDelegate?(self.interfaceOrientation)
        }
    }
    
    @discardableResult
    func onInterfaceOrientationChange(_ closure: @escaping (UIInterfaceOrientation) -> ()) -> Self {
        onInterfaceOrientationChangeDelegate = closure
        return self
    }
}

extension UIInterfaceOrientation {
    func description() ->  String {
        switch self {
        case .portrait:
            return "portrait"
            
        case .landscapeLeft:
            return "landscape left"
            
        case .landscapeRight:
            return "landscape right"
            
        case .portraitUpsideDown:
            return "portrait upsidedown"
            
        case .unknown:
            return "unknown"
            
        @unknown default:
            return "unknown default"
        }
    }
}

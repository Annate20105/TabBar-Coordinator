//
//  Dispatch.swift
//  SMAComfy
//
//  Created by dima on 03.01.2021.
//  Copyright © 2021 Comfy. All rights reserved.
//

import Foundation

private let backgroundQueue = DispatchQueue(label: "comfy.ua.background", attributes: [])

public func dispatchOnUi(_ closure: @escaping () -> Void) {
    DispatchQueue.main.async(execute: { () -> Void in
        closure()
    })
}

public func dispatchOnUiSync(_ closure: () -> Void) {
    DispatchQueue.main.sync(execute: { () -> Void in
        closure()
    })
}


public func dispatchAfterOnUi(_ delay: Double, closure: @escaping () -> Void) {
    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Double(Int64(delay * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)) { () -> Void in
        closure()
    }
}

public func dispatchBackground(_ closure: @escaping () -> Void) {
    backgroundQueue.async {
        closure()
    }
}


public func dispatchBackgroundDelayed(_ delay: Double, closure: @escaping () -> Void) {
     backgroundQueue.asyncAfter(deadline: DispatchTime.now() + Double(Int64(delay * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)) {
        closure()
    }
}

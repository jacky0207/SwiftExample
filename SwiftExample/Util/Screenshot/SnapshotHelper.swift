//
//  SnapshotHelper.swift
//  SwiftExample
//
//  Created by Jacky Lam on 14/4/2022.
//

import UIKit

class SnapshotHelper {

    static var shared = SnapshotHelper()

    private init() {}

    func snapshot(from view: UIView) -> UIImage? {
        return view.snapshot()
    }

    func takeSnapshot(for view: UIView) {
        view.takeSnapshot()
    }

}

extension UIView {

    func snapshot() -> UIImage? {
        UIGraphicsBeginImageContext(frame.size)
        layer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }

    func takeSnapshot() {
        guard let image = snapshot() else {
            fatalError("the current context is nil or was not created by a call to UIGraphicsBeginImageContext(_:)")
        }

        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
    }

}

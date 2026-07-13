//
//  UIViewController+Extensions.swift.swift
//  Chatting
//
//  Created by Sade El Moudden on 13.07.2026.
//

import Foundation
import UIKit

extension UIApplication {
    var rootViewController: UIViewController? {
        connectedScenes
            .compactMap { $0 as? UIWindowScene }
            .flatMap { $0.windows }
            .first { $0.isKeyWindow }?
            .rootViewController
    }
}

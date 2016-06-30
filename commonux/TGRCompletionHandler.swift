//
//  TGRCompletionHandler.swift
//  CommonUX
//
//  Created by David Lin on 4/11/16.
//  Copyright © 2016 TUTK. All rights reserved.
//

import Foundation

public protocol TGRCompletionHandler {
    func completed(result: Any?, attachment: Any?);
    func failed(error: NSError, attachment: Any?);
}

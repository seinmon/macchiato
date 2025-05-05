//
//  File.swift
//  macchiato
//
//  Created by Hossein Monjezi on 18.01.25.
//

import Foundation

extension Numeric {
    init<D>(_ data: D) where D: DataProtocol {
        var value: Self = .zero
        _ = withUnsafeMutableBytes(of: &value, data.copyBytes)
        self = value
    }
}

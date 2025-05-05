//
//  ISAVersion.swift
//  macchiato
//
//  Created by Hossein Monjezi on 13.01.25.
//

import Foundation

/// An enum representing the architecture of the ISA version (32-bit, 64-bit).
public enum ISAVersion {

    /// Represents a 32-bits ISA version.
    case arch32

    /// Represents a 64-bits ISA version.
    case arch64

    /// Initialize the ISAVersion according to the magic number of the Mach-O binary.
    ///
    /// - Parameters:
    ///    - magicNumber: Magic number of the Mach-O binary.
    init(_ magicNumber: MagicNumber) {
        switch magicNumber {
        case .feedface:
            self = .arch32

        case .feedfacf:
            self = .arch64
        }
    }
}

//
//  FileType.swift
//  macchiato
//
//  Created by Hossein Monjezi on 19.01.25.
//

import Foundation

/// Possible Mach-O file types.
public enum FileType: UInt32 {

    /// Relocatable object file.
    case objectFile = 0x1

    /// Demand-paged executable file.
    case executable = 0x2

    /// Fixed VM shared library file (obsolete).
    case fvmlib = 0x3

    /// Core dump file.
    case core = 0x4

    /// Preloaded executable file.
    case preload = 0x5

    /// Dynamic shared library.
    case dylib = 0x6

    /// Dynamic linker.
    case dylinker = 0x7

    /// Dynamically loaded bundle.
    case bundle = 0x8

    /// Shared library stub for static linking (obsolete).
    case dylibStub = 0x9

    /// Debugging information file.
    case dsym = 0xA

    /// Kernel extension bundle.
    case kextBundle = 0xB
}

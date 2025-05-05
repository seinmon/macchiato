//
//  CPUType.swift
//  macchiato
//
//  Created by Hossein Monjezi on 18.01.25.
//

import Foundation

/// Possible CPU types in a Mach-O binary.
public enum CPUType: UInt32 {
    case any                 = 0xFFFFFFFF
    case vax                 = 0x1
    case romp                = 0x2
    case ns32032             = 0x4
    case ns32332             = 0x5
    case mc680x0             = 0x6
    case i386                = 0x7
    case x86_64              = 0x01000007
    case mips                = 0x8
    case ns32532             = 0x9
    case hppa                = 0xB
    case arm                 = 0xC
    case mc88000             = 0xD
    case sparc               = 0xE
    case i860_bigEndian      = 0xF
    case i860_littleEndian   = 0x10
    case rs6000              = 0x11
    case mc98000_powerpc     = 0x12
    case powerpc64           = 0x01000012
    case veo                 = 0xFF
    case arm64               = 0x0100000C

    /// Indicates whether or not a CPU type has a 64-bits architecture.
    var isArch64: Bool {
        return (0x01000000 & self.rawValue) != 0
    }
}

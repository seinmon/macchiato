//
//  MachOHeader.swift
//  macchiato
//
//  Created by Hossein Monjezi on 18.01.25.
//

import Foundation

struct MachOHeader {
    let magicNumber: MagicNumber
    let cpuType: CPUType
    let cpuSubtype: CPUSubtype
    let fileType: FileType
    let loadCommandsCount: UInt32
    let loadCommandsSize: UInt32
    let flags: UInt32
    let reserved: UInt32? = nil

    init?(from data: Data) {
        guard let magicNumber = MagicNumber(rawValue: data.read(UInt32.self, from: 0)) else {
            return nil
        }

        self.magicNumber = magicNumber

        guard let cpuType = CPUType(rawValue: data.read(UInt32.self, from: 4)) else {
            return nil
        }

        self.cpuType = cpuType

        guard let cpuSubtype = CPUSubtype(cpuType: cpuType,
                                          rawSubtypeValue: data.read(UInt32.self, from: 8)) else {
            return nil
        }

        self.cpuSubtype = cpuSubtype

        guard let fileType = FileType(rawValue: data.read(UInt32.self, from: 12)) else {
            return nil
        }

        self.fileType = fileType

        self.loadCommandsCount = data.read(UInt32.self, from: 16)
        self.loadCommandsSize = data.read(UInt32.self, from: 20)
        self.flags = data.read(UInt32.self, from: 24)
    }
}

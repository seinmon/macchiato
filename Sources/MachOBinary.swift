//
//  MachOBinary.swift
//  macchiato
//
//  Created by Hossein Monjezi on 13.01.25.
//

import Foundation
import MachO

public struct MachOBinary {
    public let arch: ISAVersion
    internal let header: MachOHeader?
    private let data: Data

    private var currentIndex: Data.Index

    private var startIndex: Data.Index {
        return data.startIndex
    }

    private var endIndex: Data.Index {
        return data.endIndex
    }

    private var size: Int {
        return endIndex - startIndex
    }

    init(url: URL) throws {
        self.data = try Data(contentsOf: url)
        self.currentIndex = data.startIndex
        self.header = MachOHeader(from: data)

        //        guard let isaVersion = ISAVersion(header?.magicNumber) else {
        //            fatalError()
        //        }

//        self.arch = isaVersion
        self.arch = .arch64
        print(self.header)
        print(self.arch)
    }

}


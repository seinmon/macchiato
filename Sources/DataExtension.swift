//
//  DataExtension.swift
//  macchiato
//
//  Created by Hossein Monjezi on 19.01.25.
//

import Foundation

extension Data {

    /// Read a numeric type from a start index within the `Data`.
    ///
    /// This method can read a numeric type from a specified start index within the `Data`. Start index indicates the number of bytes
    /// from the start of the `Data` within the memory, and the end index is calculated according to the size of the numeric type to
    /// read. For instance `data.read(Int32.self, 4)` skips the first 4 bytes of the `Data` and reads the second 4 bytes.
    ///
    /// - Parameters:
    ///    - contentType: Numeric type to read from within the `Data`.
    ///    - startIndex: Start index of the reading.
    func read<N>(_ contentType: N.Type, from startIndex: Data.Index) -> N where N: Numeric {
        let chunkSize = MemoryLayout<N>.size
        let endIndex = startIndex + chunkSize
        return N(subdata(in: startIndex..<endIndex))
    }
}

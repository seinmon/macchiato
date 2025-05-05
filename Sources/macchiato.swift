// The Swift Programming Language
// https://docs.swift.org/swift-book
// 
// Swift Argument Parser
// https://swiftpackageindex.com/apple/swift-argument-parser/documentation

import ArgumentParser
import Foundation

@main
struct macchiato: ParsableCommand {

    @Argument(help: "Path of the input binary.", transform: { arg in URL(filePath: arg) })
    var input: URL

    mutating func run() throws {
        _ = try MachOBinary(url: input)
    }
}

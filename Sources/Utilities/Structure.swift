public extension Collection where Element == UInt8 {
    func unpack<T: FixedWidthInteger>(_ type: T.Type = T.self, littleEndian order: Bool = true) -> T {
        let value = withContiguousStorageIfAvailable({
            UnsafeRawPointer($0.baseAddress)!.assumingMemoryBound(to: T.self).pointee
        })!
        return order ? T(littleEndian: value) : T(bigEndian: value)
    }
}

public extension FixedWidthInteger {
    func pack(littleEndian order: Bool = true) -> [UInt8] {
        withUnsafeBytes(of: order ? littleEndian : bigEndian, Array.init)
    }
}

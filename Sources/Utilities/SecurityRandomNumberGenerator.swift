#if canImport(Security)
import Security

public struct SecurityRandomNumberGenerator: RandomNumberGenerator {
    public func next() -> UInt64 {
        var random: UInt64 = 0
        let status = SecRandomCopyBytes(kSecRandomDefault, MemoryLayout<UInt64>.size, &random)
        guard status == errSecSuccess else {
            preconditionFailure("Failed to generate random bytes [status: \(status)]")
        }
        return random
    }
}
#endif

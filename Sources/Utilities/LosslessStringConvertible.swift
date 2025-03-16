public extension LosslessStringConvertible where Self: RawRepresentable, RawValue == String {
    var description: String {
        rawValue
    }
    
    init?(_ description: String) {
        self.init(rawValue: description)
    }
}

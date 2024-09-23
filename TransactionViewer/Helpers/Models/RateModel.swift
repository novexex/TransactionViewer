
typealias Rates = [RateModel]
typealias RatesDictionary = [String: Double]

struct RateModel: Decodable {
    let from: String
    let rate: String
    let to: String
}

// Helpers
extension RateModel {
    var rateValue: Double? {
        Double(rate)
    }
}

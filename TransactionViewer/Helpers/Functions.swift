
import Foundation

func convertToDictionary(with items: Rates) -> RatesDictionary {
    var ratesDictionary: RatesDictionary = [:]
    
    for rate in items {
        if let rateValue = rate.rateValue {
            let key = "\(rate.from)_\(rate.to)"
            ratesDictionary[key] = rateValue
        }
    }
    
    return ratesDictionary
}

func findRate(from: String,
              to: String,
              ratesDictionary: RatesDictionary) -> Double {
    if let directRate = ratesDictionary["\(from)_\(to)"] {
        return directRate
    }
    
    if let reverseRate = ratesDictionary["\(to)_\(from)"] {
        return 1 / reverseRate
    }
    
    for (key, value) in ratesDictionary {
        let components = key.split(separator: "_")
        if components.count == 2 {
            let intermediateFrom = String(components[0])
            let intermediateTo = String(components[1])
            
            if intermediateFrom == from, let intermediateRate = ratesDictionary["\(intermediateTo)_\(to)"] {
                return value * intermediateRate
            }
        }
    }
    
    return 0
}

func convertCurrency(amount: Double?,
                     from: String,
                     to: String = "GBP",
                     ratesDictionary: RatesDictionary) -> Double {
    guard let amount else { return 0 }
    guard from != to else { return amount }
    
    let rate = findRate(from: from, to: to, ratesDictionary: ratesDictionary)
    return amount * rate
}

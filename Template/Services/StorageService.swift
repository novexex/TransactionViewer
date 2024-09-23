
import Foundation

final class StorageService: ObservableObject {
    static let shared = StorageService()
    private init() {}
    
    private let userDefaults = UserDefaults.standard
    
    var isWelcomeViewShowed: Bool {
        get {
            userDefaults.bool(forKey: Key.welcomeShowed)
        }
        set {
            userDefaults.set(newValue, forKey: Key.welcomeShowed)
        }
    }
}

extension StorageService {
    enum Key {
        static let welcomeShowed = "welcomeShowed"
    }
}

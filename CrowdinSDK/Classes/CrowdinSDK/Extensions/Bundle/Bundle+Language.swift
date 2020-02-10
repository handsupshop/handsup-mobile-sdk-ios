//
//  Bundle+Language.swift
//  CrowdinSDK
//
//  Created by Serhii Londar on 2/5/19.
//

import Foundation

// MARK: - Extension for preffered localization detection.
extension Bundle {
    /// Returns detected preffered language from device settings and bundle localizations. If bundle localizations is empty then return default locazation - "en".
    var preferredLanguage: String {
        return self.preferredLanguages.first ?? defaultLocalization
    }
    
    /// Return ordered list of language codes according to device settings, and bundle localizations.
	//	TODO: Add handling case when intersection of preffered languages from settings and localizations in bundle is empty.
    var preferredLanguages: [String] {
        return Locale.preferredLocalizations.compactMap { (localization) -> String? in
            return self.localizations.first { (language) -> Bool in
                let localization = localization.lowercased()
                let language = language.lowercased()

                if localization.hasPrefix("zh") {
                    return language == "zh-hant"
                }
                return localization.hasPrefix(language)
            }
        }
    }
    
    /// Returns detected preffered language from device settings and passed localizations. If bundle localizations is empty then return default locazation - "en".
    func preferredLanguage(with availableLanguages: [String]) -> String {
        return self.preferredLanguages(with: availableLanguages).first ?? defaultLocalization
    }
    
    /// Return ordered list of language codes according to device settings, and passed localizations.
    func preferredLanguages(with availableLanguages: [String]) -> [String] {
        return Locale.preferredLocalizations.compactMap { (localization) -> String? in
            return availableLanguages.first { (language) -> Bool in
                let localization = localization.lowercased()
                let language = language.lowercased()

                if localization.hasPrefix("zh") {
                    return language == "zh-hant"
                }
                return localization.hasPrefix(language)
            }
        }
    }
}

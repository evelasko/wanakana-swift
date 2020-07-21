//
//  File.swift
//  
//
//  Created by Enrique Perez Velasco on 20/07/2020.
//

import Foundation

public extension String {
    
    var inHiragana: String {
        self.replace(regex: katakanaRegex) { katakana in
            guard let specialHiragana = specialHiraganizationTable[katakana] else {
                return fromCharCode(
                    katakana.firstCharCode -
                        "ァ".firstCharCode +
                        "ぁ".firstCharCode
                )
            }
            return specialHiragana
        }
    }
    var inKatakana: String {
        self.replace(regex: hiraganaRegex) { hiragana in
            guard let specialKatakana = specialKatakanizationTable[hiragana] else {
                return fromCharCode(
                    hiragana.firstCharCode -
                        "ぁ".firstCharCode +
                        "ァ".firstCharCode
                )
            }
            return specialKatakana
        }
    }
    
    /// Returns the string romanized using modern hepburn default configuration
    var inRomaji: String {
        
        let table = romanizationTable
        
        var string = self.inHiragana
        var destination = ""
        var previousToken = ""

        while string.count > 0 {
            var token = ""
            
            // case: one or two letter token
            if table[string.slice(0,2)] != nil {
                token = string.slice(0,2)
                string = string.slice(2)
            }
            else {
                token = String(string.first!)
                string = string.slice(1)
            }
            
            // case: small tsu
            if token == "っ"
            {
                previousToken = token
                continue
            }
            
            // case: previous was small tsu
            var tokenDestination = table[token] ?? ""
            if previousToken == "っ" {
                
                let matches = try! NSRegularExpression(pattern: #"^[^aiueo]"#, options: []).firstMatch(in: tokenDestination, options: [], range: tokenDestination.fullRange)
                if matches != nil {
                    if token.first == Character("ち") {
                        tokenDestination =  ["ち": "tchi",
                                             "ちゃ": "tcha",
                                             "ちゅ": "tchu",
                                             "ちぇ": "tche",
                                             "ちょ": "tcho"][token]!
                    }
                    else {
                        tokenDestination = String("\(tokenDestination.first)\(tokenDestination)")
                    }
                }
                else { destination += "'" }
            }
            
            // case: long vowel
            if token == "ー" {
                if try! NSRegularExpression(pattern: #"[aiueo]"#, options: []).firstMatch(in: tokenDestination, options: [], range: tokenDestination.fullRange) != nil {
                    
                    destination += ["a": "ā",
                                    "i": "ī",
                                    "u": "ū",
                                    "e": "ē",
                                    "o": "ō"][destination.last!]!
                    tokenDestination = ""
                }
                else {
                    tokenDestination = "-"
                }
            }
            
            // case: combination えい
            else if destination.last == "e" &&
                    tokenDestination.first == "i" {
                tokenDestination = tokenDestination.slice(1)
                destination += "ei"
            }
            
            if romanizePuncutuationTable[token] != nil {
                tokenDestination = romanizePuncutuationTable[token]!
            }
            
            destination += tokenDestination
            previousToken = token
        }
        
        return destination
    }
    
    /// Returns all kana tokenized in collection: ["み", "キェ", "そ", "マ", "ー", "お", "ちゃ"]
    var tokenizedKana: [String] {
        var skip = 0
        return self.enumerated().reduce(into: [String]()) { (previousResult, item) in
            
            if skip > 0 {
                skip -= 1
                return
            }
            
            let (offset, element) = item
            
            if !element.isKana {
                previousResult.append(String(element))
                return
            }
            
            let character = element.isKatakana ? element.asHiragana : element
            
            if offset + 1 < self.count {
                let double = self.slice(offset, offset + 2).inHiragana
                
                // double character match
                if romanizationTable[double] != nil {
                    previousResult.append(
                        element.isKatakana
                            ? double.inKatakana
                            : double
                    )
                    skip = 1
                    return
                }
            }
            
            // single character match
            if romanizationTable[String(character)] != nil {
                previousResult.append(
                    element.isKatakana
                        ? String(character).inKatakana
                        : String(character)
                )
            }
        }
    }
    
    var tokenizedAll: [Tokenized] {
        var skip = 0
        return self.enumerated().reduce(into: [Tokenized]() )
        { (previousResult, item) in
            
            if skip > 0 {
                skip -= 1
                return
            }
            
            let (offset, element) = item
            
            if !element.isKana {
                let elemString = String(element)
                previousResult.append(Tokenized(
                                        hiragana: elemString,
                                        katakana: elemString,
                                        romaji:   elemString)
                )
                return
            }
            
            let character = element.isKatakana ? element.asHiragana : element
            
            if offset + 1 < self.count {
                let double = self.slice(offset, offset + 2).inHiragana
                
                // double character match
                if romanizationTable[double] != nil {
                    previousResult.append(
                        Tokenized(
                            hiragana: double,
                            katakana: double.inKatakana,
                            romaji: romanizationTable[double]!)

                    )
                    skip = 1
                    return
                }
            }
            
            // single character match
            let charString = String(character)
            if romanizationTable[charString] != nil {
                previousResult.append(
                    Tokenized(hiragana: charString,
                              katakana: charString.inKatakana,
                              romaji: romanizationTable[charString]!)
                )
            }
        }
    }
    
}

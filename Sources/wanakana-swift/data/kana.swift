//
//  File.swift
//  
//
//  Created by Enrique Perez Velasco on 20/07/2020.
//

import Foundation

let katakanaPattern = #"([\u30a1-\u30f4\u30f7-\u30fa\u30fd-\u30ff\u31f0-\u31ff]|\ud869\udf08\u3099|\ud869\udf08|\ud82c\udc00)"#
let katakanaRegex = try! NSRegularExpression(pattern: katakanaPattern, options: [])

let hiraganaPattern = #"([\u3041-\u3094\u309d-\u309f]|\ud82c\udc01)"#
let hiraganaRegex = try! NSRegularExpression(pattern: hiraganaPattern, options: [])

let specialHiraganizationTable = [
    "ヿ": "こと",
    "𪜈": "とも",
    "𪜈゙": "ども",
    "ヷ": "わ゙",
    "ヸ": "ゐ゙",
    "ヹ": "ゑ゙",
    "ヺ": "を゙",
    "𛀀": "え",
    "ㇰ": "く",
    "ㇱ": "し",
    "ㇲ": "す",
    "ㇳ": "と",
    "ㇴ": "ぬ",
    "ㇵ": "は",
    "ㇶ": "ひ",
    "ㇷ": "ふ",
    "ㇸ": "へ",
    "ㇹ": "ほ",
    "ㇺ": "む",
    "ㇻ": "ら",
    "ㇼ": "り",
    "ㇽ": "る",
    "ㇾ": "れ",
    "ㇿ": "ろ",
]

let specialKatakanizationTable = [
    "ゟ": "ヨリ",
    "𛀁": "エ",
]

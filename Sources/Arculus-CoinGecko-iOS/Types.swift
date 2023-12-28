//
//  File.swift
//  
//
//  Created by Sean Orelli on 12/20/23.
//

import Foundation

public extension CoinGecko {
    
    public enum Errors: Error {
        case unknown(message: String)
    }

    public enum Locale: String, Codable {
        enum CodingKeys: String, CodingKey {
            case zhtw = "zh-tw"
            case ar, bg, cs, da, de, el, en, es, fi, fr, he, hi,
                hr, hu, id, it, ja, ko, lt, nl, no, pl, pt, ro, ru,
                sk, sl, sv, th, tr, uk, vi, zh
        }
        case ar
        case bg
        case cs
        case da
        case de
        case el
        case en
        case es
        case fi
        case fr
        case he
        case hi
        case hr
        case hu
        case id
        case it
        case ja
        case ko
        case lt
        case nl
        case no
        case pl
        case pt
        case ro
        case ru
        case sk
        case sl
        case sv
        case th
        case tr
        case uk
        case vi
        case zh
        case zhtw = "zh-tw"
    }

    public enum Order: String {
        case marketCapAsc = "market_cap_asc"
        case marketCapDesc = "market_cap_desc"
        case volumeAsc = "volume_asc"
        case volumeDesc = "volume_desc"
        case idAsc = "id_asc"
        case idDesc = "id_desc"
    }

    public enum Precision {
        case full
        case decimal(places: UInt)//0-18
        public var value: String {
            switch self {
            case .full: return "full"
            case .decimal(let places): return (places > 18) ? "18" : "\(places)"
            }
        }
    }

    public enum PriceChange: String {
        case hourly = "1h"
        case daily = "24h"
        case weekly = "7d"
        case biWeekly = "14d"
        case thirtyDay = "30d"
        case twoHundredDays = "200d"
        case annually = "1y"
    }
}

//
//  File.swift
//  
//
//  Created by Sean Orelli on 12/20/23.
//

import Foundation
public extension CoinGecko {
    static func getCoins() async -> [CoinGecko.Coin]? {
        try? await CoinGecko.coins(includePlatform: true).getObject()
    }
}

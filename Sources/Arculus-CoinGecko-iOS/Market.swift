//
//  File.swift
//  
//
//  Created by Sean Orelli on 12/21/23.
//

import Foundation
public extension CoinGecko {

    func testMarkets(){
        Task {
            if let json = try? await CoinGecko.markets(vs: "USD",
                                                       ids: nil,
                                                       category: nil,
                                                       order: .idAsc,
                                                       perPage: 100,
                                                       page: 1,
                                                       sparkline: false,
                                                       priceChangePercentage: [], locale: .en).getJSON() {
                print(json)
            }
        }
    }
    
    

    public struct Market: Codable, Hashable {
        
        static public func get(vs: String = "usd", page: Int = 1, perPage: Int = 100) async -> [Market] {
            if let markets: [Market] = try? await CoinGecko.markets(vs: vs,
                                                                    perPage: perPage,
                                                                    page: page).getObject() {
                return markets
            } else {
                return []
            }
        }
        public var id: String
        var symbol: String?
        public var name: String?
        
        var image: String?
        var current_price: Double?
        var market_cap: Int?
        var market_cap_rank: Int?
        var fully_diluted_valuation: Int?
        var total_volume: Int?
        var high_24h: Double?
        var low_24h: Double?
        var price_change_24h: Double?
        
        var price_change_percentage_24h: Double?
        var market_cap_change_24h: Double?
        var market_cap_change_percentage_24h: Double?
        var circulating_supply: Double?
        var total_supply: Double?
        var max_supply: Double?
        var ath: Double?
        
        var ath_change_percentage: Double?
        var ath_date: String?
        
        var atl: Double?
        var atl_change_percentage: Double?
        
        var atl_date: String? //Date?
        //var roi: Double? // Always breaks
        var last_updated: String?

    }
/*
    {"id":"frax","symbol":"frax","name":"Frax","image":"https://assets.coingecko.com/coins/images/13422/large/FRAX_icon.png?1696513182","current_price":0.999338,"market_cap":648090100,"market_cap_rank":100,"fully_diluted_valuation":648090100,"total_volume":10175207,"high_24h":1.004,"low_24h":0.996534,"price_change_24h":0.00020743,"price_change_percentage_24h":0.02076,"market_cap_change_24h":-1225498.098142147,"market_cap_change_percentage_24h":-0.18874,"circulating_supply":649462235.510511,"total_supply":649462235.510511,"max_supply":null,"ath":1.14,"ath_change_percentage":-12.48192,"ath_date":"2021-02-07T12:55:35.766Z","atl":0.874536,"atl_change_percentage":14.12916,"atl_date":"2023-03-11T07:50:39.316Z","roi":null,"last_updated":"2023-12-21T20:49:29.000Z"}
    */
}


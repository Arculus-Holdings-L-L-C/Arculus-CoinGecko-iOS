//
//  Model.swift
//  GeckoApp
//
//  Created by Sean Orelli on 12/20/23.
//

import Arculus_CoinGecko_iOS
import Foundation
import SwiftUI
class Model: ObservableObject {

    @Published var coins:       [CoinGecko.Coin]        = []
    @Published var markets:     [CoinGecko.Market]      = []
    @Published var exchanges:   [CoinGecko.Exchange]    = []
    @Published var categories:  [CoinGecko.Category]    = []
    @Published var nfts:        [CoinGecko.NFT]         = []

    func setup() {
        //setup Coingecko api key
        CoinGecko.setAPI(priceHost: host, key: key)
        //CoinGecko.listExchange()
//        testMarkets()
        //CoinGecko.testCoinGecko()
        /*
        Task {
            if let coins = await CoinGecko.getCoins() {
                self.coins = coins
                print("Done")
                print(self.coins.count)
            }
        }
         */
        Task {
            if let coins = await CoinGecko.getCoins() {             
                await MainActor.run {
                    self.coins = coins
                }
            }
            
            let markets = await CoinGecko.Market.get()
            await MainActor.run {
                self.markets = markets
            }
            
            let exchanges = await CoinGecko.Exchange.get()
            await MainActor.run {
                self.exchanges = exchanges
            }

            let categories = await CoinGecko.Category.get()
            await MainActor.run {
                self.categories = categories
            }

            let nft = await CoinGecko.NFT.get()
            await MainActor.run {
                self.nfts = nft
            }

        }

    }
    
    func testMarkets(){
        Task {
            if let json = try? await CoinGecko.markets(vs: "USD",
                                               ids: nil,
                                               category: nil,
                                               order: .idAsc,
                                               perPage: 100,
                                               page: 1,
                                               sparkline: true,
                                                       priceChangePercentage: [], locale: .en).getJSON() {
                print(json)
            }
        }
    }
    
    func testCoin(){
        Task {
            if let json = try? await CoinGecko.coin(id: "btc", localization: nil, tickers: false, smarketData: false, communityData: false, devData: false, sparkline: false).getJSON() {
                print(json)
            }
        }
    }


}

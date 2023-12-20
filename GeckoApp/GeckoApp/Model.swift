//
//  Model.swift
//  GeckoApp
//
//  Created by Sean Orelli on 12/20/23.
//

import Arculus_CoinGecko_iOS
class Model {
    
    func setup() {
        //setup Coingecko api key
        CoinGecko.setAPI(priceHost: host, key: key)
        Task{
            let coins = await CoinGecko.getCoins()
            coins?.forEach({
                print($0.name ?? "?")
            })
        }
    }
}

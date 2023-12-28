//
//  ContentView.swift
//  GeckoApp
//
//  Created by Sean Orelli on 12/20/23.
//

import SwiftUI
import Arculus_CoinGecko_iOS

struct ContentView: View {

    @ObservedObject var model: Model = Model()
    var explorerView: some View {
        VStack {
            Text("Explore").font(.headline)

            List {
                Text("Coins")
                Text("Markets")
                Text("Exchanges")
                Text("NFTs")
            }
            .listStyle(InsetGroupedListStyle())
        }
        .padding()

    }
    var exchangeView: some View {
        VStack {
            Text("\($model.exchanges.count)").font(.headline)

            List($model.exchanges, id: \.name) {
                Text($0.name.wrappedValue ?? "?")
            }
            .listStyle(InsetGroupedListStyle())
        }
        .padding()
    }

    var marketsView: some View {
        VStack {
            Text("\($model.markets.count)").font(.headline)

            List($model.markets, id: \.id) { market in
                Text(market.name.wrappedValue ?? "?")
            }
            .listStyle(InsetGroupedListStyle())
        }
        .padding()
    }

    var coinsView: some View {
        VStack {
            Text("\($model.coins.count)").font(.headline)

            List($model.coins, id: \.id) { coin in
                Text(coin.name.wrappedValue ?? "?")
            }
            .listStyle(InsetGroupedListStyle())
        }
        .padding()
    }

    var categoryView: some View {
        VStack {
            Text("\($model.categories.count)").font(.headline)

            List($model.categories, id: \.id) { coin in
                Text(coin.name.wrappedValue ?? "?")
            }
            .listStyle(InsetGroupedListStyle())
        }
        .padding()
    }

    var nftView: some View {
        VStack {
            Text("\($model.nfts.count)").font(.headline)

            List($model.nfts, id: \.id) { coin in
                Text(coin.name.wrappedValue ?? "?")
            }
            .listStyle(InsetGroupedListStyle())
        }
        .padding()
    }

    var body: some View {
        TabView {
            /*
            coinsView
                .tabItem {
                    Label("Coins", systemImage: "globe")
            }
            marketsView
                .tabItem {
                    Label("Markets", systemImage: "globe")
                }
            exchangeView
                .tabItem {
                    Label("Exchanges", systemImage: "globe")
                }
             */
            categoryView
                .tabItem {
                    Label("Categories", systemImage: "globe")
                }

            nftView
                .tabItem {
                    Label("NFTs", systemImage: "globe")
                }


        }.onAppear(){
            model.setup()
        }

    }
}

#Preview {
    ContentView()
}

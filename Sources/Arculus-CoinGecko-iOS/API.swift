//
//  File.swift
//  
//
//  Created by Sean Orelli on 12/20/23.
//

import Foundation

public enum CoinGecko {
    // swiftlint:disable nesting
    // Follows the specification here:
    // https://www.coingecko.com/en/api/documentation
    
    // Ping -------------------------------------------------------
    case ping

    
    
    // Simple ------------------------------------------------------
    case price(id: String, vs: String, marketcap: Bool=false, vol24hr: Bool=false,
               change24hr: Bool=false, lastUpdated: Bool=false, precision: Precision?=nil)
    case tokenPrice(id: String, contract: String, vs: String, marketCap: Bool=false, vol24hr: Bool=false,
                    change24hr: Bool=false, lastUpdated: Bool=false, precision: Precision?=nil)
    case supportedVsCurrencies

    
    
    // Coins ------------------------------------------------------
    case coins(includePlatform: Bool = false)
    
    case markets(vs: String, ids: String?=nil, category: String?=nil,
                 order: Order = .marketCapDesc, perPage: Int=100, page: Int=1,
                 sparkline: Bool=false, priceChangePercentage: [PriceChange]=[], locale: Locale = .en)
    
    case coin(id: String, localization: String? = nil, tickers: Bool = false, smarketData: Bool = false,
              communityData: Bool = false, devData: Bool = false, sparkline: Bool = false)
    case tickers(id: String, exchangeIds: String, includeLogo: Bool=false,
                page: Int=1, order: TickerOrder = .trustScoreDesc, depth: Bool=false)
    case history(id: String, date: Date, localization: String?=nil)
    case charts(id: String, vs: String, days: String, interval: String?)
    case chartRange(id: String, vs: String, from: String, to: String)
    case ohlc(id: String, vs: String, days: String)

    

    // Contract
    case contract(id: String, contract: String)
    case contractChart(id: String, contract: String, vs: String, days: String)
    case contractChartRange(id: String, contract: String, vs: String, from: String, to: String)

    // AssetPlatforms
    case assetPlatforms(filter: String?)
    
    // Categories
    case categories
    case category(order: String?)
    
    // Exchange
    case exchanges(perPage: Int, page: Int)
    case exchangesList
    case exchange(id: String)
    case exchangeTickers(id: String, coinIds: String?, includeLogo: String?,
                         page: Int?, depth: String?, order: String?)
    case exchangeVolume(id: String, days: Int)
    
    // Indexes
    case indexes(perPage: Int, page: Int)
    case indexedMarket(marketId: String, id: String)
    case indexList

    // Derivatives
    case derivatives(includeTickers: String?)
    case derivativesExchanges(order: String?, perPage: Int?, page: Int?)
    case derivativesExchange(id: String, includeTickers: String)
    case derivativesExchangeList

    // NFTS
    case nfts(order: String?, assetPlatformId: String?, perPage: Int?, page: Int?)
    case nft(id: String)
    case nftCollection(assetPlatformId: String, contract: String)
    
    // Exchange Rates
    case exchangeRates
    
    // Search
    case search(query: String)
    
    // Trending
    case trending
    
    // Global
    case global
    case globalDefi
    
    // companies
    case companies(coinId: String?)

    var path: String {
        switch self {
        // Ping ----------------------
        case .ping:
            return  "/ping"
            
        /*----------------------------------------------------------------------------------------
                                                Simple
         ----------------------------------------------------------------------------------------*/
        case .price(let ids, let vs, let marketcap, let vol24hr, let change24hr, let lastUpdated, let precision):
            var params = "?ids=\(ids)&vs_currencies=\(vs)"
            params = marketcap ? "\(params)&include_market_cap=\(marketcap)" : params
            params = vol24hr ? "\(params)&include_24hr_vol=\(vol24hr)" : params
            params = change24hr ? "\(params)&include_24hr_change=\(change24hr)" : params
            params = lastUpdated ? "\(params)&include_last_updated_at=\(lastUpdated)" : params
            if let precision = precision { params = "\(params)&precision=\(precision.value)"}
            return "/simple/price" + params
        case .tokenPrice(let id, let contract, let vs, let marketcap, let vol24hr,
                         let change24hr, let lastUpdated, let precision):
            var params = "?contract_addresses=\(contract)&vs_currencies=\(vs)"
            params = marketcap ? "\(params)&include_market_cap=\(marketcap)" : params
            params = vol24hr ? "\(params)&include_24hr_vol=\(vol24hr)" : params
            params = change24hr ? "\(params)&include_24hr_change=\(change24hr)" : params
            params = lastUpdated ? "\(params)&include_last_updated_at=\(lastUpdated)" : params
            if let precision = precision { params = "\(params)&precision=\(precision.value)"}
            return "/simple/token_price/\(id)" + params
        case .supportedVsCurrencies:
            return "/simple/supported_vs_currencies"
        
    /*----------------------------------------------------------------------------------------
                                            Coins
     ----------------------------------------------------------------------------------------*/
        case .coins(let includePlatform):
            return "/coins/list?include_platform=\(includePlatform ? "true" : "false")"
        case .markets(let vs, let ids, let category, let order, let perPage, let page,
                      let sparkline, let priceChangePercentage, let locale):
            var params = "?vs_currency=\(vs)"//&contract=\(contract)&vs_currencies=\(vs)"
            if let ids = ids { params = "\(params)&ids=\(ids)" }
            if let category = category { params = "\(params)&category=\(category)" }
            params += "&order=\(order.rawValue)"
            params += "&per_page=\(perPage)"
            params += "&page=\(page)"
            params += "&sparkline=\(sparkline)"
            let changeRanges = priceChangePercentage.reduce("") {"\($0),\($1)"}
            params += "&price_change_percentage=\(changeRanges))"
            params += "&locale=\(locale.rawValue)"
            return "/coins/markets" + params
        case .coin(let id, let localization, let tickers,
                    let marketData, let communityData, let devData, let sparkline):
            var params = "?"
            if let localization = localization { params = "\(params)&localization=\(localization)" }
            params += "&ticker=\(tickers)"
            params += "&market_data=\(marketData)"
            params += "&community_data=\(communityData)"
            params += "&dev_data=\(devData)"
            params += "&sparkline=\(sparkline)"
            return "/coins/\(id)" + params
        case .tickers(let id, let exchangeIds, let includeLogo,
                        let page, let order, let depth):
            var params = "?"
            params += "&exchange_ids=\(exchangeIds)"
            params += "&include_logo=\(includeLogo)"
            params += "&page=\(page)"
            params += "&order=\(order.rawValue)"
            params += "&depth=\(depth)"
            return "/coins/\(id)/tickers" + params
        case .history(let id, let date, let localization):
            let formatter = DateFormatter()
            formatter.dateFormat = "dd-MM-yyyy"
            let dateString = formatter.string(from: date)

            var params = "?"
            params = "\(params)&date=\(dateString)"
            if let localization = localization { params = "\(params)&localization=\(localization)" }
            return "/coins/\(id)/history" + params
        case .charts(let id, let vs, let days, let interval):
            var params = "?"
            params += "&vs_currency=\(vs)"
            params += "&days=\(days)"
            if let interval = interval { params += "&interval=\(interval)" }
            return "/coins/\(id)/market_chart" + params
        case .chartRange(let id, let vs, let from, let to):
            var params = "?"
            params += "&vs_currency=\(vs)"
            params += "&from=\(from)"
            params += "&to=\(to)"
            return "/coins/\(id)/market_chart/range" + params
        case .ohlc(let id, let vs, let days)://(id: String, vs: String, days: String)
            var params = "?"
            params += "&vs_currency=\(vs)&days=\(days)"
            return "/coins/\(id)/ohlc" + params
            
            
        /*----------------------------------------------------------------------------------------
                                                Contract
         ----------------------------------------------------------------------------------------*/
        case .contract(let id, let address):
            return "/coins/\(id)/contract/\(address)"
        case .contractChart(let id, let contract, let vs, let days):
            var params = "?"
            params += "&vs_currency=\(vs)"
            params += "&days=\(days)"
            return "/coins/\(id)/contract/\(contract)/market_chart" + params
        case .contractChartRange(let id, let contract, let vs, let from, let to):
        //(id: String, contract: String, vs: String, from: String, to: String)
            var params = "?"
            params += "&vs_currency=\(vs)"
            params += "&from=\(from)"
            params += "&to=\(to)"
            return "/coins/\(id)/contract/\(contract)/market_chart/range" + params

        /*----------------------------------------------------------------------------------------
                                            AssetPlatforms
        ----------------------------------------------------------------------------------------*/
        case .assetPlatforms(let filter):
            var params = "?"
            if let filter = filter {
                params += "&filter=\(filter)"
            }
            return "/asset_platforms" + params
        /*----------------------------------------------------------------------------------------
                                            Categories
        ----------------------------------------------------------------------------------------*/
        case .categories:
            return "/coins/categories/list"
        case .category(let order):
            if let order = order {
                return "/coins/categories?&order=\(order)"
            }
            return "/coins/categories"
            
        /*----------------------------------------------------------------------------------------
                                                Exchange
        ----------------------------------------------------------------------------------------*/
        case .exchanges(let perPage, let page):
            var params = "?"
            params += "&per_page:\(perPage)"
            params += "&page:\(page)"
            return "/exchanges" + params
        case .exchangesList:
            return "/exchanges/list"
        case .exchange(let id):
            return "/exchanges/\(id)"
        case .exchangeTickers(let id, let coinIds, let includeLogo, let page, let depth, let order):
            var params = "?"
            if let coinIds = coinIds { params += "&coin_ids=\(coinIds)" }
            if let includeLogo { params += "&include_logo=\(includeLogo)" }
            if let page = page { params += "&page=\(page)" }
            if let depth = depth { params += "&depth=\(depth)" }
            if let order = order { params += "&order=\(order)" }
            return "/exchanges/\(id)/tickers"
        case .exchangeVolume(let id, let days)://id: String, days: Int)
            var params = "?"
            params += "days=\(days)"
            return "/exchanges/\(id)/volume_chart" + params
        // Indexes ----------------------
        case .indexes(let perPage, let page):
            var params = "?"
            params += "&per_page=\(perPage)"
            params += "&page=\(page)"
            return "/indexes" + params
        case .indexedMarket(let id, let marketId):
            return "/indexes/\(marketId)/\(id)"
        case .indexList:
            return "/indexes/list"

        /*----------------------------------------------------------------------------------------
                                            Derivatives
         ----------------------------------------------------------------------------------------*/
        case .derivatives:
            return "/derivatives"
        case .derivativesExchanges(let order, let perPage, let page):
            var params = "?"
            if let order = order { params += "&order=\(order)" }
            if let perPage = perPage { params += "&per_page=\(perPage)" }
            if let page = page { params += "&page=\(page)" }
            return "/derivatives/exchanges" + params
        case .derivativesExchange(let id, let includeTickers)://(id: String, includeTickers: String)
            var params = "?"
            params += "&include_tickers=\(includeTickers)"
            return "/derivatives/exchanges/\(id)" + params
        case .derivativesExchangeList:
            return "/derivatives/exchanges/list"
            
            
        /*----------------------------------------------------------------------------------------
                                                NFTs
         ----------------------------------------------------------------------------------------*/
        case .nfts(let order, let assetPlatformId, let perPage, let page):
            var params = ""
            if let order = order { params += "&order=\(order)" }
            if let assetPlatformId = assetPlatformId { params += "&order=\(assetPlatformId)" }
            if let perPage = perPage { params += "&order=\(perPage)" }
            if let page = page { params += "&order=\(page)" }

            if params.isEmpty {
                return "/nfts/list"
            }
            
            return "/nfts/list?" + params
        case .nft(let id):
            return "/nfts/\(id)"
        case .nftCollection(let platform, let contract):
            return "/nfts/\(platform)/contract/\(contract)"
        // Exchange Rates ----------------------
        case .exchangeRates:
            return "/exchange_rates"
        // Search ----------------------
        case .search(let query):
            return "/search?query=\(query)"
        // Trending ----------------------
        case .trending: return "/search/trending"
        // Global ----------------------
        case .global: return "/global"
        case .globalDefi: return "/global/decentralized_finance_defi"
        //companies ----------------------
        case .companies(let coinId): return  "/companies/public_treasury/\(coinId ?? "")"
        }
    }
    
    static var currenciesPriceHost = ""
    static var currenciesPriceAPIKey = ""
    public static func setAPI(priceHost: String, key: String) {
        CoinGecko.currenciesPriceHost = priceHost
        CoinGecko.currenciesPriceAPIKey = key
    }

    var request: URLRequest? {
        //let freeAPI = "\(Constants.currenciesPriceHostFree)\(path)"
        let proAPI = "\(CoinGecko.currenciesPriceHost)\(path)"

        guard let url = URL(string: proAPI) else { return nil }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        var headers = [String: String]()
        headers["X-Cg-Pro-Api-Key"] = CoinGecko.currenciesPriceAPIKey
        request.allHTTPHeaderFields = headers
        return request
    }

    public func getData() async throws -> Data? {
        guard let request = self.request else {
            throw CoinGecko.Errors.unknown(message: "Failed to get coingecko data \(self).")
        }
        do {
            let (data, response) = try await CoinGeckoSession.shared.urlSession.data(for: request)
            //print(response)
            return data
        } catch {
            throw CoinGecko.Errors.unknown(message: "Failed to get coingecko data \(self).")
        }
    }

    public func getJSON() async throws -> String? {
        do {
            if let data = try await getData() {
                return String(data: data, encoding: .utf8)
            }
        } catch {
            throw CoinGecko.Errors.unknown(message: "Failed to get coingecko data \(self).")
        }
        return nil
    }

    public func getObject<T: Decodable>() async throws -> T {
        do {
            if let data = try await getData() {
                return try JSONDecoder().decode(T.self, from: data)
            }
        } catch {
            print("error!!")
            throw CoinGecko.Errors.unknown(message: "Failed to get coingecko data \(self).")
        }
        throw CoinGecko.Errors.unknown(message: "Failed to get coingecko data \(self).")
    }

    class CoinGeckoSession {
        static var shared: CoinGeckoSession = CoinGeckoSession()
        lazy var configuration: URLSessionConfiguration = {
            return URLSessionConfiguration.default
        }()
        lazy var urlSession: URLSession  = {
            return URLSession(configuration: configuration)
        }()
    }



}

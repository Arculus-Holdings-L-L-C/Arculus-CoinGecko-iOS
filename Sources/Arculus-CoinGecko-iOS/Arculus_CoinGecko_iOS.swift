// Copyright (c) 2020-2023 Arculus Holdings, L.L.C.  All rights reserved.
//
// This software is confidential and proprietary information of
// Arculus Holdings, L.L.C.  All use and disclosure to third parties is
// subject to the confidentiality provisions of the license agreement
// accompanying the software.
// This copyright notice and disclaimer shall be included with all copies
// of this software used in derivative works.
//
// "Arculus" and the guardian logo are registered trademarks of
// Arculus Holdings, L.L.C., as are their respective typographic forms
// presented in this document.
//
// THIS SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
// EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
// MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
// IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS OF THIS SOFTWARE BE
// LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
// OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
// WITH THIS SOFTWARE OR THE USE, MODIFICATION, DISTRIBUTION, OR OTHER
// DEALINGS IN THIS SOFTWARE OR ITS DERIVATIVES.
//
import Foundation

public struct Arculus_CoinGecko_iOS {
    public private(set) var text = "Hello, World!"

    public init() {
    }
}


public enum CoinGecko {
    // swiftlint:disable nesting
    // Follows the specification here:
    // https://www.coingecko.com/en/api/documentation
    // Ping
    case ping
    // Simple
    case price(id: String, vs: String, marketcap: Bool=false, vol24hr: Bool=false,
               change24hr: Bool=false, lastUpdated: Bool=false, precision: Precision?=nil)
    case tokenPrice(id: String, contract: String, vs: String, marketCap: Bool=false, vol24hr: Bool=false,
                    change24hr: Bool=false, lastUpdated: Bool=false, precision: Precision?=nil)
    case supportedVsCurrencies
    // Coins
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
        // Simple ----------------------
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
        // Coins ----------------------
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
        // Contract ----------------------
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
        // AssetPlatforms
        case .assetPlatforms(let filter):
            var params = "?"
            if let filter = filter {
                params += "&filter=\(filter)"
            }
            return "/asset_platforms" + params
        // Categories ----------------------
        case .categories:
            return "/coins/categories/list"
        case .category(let order):
            if let order = order {
                return "/coins/categories?&order=\(order)"
            }
            return "/coins/categories"
        // Exchange ----------------------
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
        // Derivatives ----------------------
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
        // NFTS ----------------------
        case .nfts(let order, let assetPlatformId, let perPage, let page):
            var params = "?"
            if let order = order { params += "&order=\(order)" }
            if let assetPlatformId = assetPlatformId { params += "&order=\(assetPlatformId)" }
            if let perPage = perPage { params += "&order=\(perPage)" }
            if let page = page { params += "&order=\(page)" }

            return "/nfts/list" + params
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
            print(response)
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

    public enum Order: String {
        case marketCapAsc = "market_cap_asc"
        case marketCapDesc = "market_cap_desc"
        case volumeAsc = "volume_asc"
        case volumeDesc = "volume_desc"
        case idAsc = "id_asc"
        case idDesc = "id_desc"
    }

    public enum TickerOrder: String {
        case trustScoreDesc = "trust_score_desc" //(default),
        case trustScoreAsc = "trust_score_asc"
        case volumeDesc = "volume_desc"
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

    public struct MarketData: Codable, Equatable {
        enum CodingKeys: String, CodingKey {
            case currentPrice = "current_price"
        }

        var currentPrice: [String: Double]
    }

    public struct CommunityData: Codable {
        enum CodingKeys: String, CodingKey {
            case facebookLikes = "facebook_likes"
            case twitterFollowers = "twitter_followers"
            case redditAveragePosts48h = "reddit_average_posts_48h"
            case redditAverageComments48h = "reddit_average_comments_48h"
            case redditSubscribers = "reddit_subscribers"
            case redditAccountsActive48h = "reddit_accounts_active_48h"
            case telegramChannelUserCount = "telegram_channel_user_count"

        }
        var facebookLikes: Int?
        var twitterFollowers: Int?
        var redditAveragePosts48h: Int?
        var redditAverageComments48h: Int?
        var redditSubscribers: Int?
        var redditAccountsActive48h: Int?
        var telegramChannelUserCount: Int?
    }

    public struct DeveloperData: Codable {
        enum CodingKeys: String, CodingKey {
            case forks
            case stars
            case subscribers
            case totalIssues = "total_issues"
            case closedIssues = "closed_issues"
            case pullRequestsMerged = "pull_requests_merged"
            case pullRequestContributors = "pull_request_contributors"
            case codeAdditionsDeletions4Weeks = "code_additions_deletions_4_weeks"
            case commitCount4Weeks = "commit_count_4_weeks"
            //case last4WeeksCommitActivitySeries = "last_4_weeks_commit_activity_series"
        }

        var forks: Int?
        var stars: Int?
        var subscribers: Int?
        var totalIssues: Int?
        var closedIssues: Int?
        var pullRequestsMerged: Int?
        var pullRequestContributors: Int?
        var codeAdditionsDeletions4Weeks: [String: Int?]
        var commitCount4Weeks: Int?
        //Commented out, missing type in empty JSON array
        //var last4WeeksCommitActivitySeries = []
    }

    public struct Ticker: Codable {

        enum CodingKeys: String, CodingKey {
            case base
            case target
            //case market
            case last
            case volume
            case convertedLast = "converted_last"
            case convertedVolume = "converted_volume"
            case trustScore = "trust_score"
            case bidAskSpreadPercentage = "bid_ask_spread_percentage"

            case timestamp = "time_stamp"
            case lastTradedAt = "last_traded_at"
            case lastFetchAt = "last_fetch_at"
            case isAnomaly = "is_anomaly"
            case isState = "is_state"
            case tradeURL = "trade_url"
            case tokenInfoURL = "token_info_url"
            case coinId = "coin_id"
            case targetCoinId = "target_coin_id"
        }

        var base: String
        var target: String
        //var market
        var last: Double
        var volume: Double
        var convertedLast: [String: Double]
        var convertedVolume: [String: Double]
        var trustScore: String?
        var bidAskSpreadPercentage: Double?

        var timestamp: String?
        var lastTradedAt: String?
        var lastFetchAt: String?
        var isAnomaly: Bool?
        var isState: Bool?
        var tradeURL: String?
        var tokenInfoURL: String?
        var coinId: String?
        var targetCoinId: String?
    }

    public struct ContractLinks: Codable {
        enum CodingKeys: String, CodingKey {
            case homepage = "homepage"
            case blockchainSite = "blockchain_site"
            case officialForumUrl = "official_forum_url"
            case chatUrl = "chat_url"
            case announcementUrl = "announcement_url"
            case twitterScreenName = "twitter_screen_name"
            case facebookUsername = "facebook_username"
            case bitcointalkThreadIdentifier = "bitcointalk_thread_identifier"
            case telegramChannelIdentifier = "telegram_channel_identifier"
            case subredditURL = "subreddit_url"
            case repos = "repos_url"
        }
        public var homepage: [String]?
        public var blockchainSite: [String]?
        public var officialForumUrl: [String]?
        public var chatUrl: [String]?
        public var announcementUrl: [String]?
        public var twitterScreenName: String?
        public var facebookUsername: String?
        public var bitcointalkThreadIdentifier: Int64?
        public var telegramChannelIdentifier: String?
        public var subredditURL: String?
        public var repos: [String: [String]]?
    }

    public struct Coin: Codable, Hashable {
        enum CodingKeys: String, CodingKey {
            case id
            case symbol
            case name
            case assetPlatformId = "asset_platform_id"
            case image
            case contractAddress = "contract_address"
        }
        public var id: String
        public var symbol: String?
        public var name: String?
        public var assetPlatformId: String?
        public var image: [String: String]?
        public var contractAddress: String?

        public var largeImageURL: URL? {
            return URL(string: image?["large"] ?? "")
        }

        public func hash(into hasher: inout Hasher) {
            hasher.combine(self.id)
        }
    }

    public struct SearchResultCoin: Codable {
        enum CodingKeys: String, CodingKey {
            case id
            case name
            case apiSymbol = "api_symbol"
            case symbol
            case marketCapRank = "market_cap_rank"
            case thumb
            case large
        }

        public var id: String// "rif-token"
        public var name: String?// "RSK Infrastructure Framework"
        public var apiSymbol: String?// "rif-token"
        public var symbol: String?// "RIF"
        public var marketCapRank: Int64?// 278
        public var thumb: String?// "https://assets.coingecko.com/coins/images/7460/thumb/RIF.png"
        public var large: String?// "https://assets.coingecko.com/coins/images/7460/large/RIF.png"
    }

    public struct SearchResults: Codable {
        public var coins: [SearchResultCoin]
//        var exchanges: [String]
//        var icos: [String]
//        var categories: [String]
//        var nfts: [String]
    }

    public struct ContractInfoDetails: Codable {
        enum CodingKeys: String, CodingKey {
            case decimalPlace = "decimal_place"
            case contractAddress = "contract_address"
        }
        var decimalPlace: Int?
        var contractAddress: String?
    }
    
    public struct ContractInfo: Codable, Equatable {
        public static func == (lhs: CoinGecko.ContractInfo, rhs: CoinGecko.ContractInfo) -> Bool {
            lhs.id == rhs.id
        }

        enum CodingKeys: String, CodingKey {
            case id,
                 symbol,
                 name,
                 image,
                 platforms,
                 categories,//tickers,
                 localization,
                 description,
                 links
            case assetPlatformId = "asset_platform_id"
            case detailPlatforms = "detail_platforms"
            case blockTimeInMinutes = "block_time_in_minutes"
            case hashingAlgorithm = "hashing_algorithm"
            case publicNotice = "public_notice"
            case additionalNotices = "additional_notices"
            case countryOrigin = "country_origin"
            case genesisDate = "genesis_date"
            case contractAddress = "contract_address"
            case sentimentVotesUpPercentage = "sentiment_votes_up_percentage"
            case sentimentVotesDownPercentage = "sentiment_votes_down_percentage"
            case watchlistPortfolioUsers = "watchlist_portfolio_users"
            case marketCapRank = "market_cap_rank"
            case coingeckoRank = "coingecko_rank"
            case coingeckoScore = "coingecko_score"
            case developerScore = "developer_score"
            case communityScore = "community_score"
            case liquidityScore = "liquidity_score"
            case publicInterestScore = "public_interest_score"
//            case marketData = "market_data"
//            case communityData = "community_data"
//            case developerData = "developer_data"
//            case publicInterestStats = "public_interest_stats"
            case lastUpdated = "last_updated"
        }

        public var id: String
        public var symbol: String
        public var name: String

        public var assetPlatformId: String
        public var platforms: [String: String]?

        public var detailPlatforms: [String: ContractInfoDetails]?

        public var blockTimeInMinutes: Int
        public var hashingAlgorithm: String?

        public var categories: [String]

        public var publicNotice: String?

        public var additionalNotices: [String]

        public var localization: [String: String]
        public var description: [String: String]
        public var links: ContractLinks?

        public var image: [String: String]

        public var countryOrigin: String?
        public var genesisDate: String?

        public var contractAddress: String
        public var sentimentVotesUpPercentage: Double?
        public var sentimentVotesDownPercentage: Double?
        public var watchlistPortfolioUsers: Double?
        public var marketCapRank: Int?
        public var coingeckoRank: Int?
        public var coingeckoScore: Double?
        public var developerScore: Double?
        public var communityScore: Double?
        public var liquidityScore: Double?
        public var publicInterestScore: Double?

       // var marketData: MarketData

        //var communityData: CommunityData
        //var developerData: DeveloperData
        //var publicInterestStats: [String: Int?]

        //var statusUpdates: [String: String]

        public var lastUpdated: String
        //var tickers: [Ticker]

        public var largeImageURL: URL? { URL(string: image["large"] ?? "") }
        public var smallImageURL: URL? { URL(string: image["small"] ?? "") }
        public var thumbImageURL: URL? { URL(string: image["thumb"] ?? "") }
    }
    // swiftlint:enable nesting
    public enum Errors: Error {
        case unknown(message: String)
    }

}

// Extension for printing the example results
extension CoinGecko {
    func testJSON() async {
        if let json = try? await getJSON() {
            print("\n--> \(self)")
            print(json)
            print("<-- \(self)\n")
        } else {
            print("no json")
        }
    }

    static func testPing() {
        Task {
            if let json = try? await CoinGecko.ping.getJSON() {
                print(json)
            }
        }
    }

    static func testCoinGecko() {
        Task {
            let vs = "usd"
            let pepe = "0x6982508145454ce325ddbe47a25d4ec3d2311933"

            await CoinGecko.ping.testJSON()
            await CoinGecko.price(id: "bitcoin", vs: vs).testJSON()
            await CoinGecko.tokenPrice(id: "ethereum", contract: pepe, vs: vs).testJSON()
            await CoinGecko.supportedVsCurrencies.testJSON()

            // Coins
            await CoinGecko.coins().testJSON()
            await CoinGecko.markets(vs: vs).testJSON()
            await CoinGecko.coin(id: "bitcoin").testJSON()
            await CoinGecko.tickers(id: "bitcoin", exchangeIds: "binance", includeLogo: true).testJSON()

            var components = DateComponents()
            components.month = 1
            components.day = 1
            components.year = 2020
            if let date = Calendar.current.date(from: components) {
                await CoinGecko.history(id: "bitcoin", date: date).testJSON()
            }
            await CoinGecko.charts(id: "bitcoin", vs: vs, days: "14", interval: "daily").testJSON()
            await CoinGecko.chartRange(id: "bitcoin", vs: vs, from: "1392577232", to: "1422577232").testJSON()

            //days == (1/7/14/30/90/180/365/max)
            await CoinGecko.ohlc(id: "bitcoin", vs: vs, days: "14").testJSON()
            //    // Contract
            await CoinGecko.contract(id: "ethereum", contract: pepe).testJSON()
            await CoinGecko.contractChart(id: "ethereum", contract: pepe, vs: vs, days: "14").testJSON()

            await CoinGecko.contractChartRange(id: "ethereum", contract: pepe, vs: vs,
                                                from: "1392577232", to: "1422577232").testJSON()

            // AssetPlatforms
            await CoinGecko.assetPlatforms(filter: nil).testJSON()

            // Categories
            await CoinGecko.categories.testJSON()
            await CoinGecko.category(order: nil).testJSON()

            // Exchange
            await CoinGecko.exchanges(perPage: 100, page: 1).testJSON()

            await CoinGecko.exchangesList.testJSON()
            await CoinGecko.exchange(id: "binance").testJSON()

            await CoinGecko.exchangeTickers(id: "binance", coinIds: "bitcoin", includeLogo: nil,
                                                page: 1, depth: "1", order: nil).testJSON()
            await CoinGecko.exchangeVolume(id: "binance", days: 1).testJSON()
            // Indexes
            await CoinGecko.indexes(perPage: 1, page: 1).testJSON()
            await CoinGecko.indexList.testJSON()

            // NOT working yet
            // await CoinGecko.indexedMarket(marketId: "BTC", id: "BTC").testJSON()

            // Derivatives
            await CoinGecko.derivatives(includeTickers: nil).testJSON()
            await CoinGecko.derivativesExchanges(order: nil, perPage: nil, page: nil).testJSON()
            await CoinGecko.derivativesExchange(id: "gmo_japan_futures", includeTickers: "false").testJSON()
            await CoinGecko.derivativesExchangeList.testJSON()
            // NFTS
            await CoinGecko.nfts(order: nil, assetPlatformId: nil, perPage: nil, page: nil).testJSON()
            await CoinGecko.nft(id: "squiggly").testJSON()
            //Not found (?)
            await CoinGecko.nftCollection(assetPlatformId: "etherem",
                                            contract: "0x8a90CAb2b38dba80c64b7734e58Ee1dB38B8992e").testJSON()
            // Exchange Rates
            await CoinGecko.exchangeRates.testJSON()
            // Search
            await CoinGecko.search(query: "punks").testJSON()
            // Trending
            await CoinGecko.trending.testJSON()
            // Global
            await CoinGecko.global.testJSON()
            await CoinGecko.globalDefi.testJSON()
            // companies
            await CoinGecko.companies(coinId: "bitcoin").testJSON()
        }
    }
}

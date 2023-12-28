//
//  File.swift
//  
//
//  Created by Sean Orelli on 12/20/23.
//

import Foundation

// Extension for printing the example results
public extension CoinGecko {
    static let vs = "usd"

    static func testCoinGecko() {
        Task {
//            await testPing()
//            await testSimple()
            await testCoins()
        }
    }

    func testJSON() async {
        if let json = try? await getJSON() {
            print(json)
        } else {
            print("no json")
        }
    }

    static func testPing() async {
        //Ping
        print("Ping: ------------------------------------------")
        await CoinGecko.ping.testJSON()
        /*
        {"gecko_says":"(V3) To the Moon!"}
        */
    }

    static func testSimple() async {
        print("")
        print("Simple: ------------------------------------------")

        await CoinGecko.price(id: "bitcoin", vs: vs).testJSON()
        //{"bitcoin":{"usd":43713}}

        let pepe = "0x6982508145454ce325ddbe47a25d4ec3d2311933"
        await CoinGecko.tokenPrice(id: "ethereum", contract: pepe, vs: vs).testJSON()
        //{"0x6982508145454ce325ddbe47a25d4ec3d2311933":{"usd":1.48e-06}}
        await CoinGecko.supportedVsCurrencies.testJSON()

    }

    static func testCoins() async {
        //
        //await CoinGecko.coins().testJSON()
        //await CoinGecko.coins(includePlatform: false).testJSON()
        print("?")
        //await CoinGecko.markets(vs: vs).testJSON()
        /*
        let markets = await Market.getMarkets()
        markets.forEach {
            print($0.name ?? "?")
        }
        print(markets.count)
        print("")
        */
        
        /*
        await CoinGecko.markets(vs: vs,
                                ids: "btc",
                                category: nil,
                                order: .marketCapDesc,
                                perPage: 100, 
                                page: 1,
                                sparkline: false,
                                priceChangePercentage: [],
                                locale: .en)
         */
    /*
        await CoinGecko.coin(id: String, 
                            localization: String? = nil,
                            tickers: Bool = false,
                            smarketData: Bool = false,
                            communityData: Bool = false, 
                            devData: Bool = false,
                            sparkline: Bool = false)
     */
        
//        let tickers: [Ticker] = await Ticker.get(coin: "bitcoin", exchange: "gemini", page: 1)
//        print("???")
//        await CoinGecko.history(id: "bitcoin",date: Date(), localization: nil).testJSON()
        
        /*
        if let response = await History.get(coin: "bitcoin", date: Date()) {
            print(response)
        }
         */

        
        await CoinGecko.charts(id: "bitcoin", vs: "usd", days: "21", interval: nil).testJSON()
        
        /*
        await CoinGecko.chartRange(id: String, vs: String, from: String, to: String)
        await CoinGecko.ohlc(id: String, vs: String, days: String)
         */
    }
    
    
    static func testContract() async {
        
    }

    static func testAssetPlatforms() async {
        
    }
    
    static func testCategories() async {
        
    }

    static func testExchanges() async {
        
    }

    static func testDerivatives() async {
        
    }
    
    static func testNFTs() async {
        
    }
    
    static func testExchangeRates() async {
        
    }

    static func testSearch() async {
        
    }

    static func testTrending() async {
        
    }

    static func testGlobal() async {
        
    }
    
    static func testCompanies() async {
        
    }


    //----
    
    static func testCoinGecko_() {
        Task {
            let vs = "usd"
            let pepe = "0x6982508145454ce325ddbe47a25d4ec3d2311933"
            
       
            /*
             //Ping
             await CoinGecko.ping.testJSON()
             //{"gecko_says":"(V3) To the Moon!"}
             
             await CoinGecko.price(id: "bitcoin", vs: vs).testJSON()
             //{"bitcoin":{"usd":43713}}
             
             await CoinGecko.tokenPrice(id: "ethereum", contract: pepe, vs: vs).testJSON()
             
             await CoinGecko.supportedVsCurrencies.testJSON()
             */
            
            /*
             ["btc","eth","ltc","bch","bnb","eos","xrp","xlm","link","dot","yfi","usd","aed","ars","aud","bdt","bhd","bmd","brl","cad","chf","clp","cny","czk","dkk","eur","gbp","gel","hkd","huf","idr","ils","inr","jpy","krw","kwd","lkr","mmk","mxn","myr","ngn","nok","nzd","php","pkr","pln","rub","sar","sek","sgd","thb","try","twd","uah","vef","vnd","zar","xdr","xag","xau","bits","sats"]
             */
            
            // Coins
            //await CoinGecko.coins().testJSON()
            /*
             [{"id":"zyx","symbol":"zyx","name":"ZYX"},{"id":"zzz","symbol":"zzz","name":"GoSleep ZZZ"}]
             */
            //await CoinGecko.markets(vs: vs).testJSON()
            await Market.get()

            /*
             [{"id":"frax","symbol":"frax","name":"Frax","image":"https://assets.coingecko.com/coins/images/13422/large/FRAX_icon.png?1696513182","current_price":0.999338,"market_cap":648090100,"market_cap_rank":100,"fully_diluted_valuation":648090100,"total_volume":10175207,"high_24h":1.004,"low_24h":0.996534,"price_change_24h":0.00020743,"price_change_percentage_24h":0.02076,"market_cap_change_24h":-1225498.098142147,"market_cap_change_percentage_24h":-0.18874,"circulating_supply":649462235.510511,"total_supply":649462235.510511,"max_supply":null,"ath":1.14,"ath_change_percentage":-12.48192,"ath_date":"2021-02-07T12:55:35.766Z","atl":0.874536,"atl_change_percentage":14.12916,"atl_date":"2023-03-11T07:50:39.316Z","roi":null,"last_updated":"2023-12-21T20:49:29.000Z"}]
             */
            
            //await CoinGecko.coin(id: "bitcoin").testJSON()
            
            //await CoinGecko.tickers(id: "bitcoin", exchangeIds: "binance", includeLogo: true).testJSON()
            
            /*
             var components = DateComponents()
             components.month = 1
             components.day = 1
             components.year = 2020
             if let date = Calendar.current.date(from: components) {
             await CoinGecko.history(id: "bitcoin", date: date).testJSON()
             }
             
             {"id":"bitcoin","symbol":"btc","name":"Bitcoin","localization":{"en":"Bitcoin","de":"Bitcoin","es":"Bitcoin","fr":"Bitcoin","it":"Bitcoin","pl":"Bitcoin","ro":"Bitcoin","hu":"Bitcoin","nl":"Bitcoin","pt":"Bitcoin","sv":"Bitcoin","vi":"Bitcoin","tr":"Bitcoin","ru":"Биткоин","ja":"ビットコイン","zh":"比特币","zh-tw":"比特幣","ko":"비트코인","ar":"بيتكوين","th":"บิตคอยน์","id":"Bitcoin","cs":"Bitcoin","da":"Bitcoin","el":"Bitcoin","hi":"Bitcoin","no":"Bitcoin","sk":"Bitcoin","uk":"Bitcoin","he":"Bitcoin","fi":"Bitcoin","bg":"Bitcoin","hr":"Bitcoin","lt":"Bitcoin","sl":"Bitcoin"},"image":{"thumb":"https://assets.coingecko.com/coins/images/1/thumb/bitcoin.png?1696501400","small":"https://assets.coingecko.com/coins/images/1/small/bitcoin.png?1696501400"},"market_data":{"current_price":{"aed":26429.239288693556,"ars":430563.0457102599,"aud":10256.814195551682,"bch":35.13945542496315,"bdt":610699.0910671571,"bhd":2712.9039956563156,"bmd":7195.153895430029,"bnb":524.566548150439,"brl":28924.295609858014,"btc":1.0,"cad":9358.37691409107,"chf":6960.591878439016,"clp":5320108.748626738,"cny":50102.01512004795,"czk":163099.02898621798,"dkk":47942.74943602943,"eos":2781.8809082604266,"eth":55.68501916033821,"eur":6412.84639784161,"gbp":5425.8655525437825,"hkd":56039.81587225152,"huf":2124570.2346158647,"idr":99890321.53025515,"ils":24853.50058559437,"inr":513021.6678980566,"jpy":782005.0213052781,"krw":8308532.009208873,"kwd":2181.5490756326963,"lkr":1304735.8218832046,"ltc":174.0887420294398,"mmk":10617722.546529299,"mxn":136221.53160983959,"myr":29431.777009256508,"ngn":2634262.359439116,"nok":63458.37929613472,"nzd":10707.086926327705,"php":364151.9191585182,"pkr":1114376.139185372,"pln":27382.95693753285,"rub":446424.58259388816,"sar":26989.77055776315,"sek":67403.48217699902,"sgd":9704.82357415603,"thb":213659.11638386527,"try":42802.53149313422,"twd":215228.63847399823,"uah":170486.3942228111,"usd":7195.153895430029,"vef":1787906827.0365582,"vnd":166781105.77811068,"xag":402.92063152325767,"xau":4.74225398093898,"xdr":5197.441001825567,"xlm":159772.2653475453,"xrp":37279.9468250421,"zar":100810.58171348099,"bits":1000000.0,"link":4081.726593175324,"sats":100000000.0},"market_cap":{"aed":478963613760.60187,"ars":7802874311761.97,"aud":185879008438.73853,"bch":638130211.830908,"bdt":11067387917705.709,"bhd":49164574407.59552,"bmd":130394101535.60994,"bnb":9512105655.391987,"brl":524180245956.0041,"btc":18133612.0,"cad":169571009341.9838,"chf":126169332645.85617,"clp":96413615390426.6,"cny":907973247222.9128,"czk":2955760454199.053,"dkk":868841977352.0753,"eos":50408765192.17884,"eth":1009403636.7485448,"eur":116216742057.94763,"gbp":98321585957.30197,"hkd":1015580979515.1743,"huf":38502501950373.88,"idr":1807698741538442.8,"ils":450407305524.30273,"inr":9297229833590.52,"jpy":14171877854371.15,"krw":150571284807230.16,"kwd":39535100403.29221,"lkr":23645061343836.375,"ltc":3159416802.5094233,"mmk":192419566270630.78,"mxn":2468673287912.774,"myr":533377072331.4125,"ngn":47739392174267.07,"nok":1150023817903.465,"nzd":194039071312.83557,"php":6599339362470.323,"pkr":20195269976656.117,"pln":496247351919.1479,"rub":8090324848744.69,"sar":489121835846.63226,"sek":1221518903775.4395,"sgd":175875564151.23047,"thb":3872035111502.13,"try":775688431215.036,"twd":3904781764585.3643,"uah":3089637903763.088,"usd":130394101535.60994,"vef":32401322852717264,"vnd":3022488852512928,"xag":7301924948.541439,"xau":85941448.38110517,"xdr":94190570426.55246,"xlm":2894760808357.26,"xrp":676094242400.8256,"zar":1826938717205.2742,"bits":18133612000000.0,"link":74016446330.72318,"sats":1813361200000000},"total_volume":{"aed":77827334447.92458,"ars":1267897792795.9072,"aud":30203688424.317142,"bch":103476688.06519522,"bdt":1798352267666.6733,"bhd":7988806801.767466,"bmd":21187883711.18498,"bnb":1544714009.251215,"brl":85174635694.56873,"btc":2944568.336386035,"cad":27558020948.95275,"chf":20497158702.200367,"clp":15666356430312.902,"cny":147537590646.09445,"czk":480284829176.76886,"dkk":141179106744.36792,"eos":8191926126.83718,"eth":163978106.31593695,"eur":18884188678.918976,"gbp":15977783106.604584,"hkd":165022891678.7497,"huf":6256314697574.03,"idr":294151389562381.25,"ils":73187187915.17505,"inr":1510717296491.2004,"jpy":2302804317153.343,"krw":24466496836653.746,"kwd":6424102777.580146,"lkr":3842112520405.858,"ltc":512646716.8254777,"mmk":31266470997427.375,"mxn":401137489573.6388,"myr":86669038320.60208,"ngn":7757227343253.64,"nok":186868659179.16714,"nzd":31529626186.96313,"php":1072334049899.343,"pkr":3281552054442.5806,"pln":80635788433.84229,"rub":1314605952740.1223,"sar":79477955340.56078,"sek":198485975818.00992,"sgd":28578217549.646317,"thb":629171325251.4542,"try":126042482621.09738,"twd":633793165452.6757,"uah":502038726013.41614,"usd":21187883711.18498,"vef":5264927267468855,"vnd":491127601411540.25,"xag":1186497969.2754393,"xau":13964722.275204914,"xdr":15305131362.4256,"xlm":470488363092.0664,"xrp":109779886513.5939,"zar":296861319889.0428,"bits":2944568336386.035,"link":12018922884.048903,"sats":294456833638603.5}},"community_data":{"facebook_likes":null,"twitter_followers":68375,"reddit_average_posts_48h":7.182,"reddit_average_comments_48h":262.727,"reddit_subscribers":1232212,"reddit_accounts_active_48h":"4778.41666666667"},"developer_data":{"forks":24863,"stars":41739,"subscribers":3505,"total_issues":0,"closed_issues":0,"pull_requests_merged":7080,"pull_request_contributors":629,"code_additions_deletions_4_weeks":{"additions":809,"deletions":-543},"commit_count_4_weeks":183},"public_interest_stats":{"alexa_rank":null,"bing_matches":null}}
             */
            
            //await CoinGecko.charts(id: "bitcoin", vs: vs, days: "14", interval: "daily").testJSON()
            /*
             {"prices":[[1701993600000,43270.11955970747],[1702080000000,44202.17610943621],[1702166400000,43745.49199189547],[1702252800000,43757.959937619176],[1702339200000,41200.96272610168],[1702425600000,41450.819387377436],[1703030400000,23402523667.558952],[1703116800000,28334648885.87903],[1703195242000,19904113159.286293]]}
             */
            
            //await CoinGecko.chartRange(id: "bitcoin", vs: vs, from: "1392577232", to: "1422577232").testJSON()
            /*
             {"prices":[[1392595200000,645.14],[1392681600000,625.01],[1392768000000,620.99],[1422316800000,339951744.7443284],[1422489600000,161971565.54864252],[1422576000000,105832532.60469383]]}
             */

            //days == (1/7/14/30/90/180/365/max)
            //await CoinGecko.ohlc(id: "bitcoin", vs: vs, days: "14").testJSON()
            /*
             [[1701993600000,43378.0,43378.0,43166.0,43166.0],[1702008000000,43270.0,43512.0,43270.0,43512.0],[1702022400000,43390.0,43470.0,43361.0,43361.0],[1702036800000,43208.0,43330.0,43174.0,43330.0],[1703174400000,43911.0,44215.0,43762.0,43762.0],[1703188800000,43731.0,43731.0,43419.0,43554.0],[1703203200000,43572.0,43753.0,43572.0,43753.0]]
             */
            
            //    // Contract
            // await CoinGecko.contract(id: "ethereum", contract: pepe).testJSON()
            
            //await CoinGecko.contractChart(id: "ethereum", contract: pepe, vs: vs, days: "14").testJSON()
            /*
             {"prices":[[1701990018353,1.5302295280319894e-06],[1701993628535,1.520709238040399e-06],[1701997226146,1.5260797100649155e-06],[1702000844857,1.5266724544977269e-06],[1702026009481,1.537638585491765e-06],[1702029623864,1.5340050201599042e-06],[1702782036718,112349552.9190863],[1702785648626,115129311.91550863],[1703196223000,74906333.37018964]]}
             */
            
            
            /*
             await CoinGecko.contractChartRange(id: "ethereum", contract: pepe, vs: vs,
             from: "1392577232", to: "1422577232").testJSON()
             */
            // AssetPlatforms
            //await CoinGecko.assetPlatforms(filter: nil).testJSON()
            // [{"id":"flow","chain_identifier":null,"name":"Flow","shortname":"","native_coin_id":"flow"},
            // Categories
            //await CoinGecko.categories.testJSON()
            //[{"category_id":"cardano-ecosystem","name":"Cardano Ecosystem"}]
            
            //await CoinGecko.category(order: nil).testJSON()
            
            // Exchange
            //await CoinGecko.exchanges(perPage: 100, page: 1).testJSON()
            
            //await CoinGecko.exchangesList.testJSON()
            
            
            //await CoinGecko.exchange(id: "binance").testJSON()
            /*
             
             
             await CoinGecko.exchangeTickers(id: "binance", coinIds: "bitcoin", includeLogo: nil,
             page: 1, depth: "1", order: nil).testJSON()
             */
            
            //await CoinGecko.exchangeVolume(id: "binance", days: 1).testJSON()
            //[[1703124000000.0,"371770.8971686936174152"],[1703124600000.0,"372702.7317215256861631"]]
            // Indexes
            //            await CoinGecko.indexes(perPage: 1, page: 1).testJSON()
            //[{"name":"ZB (Derivatives) PEOPLE","id":"PEOPLE","market":"ZB (Derivatives)","last":0.02973,"is_multi_asset_composite":false}]
            
            //await CoinGecko.indexList.testJSON()
            
            // NOT working yet
            // await CoinGecko.indexedMarket(marketId: "BTC", id: "BTC").testJSON()
            
            // Derivatives
            // await CoinGecko.derivatives(includeTickers: nil).testJSON()
            /*
            await CoinGecko.derivativesExchanges(order: nil, perPage: nil, page: nil).testJSON()
            [{"name":"Binance (Futures)","id":"binance_futures","open_interest_btc":267329.18,"trade_volume_24h_btc":"1145020.75","number_of_perpetual_pairs":299,"number_of_futures_pairs":33,"image":"https://assets.coingecko.com/markets/images/466/small/binance_futures.jpg?1568609512","year_established":2019,"country":null,"description":"","url":"https://www.binance.com/"},{"name":"Bybit (Futures)","id":"bybit","open_interest_btc":164403.53,"trade_volume_24h_btc":"332000.46","number_of_perpetual_pairs":321,"number_of_futures_pairs":82,"image":"https://assets.coingecko.com/markets/images/460/small/photo_2021-08-12_18-27-50.jpg?1628764200","year_established":2018,"country":null,"description":"Bybit is a cryptocurrency exchange that offers a professional platform featuring an ultra-fast matching engine, excellent customer service and multilingual community support for crypto traders of all levels. Established in March 2018, Bybit currently serves more than 10 million users and institutions offering access to over 100 assets and contracts across Spot, Futures and Options, launchpad projects, earn products, an NFT Marketplace and more. Bybit is a proud partner of Formula One racing team, Oracle Red Bull Racing, esports teams NAVI, Astralis, Alliance, Virtus.pro, Made in Brazil (MIBR), City Esports, and Oracle Red Bull Racing Esports, and association football (soccer) teams Borussia Dortmund and Avispa Fukuoka.","url":"https://www.bybit.com"},{"name":"Deepcoin (Derivatives)","id":"deepcoin_derivatives","open_interest_btc":145280.14,"trade_volume_24h_btc":"128025.35","number_of_perpetual_pairs":107,"number_of_futures_pairs":0,"image":"https://assets.coingecko.com/markets/images/948/small/deepcoin.jpeg?1689269680","year_established":2018,"country":"Singapore","description":"","url":"https://www.deepcoin.com/"}]
            */
            

            //await CoinGecko.derivativesExchange(id: "gmo_japan_futures", includeTickers: "false").testJSON()
            /*
             {"name":"GMO Japan (Futures)","open_interest_btc":null,"trade_volume_24h_btc":"1873.73","number_of_perpetual_pairs":5,"number_of_futures_pairs":0,"image":"https://assets.coingecko.com/markets/images/439/small/GMO.png?1562585771","year_established":2016,"country":"Japan","description":"","url":"https://coin.z.com/jp/","tickers":[{"symbol":"BCH_JPY","base":"BCH","target":"JPY","trade_url":"https://coin.z.com/jp/corp/information/bch-market/","contract_type":"perpetual","last":33302.0,"h24_percentage_change":0.817,"index":null,"index_basis_percentage":0.0,"bid_ask_spread":0.00282265329409645,"funding_rate":0.0,"open_interest_usd":0.0,"h24_volume":327.7,"converted_volume":{"btc":"1.7461251688061594191660467488","eth":"34.25515631601854788189062116842823499360704","usd":"76751.49908219457606148178567871055786645632"},"converted_last":{"btc":"0.005328425904199448944662944","eth":"0.1045320607751557762645426340202265333952","usd":"234.2126917369379800472437768651527551616"},"last_traded":1703199494,"expired_at":null},{"symbol":"BTC_JPY","base":"BTC","target":"JPY","trade_url":"https://coin.z.com/jp/corp/information/btc-market/","contract_type":"perpetual","last":6247574.0,"h24_percentage_change":-0.205,"index":null,"index_basis_percentage":0.0,"bid_ask_spread":0.000347570946139939,"funding_rate":0.0,"open_interest_usd":0.0,"h24_volume":1466.6,"converted_volume":{"btc":"1466.0598629610339597902813558848","eth":"28760.88763367798198148275545940388871246067584","usd":"64441137.57516510058267007415992563484077500672"},"converted_last":{"btc":"0.999631708005614318689677728","eth":"19.6105875042124519170071972312858916626624","usd":"43939.1364892711718141756949133544489572992"},"last_traded":1703199494,"expired_at":null},{"symbol":"ETH_JPY","base":"ETH","target":"JPY","trade_url":"https://coin.z.com/jp/corp/information/eth-market/","contract_type":"perpetual","last":319231.0,"h24_percentage_change":1.175,"index":null,"index_basis_percentage":0.0,"bid_ask_spread":0.000438321853475266,"funding_rate":0.0,"open_interest_usd":0.0,"h24_volume":4812.5,"converted_volume":{"btc":"245.812755608539014222371429","eth":"4822.3085711540579923472654406457234346582","usd":"10804779.5332906667012333140956208478415156"},"converted_last":{"btc":"0.051077975191384730228025232","eth":"1.0020381446553886737344967149393711033056","usd":"2245.1489939305281457108185133757605904448"},"last_traded":1703199494,"expired_at":null},{"symbol":"LTC_JPY","base":"LTC","target":"JPY","trade_url":"https://coin.z.com/jp/corp/information/ltc-market/","contract_type":"perpetual","last":10050.0,"h24_percentage_change":-0.298,"index":null,"index_basis_percentage":0.0,"bid_ask_spread":0.00247549262303198,"funding_rate":0.0,"open_interest_usd":0.0,"h24_volume":1671.0,"converted_volume":{"btc":"2.6870214054251593245043656","eth":"52.71348235032782675176896137019924628848","usd":"118108.89884447945513249626836147336650784"},"converted_last":{"btc":"0.0016080319601586830188536","eth":"0.03154606962916087776886233475176495888","usd":"70.68156723188477267055431978544187104"},"last_traded":1703198957,"expired_at":null},{"symbol":"XRP_JPY","base":"XRP","target":"JPY","trade_url":"https://coin.z.com/jp/corp/information/xrp-market/","contract_type":"perpetual","last":88.499,"h24_percentage_change":-0.336,"index":null,"index_basis_percentage":0.0,"bid_ask_spread":0.000711510661366127,"funding_rate":0.0,"open_interest_usd":0.0,"h24_volume":11012370.0,"converted_volume":{"btc":"155.93649650943131777306847278736","eth":"3059.132964078954044850252795123548070219787488","usd":"6854239.365272493383017695748026527304682019904"},"converted_last":{"btc":"0.000014160121437023212784629328","eth":"0.0002777906085682695046434375883777559299424","usd":"0.6224127381546836314996404723076437955392"},"last_traded":1703199494,"expired_at":null}]}
             */
            /*
            await CoinGecko.derivativesExchangeList.testJSON()
             */
            
            // NFTS
           // await CoinGecko.nfts(order: nil, assetPlatformId: nil, perPage: nil, page: nil).testJSON()

            //await CoinGecko.nft(id: "squiggly").testJSON()
/*
 {"name":"GMO Japan (Futures)","open_interest_btc":null,"trade_volume_24h_btc":"1866.18","number_of_perpetual_pairs":5,"number_of_futures_pairs":0,"image":"https://assets.coingecko.com/markets/images/439/small/GMO.png?1562585771","year_established":2016,"country":"Japan","description":"","url":"https://coin.z.com/jp/","tickers":[{"symbol":"BCH_JPY","base":"BCH","target":"JPY","trade_url":"https://coin.z.com/jp/corp/information/bch-market/","contract_type":"perpetual","last":33302.0,"h24_percentage_change":1.422,"index":null,"index_basis_percentage":0.0,"bid_ask_spread":0.00330379936927467,"funding_rate":0.0,"open_interest_usd":0.0,"h24_volume":327.7,"converted_volume":{"btc":"1.7464504409945517456982671074","eth":"34.19259121646517370534611871329827409304952","usd":"76749.84118263482001956180103403993655763602"},"converted_last":{"btc":"0.005329418495558595501062762","eth":"0.1043411388967506063635829072728052306776","usd":"234.2076325377931645394012848155017899226"},"last_traded":1703199494,"expired_at":null},{"symbol":"BTC_JPY","base":"BTC","target":"JPY","trade_url":"https://coin.z.com/jp/corp/information/btc-market/","contract_type":"perpetual","last":6241674.0,"h24_percentage_change":-0.091,"index":null,"index_basis_percentage":0.0,"bid_ask_spread":0.000260810415499188,"funding_rate":0.0,"open_interest_usd":0.0,"h24_volume":1465.06,"converted_volume":{"btc":"1463.40994257950514442883419771164","eth":"28651.129613638942330927122938005265203202128272","usd":"64311289.940815529522094404436754114414756202172"},"converted_last":{"btc":"0.998873727068860759579016694","eth":"19.5562841205404163180532694483538320636712","usd":"43896.6936103746805742388737913492378569862"},"last_traded":1703199798,"expired_at":null},{"symbol":"ETH_JPY","base":"ETH","target":"JPY","trade_url":"https://coin.z.com/jp/corp/information/eth-market/","contract_type":"perpetual","last":318935.0,"h24_percentage_change":1.338,"index":null,"index_basis_percentage":0.0,"bid_ask_spread":0.000802030138788809,"funding_rate":0.0,"open_interest_usd":0.0,"h24_volume":4814.9,"converted_volume":{"btc":"245.7530754710868344606128228765","eth":"4811.4359574880147161995433468128920428694222","usd":"10799911.10529819151741899363237481598448221845"},"converted_last":{"btc":"0.051040120349558004207898985","eth":"0.999280557745335254356174239716897971478","usd":"2243.0187761528155345737177578713609803905"},"last_traded":1703199798,"expired_at":null},{"symbol":"LTC_JPY","base":"LTC","target":"JPY","trade_url":"https://coin.z.com/jp/corp/information/ltc-market/","contract_type":"perpetual","last":10050.0,"h24_percentage_change":-0.298,"index":null,"index_basis_percentage":0.0,"bid_ask_spread":0.00307417691392305,"funding_rate":0.0,"open_interest_usd":0.0,"h24_volume":1671.0,"converted_volume":{"btc":"2.68752194991556217274856005","eth":"52.61720416550135563921529434962519613374","usd":"118106.347588885244079955031127661103962365"},"converted_last":{"btc":"0.00160833150802846329907155","eth":"0.03148845252274168500252261780348605394","usd":"70.680040448165915068794153876517716315"},"last_traded":1703198957,"expired_at":null},{"symbol":"XRP_JPY","base":"XRP","target":"JPY","trade_url":"https://coin.z.com/jp/corp/information/xrp-market/","contract_type":"perpetual","last":88.57,"h24_percentage_change":0.201,"index":null,"index_basis_percentage":0.0,"bid_ask_spread":0.00100437863946191,"funding_rate":0.0,"open_interest_usd":0.0,"h24_volume":10765050.0,"converted_volume":{"btc":"152.5851272867109660450197680335","eth":"2987.3626875181909566568645649735753191750458","usd":"6705534.84438881868944107804707534444889822455"},"converted_last":{"btc":"0.00001417412155881402929340967","eth":"0.000277505695516341397081933160085050726116","usd":"0.622898625123786576879910269536634242191"},"last_traded":1703199798,"expired_at":null}]}
 {"id":"squiggly","contract_address":"0x36F379400DE6c6BCDF4408B282F8b685c56adc60","asset_platform_id":"ethereum","name":"Squiggly","symbol":"~~","image":{"small":"https://assets.coingecko.com/nft_contracts/images/1332/small/squiggly.png?1661232628"},"description":"Randomly generated and fully on-chain squiggly lines, the first project in the Atlantes series. Only 100 pieces were created during the minting process.  The on-chain generator has now been shut off forever so they are only available in the secondary market. Project was launched in October 2020.\r\n\r\nCurve type refers to the type of bezier curve used in the on chain algorithm. All curve types had an equal probability of being created.\r\nAny auctoineer who called the end auction function for a given auction was credited as the creator of that Squiggly as they generated the seed to create the art for the auction winner and new owner.\r\n\r\ncreated by natealex","native_currency":"ethereum","native_currency_symbol":"ETH","floor_price":{"native_currency":50.0,"usd":111865},"market_cap":{"native_currency":5000.0,"usd":11186484},"volume_24h":{"native_currency":0.0,"usd":0.0},"floor_price_in_usd_24h_percentage_change":2.93025,"floor_price_24h_percentage_change":{"usd":2.9302502140326103,"native_currency":0.0},"market_cap_24h_percentage_change":{"usd":2.9302502140326108,"native_currency":0.0},"volume_24h_percentage_change":{"usd":0,"native_currency":0},"number_of_unique_addresses":53.0,"number_of_unique_addresses_24h_percentage_change":0.0,"volume_in_usd_24h_percentage_change":0.0,"total_supply":100.0,"one_day_sales":0.0,"one_day_sales_24h_percentage_change":0.0,"one_day_average_sale_price":0.0,"one_day_average_sale_price_24h_percentage_change":0.0,"links":{"homepage":"https://www.squiggly.wtf/","twitter":"https://twitter.com/natealexnft","discord":"https://discord.gg/bKu7eS8"},"floor_price_7d_percentage_change":{"usd":-0.7839131838084674,"native_currency":0.0},"floor_price_14d_percentage_change":{"usd":0.5231363467456553,"native_currency":0.0},"floor_price_30d_percentage_change":{"usd":10.93782159010288,"native_currency":0.0},"floor_price_60d_percentage_change":{"usd":359.11953203519425,"native_currency":233.33333333333334},"floor_price_1y_percentage_change":{"usd":268.43409851893546,"native_currency":100.0},"explorers":[{"name":"Etherscan","link":"https://etherscan.io/token/0x36F379400DE6c6BCDF4408B282F8b685c56adc60"},{"name":"Ethplorer","link":"https://ethplorer.io/address/0x36F379400DE6c6BCDF4408B282F8b685c56adc60"}]}
 */
            
            //Not found (?)
//            await CoinGecko.nftCollection(assetPlatformId: "etherem",
//                                            contract: "0x8a90CAb2b38dba80c64b7734e58Ee1dB38B8992e").testJSON()

            // Exchange Rates
            //await CoinGecko.exchangeRates.testJSON()
/*
 {"rates":{"btc":{"name":"Bitcoin","unit":"BTC","value":1.0,"type":"crypto"},"eth":{"name":"Ether","unit":"ETH","value":19.581,"type":"crypto"},"ltc":{"name":"Litecoin","unit":"LTC","value":619.846,"type":"crypto"},"bch":{"name":"Bitcoin Cash","unit":"BCH","value":188.111,"type":"crypto"},"bnb":{"name":"Binance Coin","unit":"BNB","value":161.858,"type":"crypto"},"eos":{"name":"EOS","unit":"EOS","value":51989.459,"type":"crypto"},"xrp":{"name":"XRP","unit":"XRP","value":70383.006,"type":"crypto"},"xlm":{"name":"Lumens","unit":"XLM","value":354286.35,"type":"crypto"},"link":{"name":"Chainlink","unit":"LINK","value":2879.064,"type":"crypto"},"dot":{"name":"Polkadot","unit":"DOT","value":5325.501,"type":"crypto"},"yfi":{"name":"Yearn.finance","unit":"YFI","value":5.222,"type":"crypto"},"usd":{"name":"US Dollar","unit":"$","value":43951.146,"type":"fiat"},"aed":{"name":"United Arab Emirates Dirham","unit":"DH","value":161419.374,"type":"fiat"},"ars":{"name":"Argentine Peso","unit":"$","value":35347252.229,"type":"fiat"},"aud":{"name":"Australian Dollar","unit":"A$","value":64651.608,"type":"fiat"},"bdt":{"name":"Bangladeshi Taka","unit":"৳","value":4822588.433,"type":"fiat"},"bhd":{"name":"Bahraini Dinar","unit":"BD","value":16567.12,"type":"fiat"},"bmd":{"name":"Bermudian Dollar","unit":"$","value":43951.146,"type":"fiat"},"brl":{"name":"Brazil Real","unit":"R$","value":214626.632,"type":"fiat"},"cad":{"name":"Canadian Dollar","unit":"CA$","value":58379.692,"type":"fiat"},"chf":{"name":"Swiss Franc","unit":"Fr.","value":37629.74,"type":"fiat"},"clp":{"name":"Chilean Peso","unit":"CLP$","value":38553636.986,"type":"fiat"},"cny":{"name":"Chinese Yuan","unit":"¥","value":313780.417,"type":"fiat"},"czk":{"name":"Czech Koruna","unit":"Kč","value":981785.098,"type":"fiat"},"dkk":{"name":"Danish Krone","unit":"kr.","value":297676.718,"type":"fiat"},"eur":{"name":"Euro","unit":"€","value":39926.363,"type":"fiat"},"gbp":{"name":"British Pound Sterling","unit":"£","value":34644.842,"type":"fiat"},"gel":{"name":"Georgian Lari","unit":"₾","value":118228.583,"type":"fiat"},"hkd":{"name":"Hong Kong Dollar","unit":"HK$","value":343260.649,"type":"fiat"},"huf":{"name":"Hungarian Forint","unit":"Ft","value":15259369.393,"type":"fiat"},"idr":{"name":"Indonesian Rupiah","unit":"Rp","value":678878288.87,"type":"fiat"},"ils":{"name":"Israeli New Shekel","unit":"₪","value":159324.662,"type":"fiat"},"inr":{"name":"Indian Rupee","unit":"₹","value":3659774.496,"type":"fiat"},"jpy":{"name":"Japanese Yen","unit":"¥","value":6245172.19,"type":"fiat"},"krw":{"name":"South Korean Won","unit":"₩","value":56912382.05,"type":"fiat"},"kwd":{"name":"Kuwaiti Dinar","unit":"KD","value":13503.813,"type":"fiat"},"lkr":{"name":"Sri Lankan Rupee","unit":"Rs","value":14278463.888,"type":"fiat"},"mmk":{"name":"Burmese Kyat","unit":"K","value":92277520.023,"type":"fiat"},"mxn":{"name":"Mexican Peso","unit":"MX$","value":748670.856,"type":"fiat"},"myr":{"name":"Malaysian Ringgit","unit":"RM","value":204614.561,"type":"fiat"},"ngn":{"name":"Nigerian Naira","unit":"₦","value":36253262.167,"type":"fiat"},"nok":{"name":"Norwegian Krone","unit":"kr","value":451409.696,"type":"fiat"},"nzd":{"name":"New Zealand Dollar","unit":"NZ$","value":69829.932,"type":"fiat"},"php":{"name":"Philippine Peso","unit":"₱","value":2434014.387,"type":"fiat"},"pkr":{"name":"Pakistani Rupee","unit":"₨","value":12431581.699,"type":"fiat"},"pln":{"name":"Polish Zloty","unit":"zł","value":172785.141,"type":"fiat"},"rub":{"name":"Russian Ruble","unit":"₽","value":4082841.461,"type":"fiat"},"sar":{"name":"Saudi Riyal","unit":"SR","value":164858.2,"type":"fiat"},"sek":{"name":"Swedish Krona","unit":"kr","value":442917.368,"type":"fiat"},"sgd":{"name":"Singapore Dollar","unit":"S$","value":58305.766,"type":"fiat"},"thb":{"name":"Thai Baht","unit":"฿","value":1528181.352,"type":"fiat"},"try":{"name":"Turkish Lira","unit":"₺","value":1281364.857,"type":"fiat"},"twd":{"name":"New Taiwan Dollar","unit":"NT$","value":1371649.345,"type":"fiat"},"uah":{"name":"Ukrainian hryvnia","unit":"₴","value":1652610.168,"type":"fiat"},"vef":{"name":"Venezuelan bolívar fuerte","unit":"Bs.F","value":4400.828,"type":"fiat"},"vnd":{"name":"Vietnamese đồng","unit":"₫","value":1069371206.704,"type":"fiat"},"zar":{"name":"South African Rand","unit":"R","value":807305.597,"type":"fiat"},"xdr":{"name":"IMF Special Drawing Rights","unit":"XDR","value":32776.083,"type":"fiat"},"xag":{"name":"Silver - Troy Ounce","unit":"XAG","value":1798.145,"type":"commodity"},"xau":{"name":"Gold - Troy Ounce","unit":"XAU","value":21.468,"type":"commodity"},"bits":{"name":"Bits","unit":"μBTC","value":1000000.0,"type":"crypto"},"sats":{"name":"Satoshi","unit":"sats","value":100000000.0,"type":"crypto"}}}
 */
            // Search
           // await CoinGecko.search(query: "punks").testJSON()
/*
 {"coins":[{"id":"hipunks","name":"hiPunks","api_symbol":"hipunks","symbol":"HIPUNKS","market_cap_rank":null,"thumb":"https://assets.coingecko.com/coins/images/26739/thumb/hipunks.png","large":"https://assets.coingecko.com/coins/images/26739/large/hipunks.png"},{"id":"punkswap","name":"PunkSwap","api_symbol":"punkswap","symbol":"PUNK","market_cap_rank":null,"thumb":"https://assets.coingecko.com/coins/images/32270/thumb/punk.jpg","large":"https://assets.coingecko.com/coins/images/32270/large/punk.jpg"},{"id":"cryptopunks-fraction-toke","name":"CryptoPunks Fraction Token","api_symbol":"cryptopunks-fraction-toke","symbol":"IPUNKS","market_cap_rank":null,"thumb":"https://assets.coingecko.com/coins/images/28566/thumb/ipunks.png","large":"https://assets.coingecko.com/coins/images/28566/large/ipunks.png"}],"exchanges":[{"id":"punkswap","name":"Punkswap","market_type":"spot","thumb":"https://assets.coingecko.com/markets/images/1316/thumb/punkswap.png","large":"https://assets.coingecko.com/markets/images/1316/large/punkswap.png"}],"icos":[],"categories":[],"nfts":[{"id":"dr-ethvil-s-3d-frankenpunks","name":"Dr. ETHvil's 3D FrankenPunks","symbol":"FP","thumb":"https://assets.coingecko.com/nft_contracts/images/770/thumb/dr-ethvil-s-3d-frankenpunks.png"},{"id":"punks2023","name":"Punks2023","symbol":"PUNK2023","thumb":"https://assets.coingecko.com/nft_contracts/images/3390/thumb/punks2023.png"},{"id":"boringpunks","name":"BoringPunks","symbol":"BPUNK","thumb":"https://assets.coingecko.com/nft_contracts/images/3229/thumb/boringpunks.png"},{"id":"punks-2-gold-rilla-collector-s-edition","name":"PUNKS 2: GOLD-RILLA Collector's Edition","symbol":"COMIC2GOL","thumb":"https://assets.coingecko.com/nft_contracts/images/758/thumb/punks-2-gold-rilla-collector-s-edition.jpg"},{"id":"fast-food-punks","name":"Fast Food Punks","symbol":"FFP","thumb":"https://assets.coingecko.com/nft_contracts/images/1374/thumb/fast-food-punks.jpg"},{"id":"bitcoin-punks","name":"Bitcoin Punks","symbol":"BITCOIN-PUNKS","thumb":"https://assets.coingecko.com/nft_contracts/images/3259/thumb/bitcoin-punks.png"},{"id":"cryptopunks-v1-wrapped","name":"CryptoPunks V1 (wrapped)","symbol":"WPV1","thumb":"https://assets.coingecko.com/nft_contracts/images/479/thumb/cryptopunks-v1-wrapped.png"},{"id":"wrapped-cryptopunks","name":"Wrapped Cryptopunks","symbol":"WPUNKS","thumb":"https://assets.coingecko.com/nft_contracts/images/934/thumb/wrapped-cryptopunks.png"},{"id":"simpspunks","name":"SimpsPunks","symbol":"SIMSPUNK","thumb":"https://assets.coingecko.com/nft_contracts/images/3654/thumb/simpspunks.gif"},{"id":"unordinal-punks","name":"Unordinal Punks","symbol":"UNORPUNK","thumb":"https://assets.coingecko.com/nft_contracts/images/2972/thumb/unordinal-punks.png"},{"id":"solpunks","name":"SolPunks","symbol":"SOLPUINKS","thumb":"https://assets.coingecko.com/nft_contracts/images/2654/thumb/solpunks.jpg"},{"id":"artpunks","name":"ArtPunks","symbol":"ART","thumb":"https://assets.coingecko.com/nft_contracts/images/2693/thumb/artpunks.jpg"},{"id":"dogepunks","name":"DogePunks","symbol":"DOGEPUNKS","thumb":"https://assets.coingecko.com/nft_contracts/images/3289/thumb/dogepunks.png"},{"id":"covidpunks","name":"COVIDPunks","symbol":"PUNK-19","thumb":"https://assets.coingecko.com/nft_contracts/images/116/thumb/Covid.jpg"},{"id":"punkscapes","name":"PunkScapes","symbol":"PS","thumb":"https://assets.coingecko.com/nft_contracts/images/671/thumb/punkscapes.png"},{"id":"cursed-bitcoin-punks","name":"Cursed Bitcoin Punks","symbol":"CURSEDBITCOINPUNKS","thumb":"https://assets.coingecko.com/nft_contracts/images/3311/thumb/cursed-bitcoin-punks.png"},{"id":"alter-ego-punks","name":"Alter Ego Punks","symbol":"AEPG0","thumb":"https://assets.coingecko.com/nft_contracts/images/1441/thumb/alter-ego-punks.png"},{"id":"tycoonpunks","name":"TycoonPunks","symbol":"TYCOONPUNKS","thumb":"https://assets.coingecko.com/nft_contracts/images/3144/thumb/tycoonpunks.gif"},{"id":"spacepunksclub","name":"SpacePunksClub","symbol":"⚇","thumb":"https://assets.coingecko.com/nft_contracts/images/71/thumb/SpacePunks.jpg"},{"id":"punks-2-kiki-collector-s-edition","name":"PUNKS 2: KIKI Collector's Edition","symbol":"COMIC2KIK","thumb":"https://assets.coingecko.com/nft_contracts/images/709/thumb/punks-2-kiki-collector-s-edition.jpg"},{"id":"springfield-punks","name":"SpringfieldPunks","symbol":"SPUNKS","thumb":"https://assets.coingecko.com/nft_contracts/images/3651/thumb/springfield-punks.png"},{"id":"cryptopunks","name":"CryptoPunks","symbol":"PUNK","thumb":"https://assets.coingecko.com/nft_contracts/images/270/thumb/cryptopunks.png"},{"id":"bastard-gan-punks-v2","name":"BASTARD GAN PUNKS V2","symbol":"BGANPUNKV2","thumb":"https://assets.coingecko.com/nft_contracts/images/454/thumb/bastard-gan-punks-v2.gif"},{"id":"dystopunks","name":"DystoPunks","symbol":"DYSTO","thumb":"https://assets.coingecko.com/nft_contracts/images/663/thumb/dystopunks.png"},{"id":"cat-town-punks","name":"Cat Town Punks","symbol":"CATTP","thumb":"https://assets.coingecko.com/nft_contracts/images/1706/thumb/cat-town-punks.png"},{"id":"neo-tokyo-punks-nft","name":"Neo Tokyo Punks NFT","symbol":"NTP","thumb":"https://assets.coingecko.com/nft_contracts/images/333/thumb/neo-tokyo-punks-nft.gif"},{"id":"satoshi-punks","name":"Satoshi Punks","symbol":"SATOSHI-PUNKS","thumb":"https://assets.coingecko.com/nft_contracts/images/3703/thumb/satoshi-punks.gif"},{"id":"hdpunks","name":"HDPunks","symbol":"HDPUNKS","thumb":"https://assets.coingecko.com/nft_contracts/images/903/thumb/hdpunks.png"},{"id":"recursive-punks","name":"Recursive Punks","symbol":"RECURSIVEPUNKS","thumb":"https://assets.coingecko.com/nft_contracts/images/3366/thumb/recursive-punks.png"},{"id":"united-punks-union","name":"United Punks Union","symbol":"UPU","thumb":"https://assets.coingecko.com/nft_contracts/images/244/thumb/unnamed.gif"},{"id":"optipunks","name":"OptiPunks","symbol":"OPPUNK","thumb":"https://assets.coingecko.com/nft_contracts/images/1651/thumb/https-fanbase-1-s3-amazonaws-com-quixotic-collection-profile-optipunkgif-b34a680b_vbx64as-gif.gif"},{"id":"shitpunks","name":"ShitPunks","symbol":"SHITPUNKS","thumb":"https://assets.coingecko.com/nft_contracts/images/2325/thumb/shitpunks.jpg"},{"id":"checkpunks","name":"CheckPunks","symbol":"CHECKPUNKS","thumb":"https://assets.coingecko.com/nft_contracts/images/2729/thumb/checkpunks.gif"},{"id":"megapunks","name":"MegaPunksPOP","symbol":"MP","thumb":"https://assets.coingecko.com/nft_contracts/images/3009/thumb/megapunks.png"},{"id":"animalspunks-v2","name":"AnimalsPunks V2","symbol":"AP","thumb":"https://assets.coingecko.com/nft_contracts/images/1724/thumb/animalspunks-v2.png"},{"id":"punks-comic","name":"PUNKS Comic","symbol":"COMIC2","thumb":"https://assets.coingecko.com/nft_contracts/images/236/thumb/unnamed.jpeg"},{"id":"crowpunks","name":"CrowPunks","symbol":"CROW","thumb":"https://assets.coingecko.com/nft_contracts/images/935/thumb/crowpunks.gif"},{"id":"arbitrumgoblinpunks","name":"ArbitrumGoblinPunks","symbol":"ABG","thumb":"missing_thumb.png"},{"id":"punks-unchained","name":"Punks Unchained","symbol":"PU","thumb":"missing_thumb.png"},{"id":"unpunks-nft","name":"Unpunks","symbol":"UNPU","thumb":"https://assets.coingecko.com/nft_contracts/images/2901/thumb/unpunks-nft.png"},{"id":"arbipunks","name":"ArbiPunks","symbol":"APUNKS","thumb":"https://assets.coingecko.com/nft_contracts/images/1824/thumb/https-fanbase-1-s3-amazonaws-com-quixotic-collection-profile-h8pkeezf_400x400-jpeg.jpg"},{"id":"newklaypunks","name":"NewKlayPUNKS","symbol":"NKP","thumb":"https://assets.coingecko.com/nft_contracts/images/1728/thumb/newklaypunks.png"}]}
 */
            // Trending
            //await CoinGecko.trending.testJSON()

            // Global
            /*
            await CoinGecko.global.testJSON()
             {"coins":[{"id":"hipunks","name":"hiPunks","api_symbol":"hipunks","symbol":"HIPUNKS","market_cap_rank":null,"thumb":"https://assets.coingecko.com/coins/images/26739/thumb/hipunks.png","large":"https://assets.coingecko.com/coins/images/26739/large/hipunks.png"},{"id":"punkswap","name":"PunkSwap","api_symbol":"punkswap","symbol":"PUNK","market_cap_rank":null,"thumb":"https://assets.coingecko.com/coins/images/32270/thumb/punk.jpg","large":"https://assets.coingecko.com/coins/images/32270/large/punk.jpg"},{"id":"cryptopunks-fraction-toke","name":"CryptoPunks Fraction Token","api_symbol":"cryptopunks-fraction-toke","symbol":"IPUNKS","market_cap_rank":null,"thumb":"https://assets.coingecko.com/coins/images/28566/thumb/ipunks.png","large":"https://assets.coingecko.com/coins/images/28566/large/ipunks.png"}],"exchanges":[{"id":"punkswap","name":"Punkswap","market_type":"spot","thumb":"https://assets.coingecko.com/markets/images/1316/thumb/punkswap.png","large":"https://assets.coingecko.com/markets/images/1316/large/punkswap.png"}],"icos":[],"categories":[],"nfts":[{"id":"dr-ethvil-s-3d-frankenpunks","name":"Dr. ETHvil's 3D FrankenPunks","symbol":"FP","thumb":"https://assets.coingecko.com/nft_contracts/images/770/thumb/dr-ethvil-s-3d-frankenpunks.png"},{"id":"punks2023","name":"Punks2023","symbol":"PUNK2023","thumb":"https://assets.coingecko.com/nft_contracts/images/3390/thumb/punks2023.png"},{"id":"boringpunks","name":"BoringPunks","symbol":"BPUNK","thumb":"https://assets.coingecko.com/nft_contracts/images/3229/thumb/boringpunks.png"},{"id":"punkscapes","name":"PunkScapes","symbol":"PS","thumb":"https://assets.coingecko.com/nft_contracts/images/671/thumb/punkscapes.png"},{"id":"cursed-bitcoin-punks","name":"Cursed Bitcoin Punks","symbol":"CURSEDBITCOINPUNKS","thumb":"https://assets.coingecko.com/nft_contracts/images/3311/thumb/cursed-bitcoin-punks.png"},{"id":"punks-2-gold-rilla-collector-s-edition","name":"PUNKS 2: GOLD-RILLA Collector's Edition","symbol":"COMIC2GOL","thumb":"https://assets.coingecko.com/nft_contracts/images/758/thumb/punks-2-gold-rilla-collector-s-edition.jpg"},{"id":"fast-food-punks","name":"Fast Food Punks","symbol":"FFP","thumb":"https://assets.coingecko.com/nft_contracts/images/1374/thumb/fast-food-punks.jpg"},{"id":"covidpunks","name":"COVIDPunks","symbol":"PUNK-19","thumb":"https://assets.coingecko.com/nft_contracts/images/116/thumb/Covid.jpg"},{"id":"bitcoin-punks","name":"Bitcoin Punks","symbol":"BITCOIN-PUNKS","thumb":"https://assets.coingecko.com/nft_contracts/images/3259/thumb/bitcoin-punks.png"},{"id":"cryptopunks-v1-wrapped","name":"CryptoPunks V1 (wrapped)","symbol":"WPV1","thumb":"https://assets.coingecko.com/nft_contracts/images/479/thumb/cryptopunks-v1-wrapped.png"},{"id":"wrapped-cryptopunks","name":"Wrapped Cryptopunks","symbol":"WPUNKS","thumb":"https://assets.coingecko.com/nft_contracts/images/934/thumb/wrapped-cryptopunks.png"},{"id":"simpspunks","name":"SimpsPunks","symbol":"SIMSPUNK","thumb":"https://assets.coingecko.com/nft_contracts/images/3654/thumb/simpspunks.gif"},{"id":"unordinal-punks","name":"Unordinal Punks","symbol":"UNORPUNK","thumb":"https://assets.coingecko.com/nft_contracts/images/2972/thumb/unordinal-punks.png"},{"id":"solpunks","name":"SolPunks","symbol":"SOLPUINKS","thumb":"https://assets.coingecko.com/nft_contracts/images/2654/thumb/solpunks.jpg"},{"id":"artpunks","name":"ArtPunks","symbol":"ART","thumb":"https://assets.coingecko.com/nft_contracts/images/2693/thumb/artpunks.jpg"},{"id":"dogepunks","name":"DogePunks","symbol":"DOGEPUNKS","thumb":"https://assets.coingecko.com/nft_contracts/images/3289/thumb/dogepunks.png"},{"id":"alter-ego-punks","name":"Alter Ego Punks","symbol":"AEPG0","thumb":"https://assets.coingecko.com/nft_contracts/images/1441/thumb/alter-ego-punks.png"},{"id":"tycoonpunks","name":"TycoonPunks","symbol":"TYCOONPUNKS","thumb":"https://assets.coingecko.com/nft_contracts/images/3144/thumb/tycoonpunks.gif"},{"id":"spacepunksclub","name":"SpacePunksClub","symbol":"⚇","thumb":"https://assets.coingecko.com/nft_contracts/images/71/thumb/SpacePunks.jpg"},{"id":"punks-2-kiki-collector-s-edition","name":"PUNKS 2: KIKI Collector's Edition","symbol":"COMIC2KIK","thumb":"https://assets.coingecko.com/nft_contracts/images/709/thumb/punks-2-kiki-collector-s-edition.jpg"},{"id":"springfield-punks","name":"SpringfieldPunks","symbol":"SPUNKS","thumb":"https://assets.coingecko.com/nft_contracts/images/3651/thumb/springfield-punks.png"},{"id":"cryptopunks","name":"CryptoPunks","symbol":"PUNK","thumb":"https://assets.coingecko.com/nft_contracts/images/270/thumb/cryptopunks.png"},{"id":"bastard-gan-punks-v2","name":"BASTARD GAN PUNKS V2","symbol":"BGANPUNKV2","thumb":"https://assets.coingecko.com/nft_contracts/images/454/thumb/bastard-gan-punks-v2.gif"},{"id":"dystopunks","name":"DystoPunks","symbol":"DYSTO","thumb":"https://assets.coingecko.com/nft_contracts/images/663/thumb/dystopunks.png"},{"id":"cat-town-punks","name":"Cat Town Punks","symbol":"CATTP","thumb":"https://assets.coingecko.com/nft_contracts/images/1706/thumb/cat-town-punks.png"},{"id":"neo-tokyo-punks-nft","name":"Neo Tokyo Punks NFT","symbol":"NTP","thumb":"https://assets.coingecko.com/nft_contracts/images/333/thumb/neo-tokyo-punks-nft.gif"},{"id":"satoshi-punks","name":"Satoshi Punks","symbol":"SATOSHI-PUNKS","thumb":"https://assets.coingecko.com/nft_contracts/images/3703/thumb/satoshi-punks.gif"},{"id":"hdpunks","name":"HDPunks","symbol":"HDPUNKS","thumb":"https://assets.coingecko.com/nft_contracts/images/903/thumb/hdpunks.png"},{"id":"recursive-punks","name":"Recursive Punks","symbol":"RECURSIVEPUNKS","thumb":"https://assets.coingecko.com/nft_contracts/images/3366/thumb/recursive-punks.png"},{"id":"united-punks-union","name":"United Punks Union","symbol":"UPU","thumb":"https://assets.coingecko.com/nft_contracts/images/244/thumb/unnamed.gif"},{"id":"optipunks","name":"OptiPunks","symbol":"OPPUNK","thumb":"https://assets.coingecko.com/nft_contracts/images/1651/thumb/https-fanbase-1-s3-amazonaws-com-quixotic-collection-profile-optipunkgif-b34a680b_vbx64as-gif.gif"},{"id":"shitpunks","name":"ShitPunks","symbol":"SHITPUNKS","thumb":"https://assets.coingecko.com/nft_contracts/images/2325/thumb/shitpunks.jpg"},{"id":"checkpunks","name":"CheckPunks","symbol":"CHECKPUNKS","thumb":"https://assets.coingecko.com/nft_contracts/images/2729/thumb/checkpunks.gif"},{"id":"megapunks","name":"MegaPunksPOP","symbol":"MP","thumb":"https://assets.coingecko.com/nft_contracts/images/3009/thumb/megapunks.png"},{"id":"animalspunks-v2","name":"AnimalsPunks V2","symbol":"AP","thumb":"https://assets.coingecko.com/nft_contracts/images/1724/thumb/animalspunks-v2.png"},{"id":"punks-comic","name":"PUNKS Comic","symbol":"COMIC2","thumb":"https://assets.coingecko.com/nft_contracts/images/236/thumb/unnamed.jpeg"},{"id":"crowpunks","name":"CrowPunks","symbol":"CROW","thumb":"https://assets.coingecko.com/nft_contracts/images/935/thumb/crowpunks.gif"},{"id":"arbitrumgoblinpunks","name":"ArbitrumGoblinPunks","symbol":"ABG","thumb":"missing_thumb.png"},{"id":"punks-unchained","name":"Punks Unchained","symbol":"PU","thumb":"missing_thumb.png"},{"id":"unpunks-nft","name":"Unpunks","symbol":"UNPU","thumb":"https://assets.coingecko.com/nft_contracts/images/2901/thumb/unpunks-nft.png"},{"id":"arbipunks","name":"ArbiPunks","symbol":"APUNKS","thumb":"https://assets.coingecko.com/nft_contracts/images/1824/thumb/https-fanbase-1-s3-amazonaws-com-quixotic-collection-profile-h8pkeezf_400x400-jpeg.jpg"},{"id":"newklaypunks","name":"NewKlayPUNKS","symbol":"NKP","thumb":"https://assets.coingecko.com/nft_contracts/images/1728/thumb/newklaypunks.png"}]}
             {"data":{"active_cryptocurrencies":11687,"upcoming_icos":0,"ongoing_icos":49,"ended_icos":3376,"markets":955,"total_market_cap":{"btc":39465232.1057184,"eth":773628501.4794008,"ltc":24468209437.38574,"bch":7434831361.852569,"bnb":6400352988.8529625,"eos":2057337258581.9722,"xrp":2779468085446.6504,"xlm":13932626438506.658,"link":113947986023.21191,"dot":209445865200.543,"yfi":205886001.50918734,"usd":1731998238933.4412,"aed":6361109932130.866,"ars":1392891358519589.5,"aud":2547765945474.6167,"bdt":190045434481012.03,"bhd":652866344176.5256,"bmd":1731998238933.4412,"brl":8457867000183.66,"cad":2300388101004.229,"chf":1482919572192.4226,"clp":1519296700028774.8,"cny":12364735427745.848,"czk":38685912664817.36,"dkk":11730074117058.76,"eur":1573328148266.5115,"gbp":1364845788247.8533,"gel":4659075262730.976,"hkd":13526646446334.355,"huf":601391863990909.5,"idr":2.6752794927205936e+16,"ils":6278562896063.284,"inr":144222017693488.25,"jpy":246200951667030.38,"krw":2242157831787782.8,"kwd":532149530919.3427,"lkr":562676436344103.5,"mmk":3636412608929075.5,"mxn":29503277145566.082,"myr":8063317801354.624,"ngn":1428645022413869.8,"nok":17791995209399.76,"nzd":2751904453910.0264,"php":95875637175271.33,"pkr":489895701882324.56,"pln":6807570582177.21,"rub":160893966013732.66,"sar":6496624938341.501,"sek":17452090555009.076,"sgd":2297577067862.4404,"thb":60197174912529.17,"try":50495369457161.14,"twd":54053067039754.516,"uah":65124988754011.234,"vef":173424983664.40558,"vnd":4.214108635231517e+16,"zar":31788264318229.703,"xdr":1291618634703.9878,"xag":70883309607.0479,"xau":845371020.4410223,"bits":39465232105718.4,"sats":3946523210571839.5},"total_volume":{"btc":1915306.132037437,"eth":37545336.33131048,"ltc":1187478422.7763536,"bch":360823371.31262285,"bnb":310618604.5964741,"eos":99845622508.3289,"xrp":134891700461.7581,"xlm":676170984667.5931,"link":5530064431.87625,"dot":10164717867.967651,"yfi":9991952.413579687,"usd":84056438305.51788,"aed":308714080964.67633,"ars":67599079440051.43,"aud":123646852634.54031,"bdt":9223186247888.797,"bhd":31684570080.63506,"bmd":84056438305.51788,"brl":410472805177.33484,"cad":111641239664.23972,"chf":71968281912.80135,"clp":73733717773516.3,"cny":600078913063.0927,"czk":1877484605992.0483,"dkk":569277860205.4874,"eur":76355943935.91118,"gbp":66237986400.63763,"gel":226111819041.84402,"hkd":656468174700.3499,"huf":29186437362731.58,"idr":1298352738328202.2,"ils":304707951115.03467,"inr":6999308001615.046,"jpy":11948496620471.914,"krw":108815238504492.56,"kwd":25826004443.61708,"lkr":27307520350974.418,"mmk":176480486668439.66,"mxn":1431837711754.2627,"myr":391324748531.33795,"ngn":69334257672782.46,"nok":863471863904.3907,"nzd":133553996622.54346,"php":4652986590903.288,"pkr":23775363574715.77,"pln":330381477179.566,"rub":7808422332052.457,"sar":315290824810.5769,"sek":846975787886.933,"sgd":111504816064.86986,"thb":2921458004667.132,"try":2450615024934.3916,"twd":2623275354857.765,"uah":3160612104732.895,"vef":8416571167.53151,"vnd":2045169299526640.8,"zar":1542731521569.089,"xdr":62684164245.518715,"xag":3440071939.4176655,"xau":41027106.97254018,"bits":1915306132037.437,"sats":191530613203743.72},"market_cap_percentage":{"btc":49.60537150157383,"eth":15.54057550617571,"usdt":5.251613362571061,"bnb":2.4061032890019054,"sol":2.313790384590924,"xrp":1.9452634044631476,"usdc":1.431411419434311,"ada":1.2791619883960377,"steth":1.181808763604494,"avax":0.9722239317120542},"market_cap_change_percentage_24h_usd":1.9464782059800183,"updated_at":1703201062}}
*/
            
            //await CoinGecko.globalDefi.testJSON()

            /*
             */
            // companies
            //await CoinGecko.companies(coinId: "bitcoin").testJSON()

        }
    }
}

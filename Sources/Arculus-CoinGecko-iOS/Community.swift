//
//  File.swift
//  
//
//  Created by Sean Orelli on 12/20/23.
//

import Foundation
extension CoinGecko {
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
    
}

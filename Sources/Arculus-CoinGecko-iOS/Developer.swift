//
//  File.swift
//  
//
//  Created by Sean Orelli on 12/20/23.
//

import Foundation
public extension CoinGecko {
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
}

//
//  EventsModel.swift
//  Sports_App
//
//  Created by Sohila Ahmed on 27/08/2024.
//

//
import Foundation
struct EventsResponse: Codable {
    var success: Int?
    var result: [Events]?
}

// MARK: - Result
struct Events: Codable {
    var eventKey: Int?
    var eventDate: String?
    var eventTime: String?
    var eventHomeTeam: String?
    var homeTeamKey: Int?
    var eventAwayTeam: String?
    var awayTeamKey: Int?
    var eventHalftimeResult, eventFinalResult, eventFtResult: String?
    var eventPenaltyResult: String?
    var eventStatus: String?
    var countryName: String?
    var leagueName: String?
    var leagueKey: Int?
    var leagueRound: String?
    var leagueSeason: String?
    var eventLive, eventStadium, eventReferee: String?
    var homeTeamLogo, awayTeamLogo , leagueLogo: String?
   // var sportsIndex: Int?

    enum CodingKeys: String, CodingKey {
        case eventKey = "event_key"
        case eventDate = "event_date"
        case eventTime = "event_time"
        case eventHomeTeam = "event_home_team"
        case homeTeamKey = "home_team_key"
        case eventAwayTeam = "event_away_team"
        case awayTeamKey = "away_team_key"
        case eventHalftimeResult = "event_halftime_result"
        case eventFinalResult = "event_final_result"
        case eventFtResult = "event_ft_result"
        case eventPenaltyResult = "event_penalty_result"
        case eventStatus = "event_status"
        case countryName = "country_name"
        case leagueName = "league_name"
        case leagueKey = "league_key"
        case leagueRound = "league_round"
        case leagueSeason = "league_season"
        case eventLive = "event_live"
        case eventStadium = "event_stadium"
        case eventReferee = "event_referee"
        case homeTeamLogo = "home_team_logo"
        case awayTeamLogo = "away_team_logo"
        case leagueLogo = "league_logo"
       // case sportsIndex

    }
}
struct LatestResponse: Codable {
    var success: Int?
    var result: [Latest]?
}

// MARK: - Result
struct Latest: Codable {
    var eventKey: Int?
    var eventDate, eventTime, eventHomeTeam: String?
    var homeTeamKey: Int?
    var eventAwayTeam: String?
    var awayTeamKey: Int?
    var eventHalftimeResult, eventFinalResult, eventFtResult, eventPenaltyResult: String?
    var eventStatus, countryName, leagueName: String?
    var leagueKey: Int?
    var leagueRound, leagueSeason, eventLive, eventStadium: String?
    var eventReferee: String?
    var homeTeamLogo, awayTeamLogo: String?
    var eventCountryKey: Int?
    var leagueLogo, countryLogo: String?
    var eventHomeFormation, eventAwayFormation: String?
    var fkStageKey: Int?
    var stageName: String?
    var leagueGroup: String?
    var goalscorers: [Goalscorer]?
   

    enum CodingKeys: String, CodingKey {
        case eventKey = "event_key"
        case eventDate = "event_date"
        case eventTime = "event_time"
        case eventHomeTeam = "event_home_team"
        case homeTeamKey = "home_team_key"
        case eventAwayTeam = "event_away_team"
        case awayTeamKey = "away_team_key"
        case eventHalftimeResult = "event_halftime_result"
        case eventFinalResult = "event_final_result"
        case eventFtResult = "event_ft_result"
        case eventPenaltyResult = "event_penalty_result"
        case eventStatus = "event_status"
        case countryName = "country_name"
        case leagueName = "league_name"
        case leagueKey = "league_key"
        case leagueRound = "league_round"
        case leagueSeason = "league_season"
        case eventLive = "event_live"
        case eventStadium = "event_stadium"
        case eventReferee = "event_referee"
        case homeTeamLogo = "home_team_logo"
        case awayTeamLogo = "away_team_logo"
        case eventCountryKey = "event_country_key"
        case leagueLogo = "league_logo"
        case countryLogo = "country_logo"
        case eventHomeFormation = "event_home_formation"
        case eventAwayFormation = "event_away_formation"
        case fkStageKey = "fk_stage_key"
        case stageName = "stage_name"
        case leagueGroup = "league_group"
        case goalscorers
    }
}

struct Goalscorer: Codable {
    var time, homeScorer, homeScorerID: String?
    var homeAssist: String?
    var homeAssistID, score, awayScorer, awayScorerID: String?
    var awayAssist: String?
    var awayAssistID, info, infoTime: String?

    enum CodingKeys: String, CodingKey {
        case time
        case homeScorer = "home_scorer"
        case homeScorerID = "home_scorer_id"
        case homeAssist = "home_assist"
        case homeAssistID = "home_assist_id"
        case score
        case awayScorer = "away_scorer"
        case awayScorerID = "away_scorer_id"
        case awayAssist = "away_assist"
        case awayAssistID = "away_assist_id"
        case info
        case infoTime = "info_time"
    }
}

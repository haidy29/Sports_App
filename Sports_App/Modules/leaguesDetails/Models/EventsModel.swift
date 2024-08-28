//
//  EventsModel.swift
//  Sports_App
//
//  Created by Sohila Ahmed on 27/08/2024.
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
    var homeTeamLogo, awayTeamLogo: String?
     
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
        
    }
}

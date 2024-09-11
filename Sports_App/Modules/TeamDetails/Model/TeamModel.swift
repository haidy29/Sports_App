//
//  TeamModel.swift
//  Sports_App
//
//  Created by Sohila Ahmed on 10/09/2024.
//

import Foundation


// MARK: - Welcome
struct TeamResponse: Codable {
    var success: Int?
    var result: [Team]?
}

// MARK: - Result
struct Team: Codable {
    var teamKey: Int?
    var teamName: String?
    var teamLogo: String?
    var players: [Player]?
    var coaches: [Coach]?

    enum CodingKeys: String, CodingKey {
        case teamKey = "team_key"
        case teamName = "team_name"
        case teamLogo = "team_logo"
        case coaches
        case players
    }
}

// MARK: - Coach
struct Coach: Codable {
    var coachName: String?
    var coachCountry, coachAge: String?

    enum CodingKeys: String, CodingKey {
        case coachName = "coach_name"
        case coachCountry = "coach_country"
        case coachAge = "coach_age"
    }
}
struct Player: Codable {
    var playerKey: Int?
    var playerImage: String?
    var playerName, playerNumber: String?
    var playerCountry: String?
    var playerType, playerAge, playerMatchPlayed, playerGoals: String?
    var playerYellowCards, playerRedCards, playerInjured, playerSubstituteOut: String?
    var playerSubstitutesOnBench, playerAssists, playerBirthdate, playerIsCaptain: String?
    var playerShotsTotal, playerGoalsConceded, playerFoulsCommitted, playerTackles: String?
    var playerBlocks, playerCrossesTotal, playerInterceptions, playerClearances: String?
    var playerDispossesed, playerSaves, playerInsideBoxSaves, playerDuelsTotal: String?
    var playerDuelsWon, playerDribbleAttempts, playerDribbleSucc, playerPenComm: String?
    var playerPenWon, playerPenScored, playerPenMissed, playerPasses: String?
    var playerPassesAccuracy, playerKeyPasses, playerWoordworks, playerRating: String?

    enum CodingKeys: String, CodingKey {
        case playerKey = "player_key"
        case playerImage = "player_image"
        case playerName = "player_name"
        case playerNumber = "player_number"
        case playerCountry = "player_country"
        case playerType = "player_type"
        case playerAge = "player_age"
        case playerMatchPlayed = "player_match_played"
        case playerGoals = "player_goals"
        case playerYellowCards = "player_yellow_cards"
        case playerRedCards = "player_red_cards"
        case playerInjured = "player_injured"
        case playerSubstituteOut = "player_substitute_out"
        case playerSubstitutesOnBench = "player_substitutes_on_bench"
        case playerAssists = "player_assists"
        case playerBirthdate = "player_birthdate"
        case playerIsCaptain = "player_is_captain"
        case playerShotsTotal = "player_shots_total"
        case playerGoalsConceded = "player_goals_conceded"
        case playerFoulsCommitted = "player_fouls_committed"
        case playerTackles = "player_tackles"
        case playerBlocks = "player_blocks"
        case playerCrossesTotal = "player_crosses_total"
        case playerInterceptions = "player_interceptions"
        case playerClearances = "player_clearances"
        case playerDispossesed = "player_dispossesed"
        case playerSaves = "player_saves"
        case playerInsideBoxSaves = "player_inside_box_saves"
        case playerDuelsTotal = "player_duels_total"
        case playerDuelsWon = "player_duels_won"
        case playerDribbleAttempts = "player_dribble_attempts"
        case playerDribbleSucc = "player_dribble_succ"
        case playerPenComm = "player_pen_comm"
        case playerPenWon = "player_pen_won"
        case playerPenScored = "player_pen_scored"
        case playerPenMissed = "player_pen_missed"
        case playerPasses = "player_passes"
        case playerPassesAccuracy = "player_passes_accuracy"
        case playerKeyPasses = "player_key_passes"
        case playerWoordworks = "player_woordworks"
        case playerRating = "player_rating"
    }
}

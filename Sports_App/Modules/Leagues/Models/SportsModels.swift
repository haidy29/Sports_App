//
//  SportsModels.swift
//  Sports_App
//
//  Created by Sohila Ahmed on 22/08/2024.
//

import Foundation
struct ApiResponse: Codable {
    
        var success: Int?
        var result: [League]
    }

struct League: Codable {
    var leagueKey: Int?
    var leagueName: String?
    var countryKey: Int?
    var countryName: String?
    var leagueLogo: String?
    var countryLogo: String?

    enum CodingKeys: String, CodingKey {
        case leagueKey = "league_key"
        case leagueName = "league_name"
        case countryKey = "country_key"
        case countryName = "country_name"
        case leagueLogo = "league_logo"
        case countryLogo = "country_logo"
    }
}

//et defaultResponse = ApiResponse(success: 0, result: [])
//class JSONNull: Codable, Hashable {
//
//    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
//            return true
//    }
//
//    public var hashValue: Int {
//            return 0
//    }
//
//    public init() {}
//
//    public required init(from decoder: Decoder) throws {
//            let container = try decoder.singleValueContainer()
//            if !container.decodeNil() {
//                    throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
//            }
//    }
//
//    public func encode(to encoder: Encoder) throws {
//            var container = encoder.singleValueContainer()
//            try container.encodeNil()
//    }
//}

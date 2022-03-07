//
//  SearchArticleResponse.swift
//  NewsApp
//
//  Created by Mohannad on 2/5/22.
//

struct SearchCoachingResponse : Codable {
    // MARK: - Proprties
    var status : String
    var totalResults : Int
    var code : String
    var message : String
    var coaches : [CoachesSearchItem]
    
    enum CodingKeys : CodingKey {
        case status ,totalResults, code , message , coaches
    }
    
    init(from decoder: Decoder) throws {
        let container = try? decoder.container(keyedBy: CodingKeys.self)
        self.status = try container?.decodeIfPresent(String.self, forKey: .status) ?? "error"
        self.code = try container?.decodeIfPresent(String.self, forKey: .code) ?? ""
        self.message = try container?.decodeIfPresent(String.self, forKey: .message) ?? ""
        self.totalResults = try container?.decodeIfPresent(Int.self, forKey: .totalResults) ?? 0
        self.coaches = try container?.decodeIfPresent([CoachesSearchItem].self, forKey: .coaches) ?? [CoachesSearchItem]()
    }
}

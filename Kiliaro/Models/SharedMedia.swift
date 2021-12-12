//
//  SharedMedia.swift
//  Kiliaro
//
//  Created by Milad on 9/20/1400 AP.
//

import UIKit
import RealmSwift

// MARK: - Realm Object to Save
class SharedMediaRealmObj: Object {
    
    @objc dynamic var id: Int = -1
    @objc private dynamic var structData:Data? = nil
    
    var sharedMediaStruct : [SharedMedia]? {
        get {
            if let data = structData {
                return try! JSONDecoder().decode([SharedMedia].self, from: data)
            }
            return nil
        }
        set {
            structData = try? JSONEncoder().encode(newValue)
        }
    }
    
    override static func primaryKey() -> String? {
        return "id"
    }
}

// MARK: - SharedMedia
struct SharedMedia: Codable {
    let id: String
    let userId: String
    let mediaType: String
    let filename: String
    let size: Int
    let createdAt: String
    let takenAt: String?
    let guessedTakenAt: String?
    let md5Sum: String
    let contentType: String
    let video: JSONNull?
    let thumbnailUrl: String
    let downloadUrl: String
    let resx: Int
    let resy: Int

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case userId = "user_id"
        case mediaType = "media_type"
        case filename = "filename"
        case size = "size"
        case createdAt = "created_at"
        case takenAt = "taken_at"
        case guessedTakenAt = "guessed_taken_at"
        case md5Sum = "md5sum"
        case contentType = "content_type"
        case video = "video"
        case thumbnailUrl = "thumbnail_url"
        case downloadUrl = "download_url"
        case resx = "resx"
        case resy = "resy"
    }
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public func hash(into hasher: inout Hasher) {
        // No-op
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

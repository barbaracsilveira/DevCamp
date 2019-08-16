//
//  MovieModel.swift
//  DevCamp
//
//  Created by Bárbara Carvalho Silveira on 28/07/19.
//  Copyright © 2019 Bárbara Carvalho Silveira. All rights reserved.
//

import ObjectMapper

final class MovieModel: Mappable {
    var id: Int = 0
    var title: String = ""
    var date: String = ""
    var cardImage: String = ""
    var thumbImage: String = ""
    var synopsis: String = ""
    var duration: String = ""
    var videoID: String = ""
    var categories: [String] = []
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        id              <- map["id"]
        title           <- map["title"]
        date            <- map["date"]
        cardImage       <- map["card_image"]
        thumbImage      <- map["thumb_image"]
        synopsis        <- map["synopsis"]
        duration        <- map["duration"]
        videoID         <- map["videoID"]
        categories      <- map["categories"]
    }
}

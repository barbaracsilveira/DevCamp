//
//  TrackModel.swift
//  DevCamp
//
//  Created by Bárbara Carvalho Silveira on 28/07/19.
//  Copyright © 2019 Bárbara Carvalho Silveira. All rights reserved.
//

import ObjectMapper

final class TrackModel: Mappable {
    var id: Int = 0
    var title: String = ""
    var movies: [MovieModel] = []
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        id              <- map["id"]
        title           <- map["title"]
        movies          <- map["movies"]
    }
}

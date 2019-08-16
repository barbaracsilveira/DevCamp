//
//  HomeModel.swift
//  DevCampTV
//
//  Created by Bárbara Carvalho Silveira on 31/07/19.
//  Copyright © 2019 Bárbara Carvalho Silveira. All rights reserved.
//

import ObjectMapper

final class HomeModel: Mappable {
    
    var tracks: [TrackModel] = []
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        tracks          <- map["tracks"]
    }
}

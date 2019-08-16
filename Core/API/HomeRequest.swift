//
//  HomeRequest.swift
//  DevCamp
//
//  Created by Bárbara Carvalho Silveira on 28/07/19.
//  Copyright © 2019 Bárbara Carvalho Silveira. All rights reserved.
//

import Alamofire
import AlamofireObjectMapper

final class HomeRequest {
    
    static func fetch(completion: @escaping ([TrackModel]?, Error?) -> ()) {
        
        let url = "https://private-aa6a00-devcamp2019.apiary-mock.com/home"
        
        Alamofire.request(url).validate().responseObject { (response: DataResponse<HomeModel>) in
            
            switch response.result {
                
            case .success:
                completion(response.result.value?.tracks, nil)
                
            case .failure(let error):
                completion(nil, error)
                
            }
        }
    }
}

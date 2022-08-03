//
//  GetQuizesTimelinesRequest.swift
//  Nursing
//
//  Created by Андрей Чернышев on 18.06.2022.
//

import Alamofire

struct GetQuizesTimelinesRequest: APIRequestBody {
    let userToken: String
    let courseId: Int
    
    var url: String {
        GlobalDefinitions.domainUrl + "/api/review/timeline"
    }
    
    var method: HTTPMethod {
        .post
    }
    
    var parameters: Parameters? {
        [
            "_api_key": GlobalDefinitions.apiKey,
            "_user_token": userToken,
            "course_id": courseId
        ]
    }
}

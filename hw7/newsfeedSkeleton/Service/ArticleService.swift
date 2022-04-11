//
//  ArticleService.swift
//  newsfeedSkeleton
//
//  Created by Vibha Dabholkar on 4/10/22.
//

import Foundation
import Combine

protocol ArticleService {
    func request(from endpoint: ArticleAPI) -> AnyPublisher< ArticleResponse, APIError>
}

struct ArticleServiceImp1: ArticleService {
    
    func request(from endpoint: ArticleAPI) -> AnyPublisher< ArticleResponse, APIError> {
        
        let jsonDecoder = JSONDecoder()
        jsonDecoder.dateDecodingStrategy = .iso8601
        
        return URLSession.shared
            .dataTaskPublisher(for: emdpoint.urlRequest)
            .recieve(on: DispatchQueue.main)
            .mapError { _ in .unknown }
            .flatMap { data, response -> AnyPublisher<ArticleResponse, APIError> in
                
                guard let response = response as? HTTPURLResponse else {
                    return Fail(error: .unknown)
                        .eraseToAnyPublisher()
                }
                
                if (200...299).contains(response.statusCode) {
                    return Just(data)
                        .decode(type: ArticleResponse.self, decoder: jsonDecoder)
                        .mapError {_ in .decodingError}
                        .eraseToAnyPublisher()
                } else {
                    return Fail(error: .errorCode(resposnse.statusCode))
                        .eraseToAnyPublisher()
                }
            }.eraseToAnyPublisher()
    }
}

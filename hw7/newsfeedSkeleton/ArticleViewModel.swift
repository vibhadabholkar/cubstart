//
//  ArticleViewModel.swift
//  newsfeedSkeleton
//
//  Created by Vibha Dabholkar on 4/10/22.
//

import Foundation
import Combine

protocol ArticleViewModel {
    func getArticles()
}

enum ResultState {
    case loading
    case failed(error: Error)
    case success(content: [Article])
}

class ArticleViewModelImp1: ObservableObject, ArticleViewModel {
    private let service: ArticleService
    private(set) var articles = [Article]()
    
    @Published private(set) var state: ResultState = .loading
    
    private var cancellables = Set<AnyCancellable>()
    
    init(service: ArticleService) {
        self.service = service
    }
    
    func getArticles() {
        self.state = .loading
        
        let cancellable = self.service
            .request(from: .getNews)
            .sink { (res) in
                switch res {
                case .failure(let error):
                    self.state = .failed(error: error)
                case .finished:
                    self.state = .success(contenct: self.articles)
                }
            } recieveValue: {res in
                self.articles = res.articles
            }
        self.cancellables.insert(cancellable)
    }
}

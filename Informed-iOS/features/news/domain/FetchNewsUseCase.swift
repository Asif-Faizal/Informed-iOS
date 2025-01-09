class FetchNewsUseCase: NewsUseCase {
    private let newsRepository: NewsRepository
    
    init(newsRepository: NewsRepository) {
        self.newsRepository = newsRepository
    }
    
    func fetchNews(completion: @escaping (Result<[Article], Error>) -> Void) {
        newsRepository.fetchNews { result in
            switch result {
            case .success(let articles):
                completion(.success(articles))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

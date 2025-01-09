class NewsRepositoryImpl: NewsRepository {
    private let apiClient: APIClient
    
    init(apiClient: APIClient) {
        self.apiClient = apiClient
    }
    
    func fetchNews(completion: @escaping (Result<[Article], Error>) -> Void) {
        apiClient.fetchNews { result in
            switch result {
            case .success(let newsResponse):
                let articles = newsResponse.articles.map { article in
                    Article(
                        title: article.title,
                        description: article.description,
                        url: article.url,
                        imageUrl: article.urlToImage ?? "",
                        publishedAt: article.publishedAt,
                        source: Source(id: article.source.id, name: article.source.name)
                    )
                }
                completion(.success(articles))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

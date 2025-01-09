protocol NewsRepository {
    func fetchNews(completion: @escaping (Result<[Article], Error>) -> Void)
}

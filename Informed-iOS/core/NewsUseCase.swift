protocol NewsUseCase {
    func fetchNews(completion: @escaping (Result<[Article], Error>) -> Void)
}

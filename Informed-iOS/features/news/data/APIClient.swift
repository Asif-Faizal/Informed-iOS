import Foundation
protocol APIClient {
    func fetchNews(completion: @escaping (Result<NewsAPIResponse, Error>) -> Void)
}

class APIClientImpl: APIClient {
    private let session = URLSession.shared
    private let urlString = "https://newsapi.org/v2/everything?q=$apple&sortBy=publishedAt&apiKey=d26344a4cc7045a895af69f018609a64"
    
    func fetchNews(completion: @escaping (Result<NewsAPIResponse, Error>) -> Void) {
        guard let url = URL(string: urlString) else { return }
        
        session.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "No data", code: -1, userInfo: nil)))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let decodedResponse = try decoder.decode(NewsAPIResponse.self, from: data)
                completion(.success(decodedResponse))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}

struct NewsAPIResponse: Codable {
    let status: String
    let totalResults: Int
    let articles: [APIArticle]
}

struct APIArticle: Codable {
    let source: APISource
    let author: String?
    let title: String
    let description: String
    let url: String
    let urlToImage: String?
    let publishedAt: String
}

struct APISource: Codable {
    let id: String?
    let name: String
}

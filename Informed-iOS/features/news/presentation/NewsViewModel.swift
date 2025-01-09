import Foundation
import Combine

class NewsViewModel: ObservableObject {
    private let newsUseCase: NewsUseCase
    
    @Published var articles: [Article] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    
    init(newsUseCase: NewsUseCase) {
        self.newsUseCase = newsUseCase
    }
    
    func loadNews() {
        isLoading = true
        newsUseCase.fetchNews { result in
            DispatchQueue.main.async {
                self.isLoading = false
                switch result {
                case .success(let articles):
                    self.articles = articles
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                }
            }
        }
    }
}

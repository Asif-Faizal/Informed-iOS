import Foundation

class AppDependencyInjector {
    static func inject() -> NewsViewModel {
        // API client is responsible for handling API requests.
        let apiClient = APIClientImpl()
        
        // The repository is responsible for interacting with the API client and returning the data.
        let newsRepository = NewsRepositoryImpl(apiClient: apiClient)
        
        // The use case handles the business logic for fetching news.
        let fetchNewsUseCase = FetchNewsUseCase(newsRepository: newsRepository)
        
        // The view model interacts with the use case to fetch data and prepare it for the view.
        return NewsViewModel(newsUseCase: fetchNewsUseCase)
    }
}

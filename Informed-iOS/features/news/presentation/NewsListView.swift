import SwiftUI

struct NewsListView: View {
    @StateObject private var viewModel: NewsViewModel
    
    init(viewModel: NewsViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        NavigationView {
            VStack {
                if viewModel.isLoading {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                        .padding()
                } else if let errorMessage = viewModel.errorMessage {
                    Text("Error: \(errorMessage)")
                        .foregroundColor(.red)
                } else {
                    List(viewModel.articles) { article in
                        VStack(alignment: .leading) {
                            Text(article.title)
                                .font(.headline)
                            Text(article.description)
                                .font(.subheadline)
                            Text("Published at: \(article.publishedAt)")
                                .font(.caption)
                        }
                        .padding()
                    }
                }
            }
            .onAppear {
                viewModel.loadNews()
            }
            .navigationBarTitle("News")
        }
    }
}

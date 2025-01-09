import Foundation

struct Article: Identifiable {
    let id = UUID()
    let title: String
    let description: String
    let url: String
    let imageUrl: String
    let publishedAt: String
    let source: Source
}

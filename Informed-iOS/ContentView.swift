import SwiftUI

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = AppDependencyInjector.inject()
    
    var body: some View {
        NewsListView(viewModel: viewModel)
    }
}

#Preview {
    ContentView()
}

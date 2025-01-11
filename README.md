# Informed-iOS
Informed is a simple iOS app that allows users to view the latest news articles from various sources. The app follows the principles of `Clean Architecture`, ensuring that the code is modular, testable, and easy to maintain. Built using `SwiftUI`, Combine, and Swift, the app fetches news from an API and displays it in a user-friendly interface with custom themes.

## Features
* View the latest news articles from various sources.
* Display article details including title, description, image, and publication date.
* Refresh news articles with a pull-to-refresh feature.
* Clean architecture with separation of concerns, including:
* Core layer for data models.
* Use Case layer for business logic.
* Data layer for network communication.
* Presentation layer for UI-related tasks.

## Screenshots
![Untitled design (4)](https://github.com/user-attachments/assets/56ceaaa9-fc9e-484e-a9c6-bc48c6dcb657)


## Architecture
The app follows Clean Architecture, which divides the app into the following layers:

### 1. Core Layer
Entities (Models): Represent the data objects used throughout the app, such as Article and Source.
### 2. Use Cases Layer
Business Logic: Defines and implements use cases (e.g., FetchNewsUseCase) that contain the core functionality, like fetching news articles.
### 3. Data Layer
Repositories and API Clients: Handles the interaction with external services like APIs. The NewsRepository retrieves data from the API using the APIClient.
### 4. Presentation Layer
ViewModels and Views: Handles the display logic of the app. The NewsViewModel prepares the data for the UI, and the NewsListView displays the list of articles.

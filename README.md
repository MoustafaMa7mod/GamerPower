# GamerPower

**Overview**

GamerPower App is a SwiftUI-based iOS application that integrates with the GamerPower API to display a list of free game giveaways. The app presents these giveaways in a master/detail format, allowing users to explore different categories of giveaways and navigate through them seamlessly.

The application follows the Clean Architecture pattern, ensuring a clear separation of concerns. It also employs MVVM (Model-View-ViewModel) for structured UI development and a Coordinator pattern for managing navigation. Although the project was initially created using Storyboard, all UI components are built entirely with SwiftUI to simplify navigation management.

**Features**

- Home Screen: Displays a list of available game giveaways fetched from the GamerPower API.

- Category-Based Filtering: 
   - The home screen features a carousel displaying giveaway categories.
   - Selecting a category filters the giveaways relevant to that category
   - A "More" button navigates to a screen displaying all available categories in sections

- Rotating Carousel Items:
   - On the "More" screen, each category has a section with its related giveaways.
   - Items in each section appear as a rotating carousel while scrolling
   
- Asynchronous Data Fetching: Uses async/await for smooth and efficient API interactions.

- Coordinator-based Navigation: Manages navigation using the Coordinator pattern for better structure and scalability.

- SwiftUI-based UI: While the project was initialized with a storyboard, all UI components are implemented using SwiftUI for a modern and responsive user experience.

**Architecture**

The project follows the Clean Architecture pattern with MVVM (Model-View-ViewModel), separating concerns across different layers:

- Presentation Layer: Contains SwiftUI Views and ViewModels.
- Domain Layer: Defines business logic and use cases.
- Data Layer: Handles data fetching and mapping.
- Network Layer: Implemented as a separate local Swift package using Moya.

**Project Structure**

📂 GamerPower
├── 📂 Presentation (SwiftUI Views & ViewModels)
├── 📂 Domain (Use Cases & Business Logic)
├── 📂 Data (Repositories & API Handlers)
├── 📂 NetworkLayer (Local Swift Package for API requests using Moya)
├── 📂 Resources (Assets, Strings, etc.)
└── 📂 Coordinators (Handles navigation using Coordinator pattern)

**Technologies Used**

- SwiftUI: Framework for building the user interface.
- Moya: For network requests and API interaction.
- Async/Await: For handling asynchronous operations.
- GamerPower API: Used for retrieving game giveaways.
- Coordinator Pattern: Manages navigation flow between screens.
- Kingfisher: Efficient image loading & caching
- Unit Testing - Each layer is individually tested:

    - Domain Layer: Tests use cases and mock Repositories.
    - Data Layer: Tests repositories and remotes api.
    - Network Layer: Tests API interactions with Moya stubbing.
    - Presentation Layer: Tests ViewModels to ensure correct UI state updates.

**Installation**

- Clone the repository:
    ```
    https://github.com/MoustafaMa7mod/GamerPower.git
    ```
- Open the .xcodeproj file in Xcode.
- Run the project on an iOS simulator or device.

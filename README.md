# SnowSeeker

## Overview
<table>
  <tr>
    <td>
      <img src="https://github.com/penguin-waddle/SnowSeeker/assets/123434744/460532c6-c8a0-4bae-b1f9-2e440946fa29" alt="SnowSeeker App Demo" width="300" />
    </td>
    <td>
      SnowSeeker is an engaging iOS app designed for ski enthusiasts, featuring a comprehensive guide to global ski resorts. It combines user-friendly navigation with detailed resort information, like size, pricing, and facilities. The app exemplifies advanced SwiftUI capabilities, including efficient JSON data handling and interactive UI elements. It stands as a testament to building complex, feature-rich iOS applications using SwiftUI.
    </td>
  </tr>
</table>

## Features
- **Resort Exploration**: Users can browse a curated list of ski resorts from various countries.
- **Detailed Information**: Each resort has detailed information including size, price, elevation, snow depth, and available facilities.
- **Search and Sort**: Resorts can be searched and sorted alphabetically or by country.
- **Favorites**: Users can mark resorts as favorites for quick access.
- **Adaptive Layout**: The app provides a responsive design that adapts to various device orientations and sizes.

## Technical Highlights
- **SwiftUI Navigation**: Implements advanced navigation patterns in SwiftUI.
- **Custom Views**: Utilizes custom views for displaying resort details and ski conditions.
- **Dynamic User Interface**: Adapts to different iOS device capabilities like size classes and dynamic type sizes.
- **JSON Data Handling**: Resorts data is loaded and decoded from a local JSON file using a custom `Bundle` extension.
- **State and Environment Management**: Manages application state using `@State`, `@EnvironmentObject`, and other SwiftUI property wrappers.

## Code Structure
- `ContentView`: The main view of the app, handling the navigation and display of resort lists.
- `ResortView`: A detailed view of each resort, showing more specific information.
- `Favorites`: A class to manage and store user's favorite resorts.
- `Facility`: Represents individual facilities available at resorts.
- `Bundle-Decodable`: An extension to easily decode JSON data into model objects.

## User Interface
- The app uses a split view to display the list of resorts and detailed views.
- Each resort is represented with a card-like design, enhancing the user experience.
- The interface is intuitive, allowing users to effortlessly navigate through the app's content.

## Challenges and Learnings
- Implementing a complex UI with SwiftUI, focusing on adaptability and responsiveness.
- Efficiently managing and decoding JSON data in a SwiftUI application.
- Creating a user-friendly search and sort functionality.

## Future Enhancements
- Integrate real-time data for snow and weather conditions.
- Allow users to add personal notes or reviews for each resort.
- Provide options to book ski passes or accommodations directly through the app.

---

*SnowSeeker is part of the "100 Days of SwiftUI" course, focusing on advanced SwiftUI concepts and user interface design.*

---

[Back to Main Repository](https://github.com/penguin-waddle/100-Days-of-SwiftUI)

# SevenAppsProject

## Features
1. **User List Screen**
   - Fetches a list of users from the API.
   - Displays user name and email in a table view.
   - Implements efficient data loading and UI updates.
2. **User Detail Screen**
   - Shows detailed information of a selected user, including name, email, phone, and website.
3. **Navigation**
   - Navigation is implemented from the User List screen to the User Detail screen using `UINavigationController`.
4. **Networking Layer**
   - A dedicated network service (`SevenAppsService`) handles API calls.
5. **Repository Pattern**
   - The repository pattern is used to abstract data fetching and management.
6. **Unit Tests**
   - Unit tests are written in the `SevenAppsAPITests` module for the network layer and view models.

## Architecture
The project adheres to the **MVVM** architecture:
- **Model**: Defines the data structures (`UserInfo`).
- **View**: Handles the UI components (`UserListViewController`, `UserListDetailViewController`).
- **ViewModel**: Provides data to the view and handles user interaction (`UserListViewModel`, `UserListDetailViewModel`).

### Protocols and Delegation
- Protocols are used to define the interface for the view models.
- Delegation is implemented using closures (`changeHandler`) to notify the view controllers about data changes or errors.

### Networking Layer
The `SevenAppsService` class handles API calls and parsing:
- Implements `SevenAppsServiceProtocol` to fetch user data.
- Uses URLSession to perform network requests.

### Memory Management
- **Weak References**: Weak references are used in closures to avoid retain cycles (e.g., `[weak self]` inside closures).

## How to Run the Project
1. Clone the repository.
2. Open `SevenAppsProject.xcworkspace` in Xcode.
3. Select a simulator and build the project (`Cmd + B`).
4. Run the app (`Cmd + R`).

## How to Run Unit Tests
1. Select the `SevenAppsAPI` scheme.
2. Press `Cmd + U` to run the unit tests.


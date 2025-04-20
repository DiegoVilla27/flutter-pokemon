# 🗡️ Pokedex Flutter App

This Flutter application is a **Pokedex** built with **Clean Architecture** principles. It allows users to view a list of Pokémon, search for specific Pokémon, switch between different Pokémon generations, and view detailed information about each Pokémon.

## 📱 Features

- 🧑‍💻 **Clean Architecture**: Follows Clean Architecture with separation of concerns.
- 🔍 **Search Pokémon**: A search bar to quickly find any Pokémon by name.
- 🌀 **Generation Toggle**: A button to switch between Pokémon generations (e.g., Generation 1, Generation 2).
- 📑 **Pokemon Details**: View detailed information about each Pokémon, including stats, types, and abilities.
  
## 🧭 Screens

- **Main Screen**:
  - Displays a list of Pokémon with a search bar.
  - A button to change the Pokémon generation.
- **Pokemon Details Screen**:
  - Displays detailed information about a selected Pokémon (name, image, stats, types, evolutions).

## 🛠 Architecture Overview

The app is structured following **Clean Architecture** principles:

### Main Layers:

1. **Data Layer**: Contains all the data-fetching logic (API calls, repositories).
2. **Domain Layer**: Holds business logic like use cases, entities, and interfaces.
3. **Presentation Layer**: Manages UI and state management (Widgets).

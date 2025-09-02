# Weather App

A minimal and elegant Flutter weather application that displays current weather information based on the user's location. The app fetches real-time weather data from the OpenWeatherMap API and presents it with beautiful Lottie animations.

## Features

- **Real-time Weather Data**: Fetches current weather information using OpenWeatherMap API
- **Automatic Location Detection**: Uses device GPS to get current location and city name
- **Dynamic Animations**: Displays weather-appropriate Lottie animations based on weather conditions
- **Clean UI**: Minimalist design with a dark theme
- **Location Permission Handling**: Properly requests and handles location permissions
- **Error Handling**: Graceful error handling for API failures and permission denials

## Supported Weather Conditions

The app includes animations for the following weather conditions:
- Sunny/Clear weather
- Cloudy/Mist/Smoke/Haze/Dust/Fog
- Rain/Drizzle/Shower rain
- Thunderstorm

## Project Structure

```
weather_app/
├── lib/
│   ├── main.dart                 # App entry point
│   ├── models/
│   │   └── weather_model.dart    # Weather data model
│   ├── pages/
│   │   └── weather_page.dart     # Main weather display page
│   ├── services/
│   │   └── weather_service.dart  # Weather API service
│   └── theme/
│       └── theme.dart            # App theme and colors
├── assets/                       # Lottie animation files
│   ├── Weather-cloudy.json
│   ├── Weather-rainny.json
│   ├── Weather-sunny.json
│   └── Weather-thunder.json
├── android/                      # Android platform files
├── .env                          # Environment variables (API key)
├── pubspec.yaml                  # Flutter dependencies
└── README.md                     # This file
```

## Dependencies

- **flutter**: SDK for building the app
- **http**: For making API requests to OpenWeatherMap
- **geolocator**: For getting device location
- **geocoding**: For converting coordinates to city names
- **lottie**: For weather condition animations
- **flutter_dotenv**: For managing environment variables

## Setup Instructions

### Prerequisites

- Flutter SDK (version 3.8.1 or higher)
- Android Studio or VS Code with Flutter extensions
- OpenWeatherMap API key (free tier available)

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/4bhisheksharma/flutter-weather-app.git
   cd weather_app
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Set up environment variables**
   - Create a `.env` file in the root directory
   - Add your OpenWeatherMap API key:
     ```
     WEATHER_API_KEY=your_api_key_here
     ```
   - Get your free API key from [OpenWeatherMap](https://openweathermap.org/api)

4. **Configure Android permissions**
   - The app requires location permissions which are already configured in `android/app/src/main/AndroidManifest.xml`

### Running the App

1. **Connect a device or start an emulator**
   ```bash
   flutter devices
   ```

2. **Run the app**
   ```bash
   flutter run
   ```

## API Configuration

The app uses the OpenWeatherMap API with the following configuration:
- Base URL: `http://api.openweathermap.org/data/2.5/weather`
- Units: Metric (°C)
- API Key: Stored securely in `.env` file

## Permissions

The app requires the following permissions:
- **Location**: To get current city and weather data
- **Internet**: To fetch weather data from OpenWeatherMap API

## Development

## Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## Troubleshooting

### Common Issues

1. **API Key Error**: Ensure your `.env` file contains a valid OpenWeatherMap API key
2. **Location Permission Denied**: Grant location permissions when prompted
3. **Build Errors**: Run `flutter clean` and `flutter pub get` to resolve dependency issues


## License

This project is open source, anyone can use it.
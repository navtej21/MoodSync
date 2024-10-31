🎶 MoodSync - AI-Curated Music Recommendation App MoodSync is an intelligent music recommendation app built using Flutter that curates playlists based on your mood. Powered by AI, MoodSync analyzes user input and mood data to offer the perfect soundtrack for every moment, whether you're looking to boost productivity, relax, or energize.

🌟 Features AI-Powered Mood Detection: Accurately detects user moods to recommend music that matches the current feeling. Personalized Playlists: Curated playlists based on moods such as happy, calm, energetic, and focused. User-Friendly Interface: A sleek, intuitive interface that’s easy to navigate. Real-Time Recommendations: Quickly delivers recommendations to fit any mood at any moment. Cross-Platform: Built with Flutter, ensuring smooth performance on both Android and iOS.

📲 Screenshots ///////////////////////////////////////

📥 Installation Guide This guide will help you set up MoodSync on your local machine.

Prerequisites To get started, make sure your system meets the following requirements:

Flutter SDK: Version 3.5.2 or later is required. Follow the Flutter installation guide to set up Flutter on your machine. Be sure to add Flutter to your system's PATH. Dart SDK: Compatible with Flutter SDK 3.5.2. The Dart SDK is included with Flutter, so it will be installed alongside Flutter. Appwrite Server (optional): Appwrite is used as the backend service for this project. If you plan to utilize Appwrite, set up an Appwrite server and configure your Appwrite credentials in the .env file (details below). Steps to Install and Run MoodSync

1.Clone the Repository Begin by cloning the repository from GitHub:

git clone https://github.com/username/MoodSync.git cd MoodSync

Replace username with the GitHub username of the repository owner if different.

2.Install Dependencies

Install all project dependencies specified in pubspec.yaml by running the following command:

flutter pub get

This will download and set up all required packages, such as appwrite, flutter_svg, and google_generative_ai.

3.Environment Setup

The MoodSync app uses environment variables to manage sensitive information (like API keys). To set these up:

.Create a .env file in the root directory of the project.

.Open .env and add your API keys and other necessary environment variables in this format:

APPWRITE_PROJECT_ID=your_project_id APPWRITE_API_KEY=your_api_key GOOGLE_GENERATIVE_AI_API_KEY=your_generative_ai_key

Refer to a provided .env.example file (if available) for guidance on all necessary keys and their formats.

Note: Be sure not to expose your .env file if pushing this code to a public repository.

4.Run the App

To launch the app, execute the following command:

flutter run

Android: Make sure you have an Android emulator set up, or connect a physical Android device. iOS: Ensure you have Xcode installed and an iOS simulator or a physical iOS device connected. Web: Run the app with flutter run -d chrome to view the application on the web.

5.Configure Appwrite (Optional)

If you plan to use Appwrite as the backend for your project:

Set up an Appwrite server. Configure your Appwrite Project ID, API key, and any other relevant Appwrite settings in the .env file as shown above. Ensure your Appwrite server is running before launching the app.

🔧 Additional Information Assets: The project includes assets like images located in the assets/images/ folder. These are preconfigured in pubspec.yaml, so Flutter will automatically include them in the app. Troubleshooting: If you encounter issues with Flutter dependencies, try running flutter clean and then flutter pub get to reset dependencies.

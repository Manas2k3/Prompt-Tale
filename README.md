# Prompt Tale
## Overview
The Story Generator App is a Flutter application that allows users to generate and display stories based on text prompts. It also provides functionality to read the generated story aloud using text-to-speech (TTS) services.

## Features
- Generate stories based on user prompts
- Display generated stories in a scrollable view
- Read stories aloud using TTS functionality

## Prerequisites
- Flutter SDK installed
- Dart SDK installed
- An active API key for the Gemini API

## Setup and Installation

1. **Clone the Repository**

   ```bash
   git clone https://github.com/Manas2k3/Prompt-Tale.git
   ```

2. **Navigate to the Project Directory**

   ```bash
   cd your-repository-name
   ```

3. **Install Dependencies**

   Run the following command to install the necessary packages:

   ```bash
   flutter pub get
   ```

4. **Configure API Key**

   - Obtain your Gemini API key.
   - Replace `YOUR_GEMINI_API_KEY` in the `lib/services/gemini_api_service.dart` file with your actual API key.

5. **Run the App**

   To run the app on a connected device or emulator, use:

   ```bash
   flutter run
   ```

## Usage

1. **Open the App**

   Launch the app on your device or emulator.

2. **Generate a Story**

   - Enter a prompt in the provided text field.
   - Tap the "Generate Story" button to generate a story based on your prompt.

3. **Display and Read the Story**

   - The generated story will appear on the screen.
   - Tap the speaker icon to read the story aloud using TTS functionality.

## File Structure

- `lib/main.dart`: Entry point of the application.
- `lib/screens/story_display.dart`: Contains the `StoryDisplay` widget for displaying and reading stories.
- `lib/screens/prompt_input.dart`: Contains the `PromptInput` widget for entering prompts.
- `lib/services/gemini_api_service.dart`: Handles API requests to the Gemini service.

## Contributing

If you want to contribute to the development of this app, please follow these steps:

1. Fork the repository.
2. Create a new branch for your feature or bug fix.
3. Make your changes and test thoroughly.
4. Submit a pull request with a clear description of your changes.


## Screenshots

### Main Screen
![Story Generation](https://github.com/user-attachments/assets/a4169be8-eceb-4b00-84f1-474863b5d91a)


### Story Generation
![Main Screen](https://github.com/user-attachments/assets/d4063683-23a3-408a-ae57-dd9e08794be5)



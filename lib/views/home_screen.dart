import 'package:flutter/material.dart';
import 'package:prompt_tale/services/gemini_api_service.dart';
import 'package:prompt_tale/services/tts_service.dart';
import 'package:prompt_tale/utils/constants.dart';

import '../widgets/prompt_input.dart';
import '../widgets/story_display.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GeminiApiService _geminiApiService =
      GeminiApiService(apiKey: YOUR_GEMINI_API_KEY);
  final TTSService _ttsService = TTSService();
  String _story = '';
  bool _isLoading = false;

  Future<void> _generateAndSpeakStory(String prompt) async {
    setState(() {
      _isLoading = true;
      _story = '';
    });

    try {
      final generatedStory = await _geminiApiService.generateStory(prompt);
      setState(() {
        _story = generatedStory;
      });
      await _ttsService.speak(generatedStory);
    } catch (e) {
      setState(() {
        if (e.toString().contains('API Error (500)')) {
          _story =
              'The story generator is currently experiencing technical difficulties. Please try again later.';
        } else {
          _story =
              'Error generating story: ${e.toString()}\n\nPlease try again or check your internet connection.';
        }
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Story Generator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              PromptInput(onSubmit: _generateAndSpeakStory),
              const SizedBox(height: 20),
              _isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : StoryDisplay(story: _story, onSpeak: _ttsService.speak),
            ],
          ),
        ),
      ),
    );
  }
}

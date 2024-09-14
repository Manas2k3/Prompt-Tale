import 'package:flutter_tts/flutter_tts.dart';

class TTSService {
  final FlutterTts _flutterTts = FlutterTts();

  Future<void> initialize() async {
    // Get available voices and set the default or a chosen one
    var voices = await _flutterTts.getVoices;
    print(voices);
    // Example: Set a specific voice (replace with actual voice ID or name)
    // _selectedVoice = 'com.example.voice.id'; // You need to set this based on available voices
  }

  Future<void> speak(String text) async {
    await _flutterTts.setLanguage('en-US');
    await _flutterTts.setPitch(1.0);
    await _flutterTts.setSpeechRate(0.4);
    // Optionally set the voice if needed
    // if (_selectedVoice != null) {
    //   await _flutterTts.setVoice(_selectedVoice!);
    // }

    await _flutterTts.speak(text);
  }

  // Note: Play, pause, and resume functionalities are not yet implemented in this version
}

import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart' as http;

class GeminiApiService {
  final String apiKey;
  final String baseUrl =
      'https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash:generateContent';

  GeminiApiService({required this.apiKey});

  Future<String> generateStory(String prompt) async {
    try {
      final requestBody = {
        "contents": [
          {
            "parts": [
              {"text": prompt}
            ]
          }
        ]
      };

      final response = await http.post(
        Uri.parse('$baseUrl?key=$apiKey'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(requestBody),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final candidates = data['candidates'] as List?;
        if (candidates != null && candidates.isNotEmpty) {
          final output = candidates[0]['content']['parts'][0]['text'];
          if (output != null) {
            return output as String;
          }
        }
        throw Exception('No valid output in API response');
      } else {
        final errorData = jsonDecode(response.body);
        final errorMessage = errorData['error']['message'] as String?;
        throw Exception(
            'API Error (${response.statusCode}): ${errorMessage ?? "Unknown error"}');
      }
    } catch (e) {
      log('Exception in generateStory: $e' as num);
      rethrow;
    }
  }
}

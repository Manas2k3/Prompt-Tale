import 'package:flutter/material.dart';

class StoryDisplay extends StatelessWidget {
  final String story;
  final Future<void> Function(String) onSpeak; // Function to handle the TTS

  const StoryDisplay({
    Key? key,
    required this.story,
    required this.onSpeak,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.grey[200], // Background color for the container
            borderRadius: BorderRadius.circular(12), // Rounded corners
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Text displaying the story
              Expanded(
                child: Text(
                  story.isNotEmpty ? story : 'Your generated story will appear here.',
                  style: const TextStyle(fontSize: 18),
                ),
              ),
              // Icon for speaker, which reads the story when tapped
              IconButton(
                icon: const Icon(Icons.volume_up),
                onPressed: () async {
                  if (story.isNotEmpty) {
                    await onSpeak(story); // Call the provided function to speak the story
                  } else {
                    // Show a message if no story is available
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('No story available to read aloud.')),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

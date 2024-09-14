import 'package:flutter/material.dart';

class PromptInput extends StatelessWidget {
  final Function(String) onSubmit;
  final TextEditingController _controller = TextEditingController();

  PromptInput({Key? key, required this.onSubmit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _controller,
          decoration: const InputDecoration(
            labelText: 'Enter your story prompt',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {
            if (_controller.text.isNotEmpty) {
              onSubmit(_controller.text);
              _controller.clear(); // Clear the input after submission
            }
          },
          child: const Text('Generate Story'),
        ),
      ],
    );
  }
}
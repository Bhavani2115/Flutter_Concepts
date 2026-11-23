import 'dart:async';

import 'package:flutter/material.dart';

class SingleStreamDemo extends StatefulWidget {
  const SingleStreamDemo({super.key});

  @override
  State<SingleStreamDemo> createState() => _SingleStreamDemoState();
}

class _SingleStreamDemoState extends State<SingleStreamDemo> {
  final StreamController<String> streamController = StreamController<String>();

  final TextEditingController textEditingController = TextEditingController();

  @override
  void dispose() {
    streamController.close();
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Single Stream')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: textEditingController,
              decoration: const InputDecoration(
                hintText: 'Enter your text',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 15),

            ElevatedButton(
              onPressed: () {
                streamController.add(textEditingController.text);
              },
              child: const Text('Done'),
            ),

            const SizedBox(height: 30),

            StreamBuilder<String>(
              stream: streamController.stream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(
                    snapshot.data!,
                    style: const TextStyle(fontSize: 25),
                  );
                }

                return const Text('No data', style: TextStyle(fontSize: 20));
              },
            ),
          ],
        ),
      ),
    );
  }
}

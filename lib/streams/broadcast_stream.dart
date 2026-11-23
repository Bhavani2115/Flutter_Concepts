// import 'dart:async';
// import 'package:flutter/material.dart';

// void main() {
//   runApp(
//     const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: BroadcastStreamDemo(),
//     ),
//   );
// }

// class BroadcastStreamDemo extends StatefulWidget {
//   const BroadcastStreamDemo({super.key});

//   @override
//   State<BroadcastStreamDemo> createState() =>
//       _BroadcastStreamDemoState();
// }

// class _BroadcastStreamDemoState
//     extends State<BroadcastStreamDemo> {

//   final StreamController<String> streamController =
//       StreamController<String>.broadcast();

//   final TextEditingController textEditingController =
//       TextEditingController();

//   @override
//   void dispose() {
//     streamController.close();
//     textEditingController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Broadcast Stream'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20),
//         child: Column(
//           children: [
//             TextField(
//               controller: textEditingController,
//               decoration: const InputDecoration(
//                 hintText: 'Enter your text',
//                 border: OutlineInputBorder(),
//               ),
//             ),

//             const SizedBox(height: 15),

//             ElevatedButton(
//               onPressed: () {
//                 streamController.add(
//                   textEditingController.text,
//                 );
//               },
//               child: const Text('Done'),
//             ),

//             const SizedBox(height: 30),

//             const Text(
//               'Subscriber 1',
//               style: TextStyle(fontSize: 18),
//             ),

//             StreamBuilder<String>(
//               stream: streamController.stream,
//               builder: (context, snapshot) {
//                 return Text(
//                   snapshot.data ?? 'No data',
//                   style: const TextStyle(fontSize: 25),
//                 );
//               },
//             ),

//             const Divider(height: 40),

//             const Text(
//               'Subscriber 2',
//               style: TextStyle(fontSize: 18),
//             ),

//             StreamBuilder<String>(
//               stream: streamController.stream,
//               builder: (context, snapshot) {
//                 return Text(
//                   snapshot.data ?? 'No data',
//                   style: const TextStyle(fontSize: 25),
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'dart:async';

import 'package:flutter/material.dart';

class BroadcastStreamDemo extends StatefulWidget {
  const BroadcastStreamDemo({super.key});

  @override
  State<BroadcastStreamDemo> createState() => _BroadcastStreamDemoState();
}

class _BroadcastStreamDemoState extends State<BroadcastStreamDemo> {
  late Stream<String> dataStream;

  final StreamController<String> streamController = StreamController<String>();
  final TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();

    dataStream = streamController.stream.asBroadcastStream();
  }

  @override
  void dispose() {
    streamController.close();
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Broadcast Stream')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: textEditingController,
              decoration: const InputDecoration(
                hintText: 'Enter text',
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

            const Text('Subscriber 1'),

            StreamBuilder<String>(
              stream: dataStream,
              builder: (context, snapshot) {
                return Text(
                  snapshot.data ?? 'No data',
                  style: const TextStyle(fontSize: 25),
                );
              },
            ),

            const Divider(height: 40),

            const Text('Subscriber 2'),

            StreamBuilder<String>(
              stream: dataStream,
              builder: (context, snapshot) {
                return Text(
                  snapshot.data ?? 'No data',
                  style: const TextStyle(fontSize: 25),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

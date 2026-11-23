import 'package:flutter/material.dart';

import 'single_stream.dart';
import 'broadcast_stream.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: SingleStreamDemo(),
      home: BroadcastStreamDemo(),
    ),
  );
}

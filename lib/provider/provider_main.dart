import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'number_provider.dart';
import 'provider_home.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => NumberProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: ProviderHome());
  }
}

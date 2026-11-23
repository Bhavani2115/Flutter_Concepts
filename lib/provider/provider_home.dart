import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'number_provider.dart';
import 'provider_second.dart';

class ProviderHome extends StatelessWidget {
  const ProviderHome({super.key});

  @override
  Widget build(BuildContext context) {
    final numberProvider = context.watch<NumberProvider>();

    return Scaffold(
      appBar: AppBar(title: const Text('Home - Provider')),

      body: Column(
        children: [
          Text(
            numberProvider.numbers.last.toString(),
            style: const TextStyle(fontSize: 30),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: numberProvider.numbers.length,
              itemBuilder: (context, index) {
                return Text(
                  numberProvider.numbers[index].toString(),
                  style: const TextStyle(fontSize: 30),
                );
              },
            ),
          ),

          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProviderSecond()),
              );
            },
            child: const Text('Second'),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<NumberProvider>().addNumber();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'number_provider.dart';

class ProviderSecond extends StatelessWidget {
  const ProviderSecond({super.key});

  @override
  Widget build(BuildContext context) {
    final numberProvider = context.watch<NumberProvider>();

    return Scaffold(
      appBar: AppBar(title: const Text('Second - Provider')),

      body: Column(
        children: [
          Text(
            numberProvider.numbers.last.toString(),
            style: const TextStyle(fontSize: 30),
          ),

          Expanded(
            child: SizedBox(
              height: 200,
              width: double.infinity,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: numberProvider.numbers.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Text(
                      numberProvider.numbers[index].toString(),
                      style: const TextStyle(fontSize: 30),
                    ),
                  );
                },
              ),
            ),
          ),

          ElevatedButton(
            onPressed: () {
              context.read<NumberProvider>().addNumber();
            },
            child: const Text('Add Number'),
          ),
        ],
      ),
    );
  }
}

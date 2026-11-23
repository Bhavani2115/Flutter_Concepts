import 'package:flutter/material.dart';

class Second extends StatefulWidget {
  final List<int> numbers;

  const Second({super.key, required this.numbers});

  @override
  State<Second> createState() => _SecondState();
}

class _SecondState extends State<Second> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Second')),

      body: Container(
        child: Column(
          children: [
            Text(
              widget.numbers.last.toString(),
              style: TextStyle(fontSize: 30),
            ),
            Expanded(
              child: Container(
                height: 200,
                width: double.infinity,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.numbers.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Text(
                        widget.numbers[index].toString(),
                        style: const TextStyle(fontSize: 30),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          int last = widget.numbers.last;

          setState(() {
            widget.numbers.add(last + 1);
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

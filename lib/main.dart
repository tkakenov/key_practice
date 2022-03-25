import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<int> _elements = List.generate(10, (index) => index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ReorderableListView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            for (int element in _elements)
              ListTile(
                key: ValueKey(_elements[element]),
                tileColor: element.isOdd ? Colors.amber : Colors.grey,
                title: Text(
                  "$element - Element",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w800),
                ),
              ),
          ],
          onReorder: (oldIndex, newIndex) {
            setState(() {
              if (oldIndex < newIndex) {
                newIndex -= 1;
              }
              _elements.insert(newIndex, _elements.removeAt(oldIndex));
            });
          }),
    );
  }
}

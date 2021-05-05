// main.dart
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Remove the debug banner
      debugShowCheckedModeBanner: false,
      title: 'Kindacode.com',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Generate dummy data for the list view
  List<String> _products =
      List.generate(100, (index) => "Product ${index.toString()}");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kindacode.com'),
      ),
      body: ReorderableListView.builder(
          itemCount: _products.length,
          itemBuilder: (context, index) {
            final String productName = _products[index];
            return Card(
              key: ValueKey(productName),
              color: Colors.amberAccent,
              elevation: 1,
              margin: const EdgeInsets.all(10),
              child: ListTile(
                contentPadding: EdgeInsets.all(25),
                title: Text(
                  productName,
                  style: TextStyle(fontSize: 18),
                ),
                trailing: Icon(Icons.drag_handle),
                onTap: () {/* Do something else */},
              ),
            );
          },
          // The reorder function
          onReorder: (oldIndex, newIndex) {
            setState(() {
              if (newIndex > oldIndex) {
                newIndex = newIndex - 1;
              }
              final element = _products.removeAt(oldIndex);
              _products.insert(newIndex, element);
            });
          },
          ),
    );
  }
}
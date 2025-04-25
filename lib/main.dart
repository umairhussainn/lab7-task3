import 'package:flutter/material.dart';

void main() {
  runApp(DatabaseApp());
}

class DatabaseApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DatabaseScreen(),
    );
  }
}

class DatabaseScreen extends StatefulWidget {
  @override
  _DatabaseScreenState createState() => _DatabaseScreenState();
}

class _DatabaseScreenState extends State<DatabaseScreen> {
  bool _isLoading = true;
  List<String> _data = [];

  @override
  void initState() {
    super.initState();
    _fetchData(); // Simulate fetching on start
  }

  Future<void> _fetchData() async {
    // Simulate a 2-second database query delay
    await Future.delayed(Duration(seconds: 2));

    setState(() {
      _data = [
        'Item 1',
        'Item 2',
        'Item 3',
        'Item 4',
        'Item 5',
      ];
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Local DB Simulation")),
      body: Center(
        child: _isLoading
            ? CircularProgressIndicator()
            : Column(
          children: [
            // Add Network Image here
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.network(
                'https://plus.unsplash.com/premium_photo-1664297989345-f4ff2063b212?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8ZGF0YWJhc2V8ZW58MHx8MHx8fDA%3D',
                height: 120,
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 16),
                itemCount: _data.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      title: Text(_data[index]),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

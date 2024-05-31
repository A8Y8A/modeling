import 'package:flutter/material.dart';
import 'package:quiz1/question2/get_items.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lazy Loading',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lazy Loading'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text('Categories'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => LazyLoadingScreen(
                        title: 'Categories', future: getCategories())),
              );
            },
          ),
          ListTile(
            title: Text('Venues'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => LazyLoadingScreen(
                        title: 'Venues', future: getVenues())),
              );
            },
          ),
          ListTile(
            title: Text('Languages'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => LazyLoadingScreen(
                        title: 'Languages', future: getLanguages())),
              );
            },
          ),
        ],
      ),
    );
  }
}

class LazyLoadingScreen extends StatelessWidget {
  final String title;
  final Future<List<String>> future;

  LazyLoadingScreen({required this.title, required this.future});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: FutureBuilder<List<String>>(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No data available'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(snapshot.data![index]),
                );
              },
            );
          }
        },
      ),
    );
  }
}

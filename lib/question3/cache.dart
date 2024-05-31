import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quiz1/question3/get_user.dart';
import 'package:quiz1/question3/user_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'User List',
      home: UserListScreen(),
    );
  }
}

class UserListScreen extends StatefulWidget {
  @override
  _UserListScreenState createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  List<int> userIds = [];
  Map<int, User> userCache = {};

  @override
  void initState() {
    super.initState();
    _loadUserIds();
  }

  Future<void> _loadUserIds() async {
    String data = await rootBundle.loadString('assets/lottie/usrs.json');
    List<dynamic> jsonResult = json.decode(data);
    setState(() {
      userIds = jsonResult.map((user) => user['id'] as int).toList();
    });
  }

  void _navigateToUserDetail(int id) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => UserDetailScreen(
          userId: id,
          userCache: userCache,
          cacheUser: (id, user) => userCache[id] = user,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Users'),
      ),
      body: ListView.builder(
        itemCount: userIds.length,
        itemBuilder: (context, index) {
          int userId = userIds[index];
          return ListTile(
            title: Text('User $userId'),
            onTap: () => _navigateToUserDetail(userId),
          );
        },
      ),
    );
  }
}

class UserDetailScreen extends StatefulWidget {
  final int userId;
  final Map<int, User> userCache;
  final Function(int, User) cacheUser;

  UserDetailScreen({
    required this.userId,
    required this.userCache,
    required this.cacheUser,
  });

  @override
  _UserDetailScreenState createState() => _UserDetailScreenState();
}

class _UserDetailScreenState extends State<UserDetailScreen> {
  User? user;

  @override
  void initState() {
    super.initState();
    _loadUser();
  }

  void _loadUser() {
    if (widget.userCache.containsKey(widget.userId)) {
      setState(() {
        user = widget.userCache[widget.userId];
      });
    } else {
      User? fetchedUser = getUserById(widget.userId);
      if (fetchedUser != null) {
        widget.cacheUser(widget.userId, fetchedUser);
      }
      setState(() {
        user = fetchedUser;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (user == null) {
      return Scaffold(
        appBar: AppBar(
          title: Text('User Detail'),
        ),
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(user!.getFullName()),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.network(user!.image),
            SizedBox(height: 16),
            Text(
              user!.getFullName(),
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(user!.about),
          ],
        ),
      ),
    );
  }
}

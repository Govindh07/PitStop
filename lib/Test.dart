import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false,home: TabApp(),));
}

class TabApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 3, 
      child: Scaffold(
        appBar: AppBar(
          actions: [
            Row(
              children: [
                Text('Profile', style: TextStyle(fontSize: 16)),
               Icon(Icons.person)
              ],
            ),
          ],
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.home), text: 'Home'),
              Tab(icon: Icon(Icons.star), text: 'Favorites'),
              Tab(icon: Icon(Icons.settings), text: 'Settings'),
            ],
          ),
        ),
      ),
    );
  }
}

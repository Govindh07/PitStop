import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(
    MaterialApp(
      home: MyApp(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onDoubleTap: () {
            showSheet(context);
          },
          child: Image.network(
            'https://images.unsplash.com/photo-1736251513671-3175c0896fb0?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
            errorBuilder: (context, error, stackTrace) {
              return Icon(
                Icons.error,
                size: 50,
                color: Colors.red,
              );
            },
          ),
        ),
      ),
    );
  }

  void showSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: FaIcon(
                  FontAwesomeIcons.whatsapp,
                  color: Colors.green,
                ),
                title: Text(
                  'WhatsApp',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                onTap: () {
                  // Add desired action for WhatsApp
                },
              ),

              ListTile(
                leading: FaIcon(
                  FontAwesomeIcons.facebook,
                  color: Colors.blue,
                ),
                title: Text(
                  'Facebook',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                onTap: () {
                  // Add desired action for WhatsApp
                },
              ),

              ListTile(
                leading: FaIcon(
                  FontAwesomeIcons.instagram,
                  color: Colors.pink,
                ),
                title: Text(
                  'Instagram',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                onTap: () {
                  // Add desired action for WhatsApp
                },
              ),

              ListTile(
                leading: FaIcon(
                  FontAwesomeIcons.telegram,
                  color: Colors.blueAccent,
                ),
                title: Text(
                  'Telegram',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                onTap: () {
                  // Add desired action for WhatsApp
                },
              ),

              ListTile(
                leading: FaIcon(
                  FontAwesomeIcons.share,
                  color: Colors.black,
                ),
                title: Text(
                  'Share',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                onTap: () {
                  // Add desired action for WhatsApp
                },
              ),

              ListTile(
                leading: FaIcon(
                  FontAwesomeIcons.copy,
                  color: Colors.black,
                ),
                title: Text(
                  'Copy',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                onTap: () {
                  // Add desired action for WhatsApp
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

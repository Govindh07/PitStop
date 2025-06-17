import 'package:flutter/material.dart';
import 'package:main_projects/PitStop/Widget/HomePage.dart';
import 'package:main_projects/PitStop/Widget/CarsPage.dart';
import 'package:main_projects/PitStop/Widget/FavouritePage.dart';
import 'package:main_projects/PitStop/Widget/ProfilePage.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  int _selectedIndex = 2;

  void _onItemTapped(int index) {
    if (index == _selectedIndex) return;
    setState(() {
      _selectedIndex = index;
    });

    if (index == 0) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const HomePage()));
    } else if (index == 1) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => CarsListPage()));
    } else if (index == 3) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => ProfilePage()));
    } else if (index == 4) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => FavoritesPage()));
    }
  }

  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text('Settings', style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          ListTile(
            leading: const Icon(Icons.dark_mode, color: Colors.yellow),
            title: const Text('Dark Mode', style: TextStyle(color: Colors.white)),
            trailing: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              decoration: BoxDecoration(
                color: isDarkMode ? Colors.yellow : Colors.grey,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Switch(
                value: isDarkMode,
                onChanged: (value) {
                  setState(() {
                    isDarkMode = value;
                  });
                },
                activeColor: Colors.black,
              ),
            ),
          ),
          const Divider(color: Colors.white24),
          ListTile(
            leading: const Icon(Icons.privacy_tip, color: Colors.yellow),
            title: const Text('Privacy Policy', style: TextStyle(color: Colors.white)),
            onTap: () {
              // Handle action
            },
          ),
          const Divider(color: Colors.white24),
          ListTile(
            leading: const Icon(Icons.help_outline, color: Colors.yellow),
            title: const Text('Help & Support', style: TextStyle(color: Colors.white)),
            onTap: () {
              // Handle action
            },
          ),
          const Divider(color: Colors.white24),
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.yellow),
            title: const Text('Logout', style: TextStyle(color: Colors.white)),
            onTap: () {
              // Handle logout
            },
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.yellow,
        unselectedItemColor: Colors.white70,
        backgroundColor: Colors.black,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.directions_car), label: 'Cars'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Cart'),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(debugShowCheckedModeBanner: false,home: HistoryPage(),themeMode: ThemeMode.dark,));
}

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('History',style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.yellowAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const Text(
              'Your Activity History',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 20),
            _buildHistoryCard('Car Rental - Lamborghini', '22 June 2025'),
            _buildHistoryCard('Payment - ₹2500', '21 June 2025'),
            _buildHistoryCard('Car Returned - Ferrari', '20 June 2025'),
            _buildHistoryCard('Car Rental - McLaren', '18 June 2025'),
          ],
        ),
      ),
    );
  }

  Widget _buildHistoryCard(String title, String date) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.only(bottom: 15),
      child: ListTile(
        leading: const Icon(Icons.history, color: Colors.green),
        title: Text(title),
        subtitle: Text(date),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class PaymentApp extends StatelessWidget {
  const PaymentApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment Gateway'),
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.yellow),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Image.network('https://upload.wikimedia.org/wikipedia/commons/thumb/5/5e/Visa_Inc._logo.svg/2560px-Visa_Inc._logo.svg.png', height: 80),
            const SizedBox(height: 20),
            Image.network('https://upload.wikimedia.org/wikipedia/commons/thumb/0/04/Mastercard-logo.png/1200px-Mastercard-logo.png', height: 60),
            const SizedBox(height: 40),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Card Number',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.credit_card),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Expiry Date',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.calendar_today),
              ),
              keyboardType: TextInputType.datetime,
            ),
            const SizedBox(height: 20),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'CVV',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.lock),
              ),
              obscureText: true,
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Payment processing...')));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.yellow,
                foregroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 50),
              ),
              child: const Text('Pay Now'),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:main_projects/PitStop/Model/BookingModel.dart';

class BookingDetailPage extends StatelessWidget {
  final Booking booking;

  const BookingDetailPage({super.key, required this.booking});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Booking Details')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Car: ${booking.carName}', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text('Booking Date: ${booking.bookingDate}'),
            Text('Pickup Location: ${booking.pickupLocation}'),
            Text('Drop Location: ${booking.dropLocation}'),
            Text('Price: ₹${booking.price.toStringAsFixed(2)}'),
          ],
        ),
      ),
    );
  }
}

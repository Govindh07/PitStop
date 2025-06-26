
import 'package:flutter/material.dart';
import 'package:main_projects/PitStop/Provider/HistoryProvider.dart';
import 'package:provider/provider.dart';

class HistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final historyProvider = Provider.of<HistoryProvider>(context);
    final bookings = historyProvider.bookings;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Booking History'),
      ),
      body: bookings.isEmpty
          ? const Center(child: Text('No bookings found'))
          : ListView.builder(
        itemCount: bookings.length,
        itemBuilder: (context, index) {
          final booking = bookings[index];
          return Card(
            margin: const EdgeInsets.all(8),
            child: ListTile(
              title: Text(booking.carName),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Booking Date: ${booking.bookingDate}'),
                  Text('Pickup: ${booking.pickupLocation}'),
                  Text('Drop: ${booking.dropLocation}'),
                  Text('Pickup Date: ${booking.pickupDate.toLocal()}'.split(' ')[0]),
                  Text('Time Slot: ${booking.timeSlot}'),
                  Text('Price: ₹${booking.price.toStringAsFixed(2)}'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}


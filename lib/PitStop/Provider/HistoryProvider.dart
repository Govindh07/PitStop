import 'package:flutter/material.dart';
import '../Model/BookingModel.dart';

class HistoryProvider with ChangeNotifier {
  final List<Booking> _bookings = [];

  List<Booking> get bookings => _bookings;

  void addBooking(Booking booking) {
    _bookings.add(booking);
    notifyListeners();
  }
}

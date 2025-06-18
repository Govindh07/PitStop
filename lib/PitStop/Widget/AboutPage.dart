import 'package:flutter/material.dart';
import 'HomePage.dart';

void main(){
  runApp(MaterialApp(debugShowCheckedModeBanner: false,home: AboutPage(),));
}

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: Text('About PitStop',style: TextStyle(color: Colors.white),),
        leading: IconButton(
          icon: Icon(Icons.arrow_back,color: Colors.white,),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => HomePage()),
            );
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Center(
              child: Icon(Icons.directions_car, size: 80, color: Colors.blueAccent),
            ),
            const SizedBox(height: 20),
            Center(
              child: Text(
                "PitStop",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "PitStop is a premium car rental app that offers a wide selection of cars with a seamless booking experience. Explore, compare, and rent your favorite cars right from your mobile device.",
              style: TextStyle(fontSize: 16, color: Colors.grey[300]),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 20),
            Text(
              "🚗 Key Features",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blueAccent),
            ),
            const SizedBox(height: 10),
            featureItem("• Browse luxury and sport cars"),
            featureItem("• Mark favorites for quick access"),
            featureItem("• View car details and ratings"),
            featureItem("• Rent a car instantly with secure checkout"),
            featureItem("• Light & Dark theme supported"),
            const SizedBox(height: 20),
            Text(
              "🛠 Technologies Used",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blueAccent),
            ),
            const SizedBox(height: 10),
            featureItem("• Flutter & Dart"),
            featureItem("• Provider for state management"),
            featureItem("• Carousel Slider"),
            featureItem("• Firebase (optional for backend)"),
            const SizedBox(height: 20),
            Text(
              "📬 Contact Us",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blueAccent),
            ),
            const SizedBox(height: 10),
            featureItem("• Email: support@pitstop.com"),
            featureItem("• Website: www.pitstop-rentals.com"),
            featureItem("• Instagram: @pitstop_rentals"),
            const SizedBox(height: 20),
            Text(
              "💡 Credits",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blueAccent),
            ),
            const SizedBox(height: 10),
            Text(
              "Developed by Govindh V\n© 2025 PitStop. All rights reserved.",
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

  Widget featureItem(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Text(
        text,
        style: TextStyle(fontSize: 15, color: Colors.white),
      ),
    );
  }
}
